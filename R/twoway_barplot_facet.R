twoway_barplot_facet <- function(data, x.factor, group, value, facet_row = NULL,
                                 facet_col = NULL, method = "HSD.test",scales = "fixed") {
  lapply(c("agricolae", "dplyr", "ggplot2", "rlang"), library, character.only = TRUE)

  se <- function(x) sd(x, na.rm = TRUE) / sqrt(sum(!is.na(x)))
  data <- data %>%
    dplyr::rename(x = !!x.factor, g = !!group, y = !!value)
  if (!is.null(facet_row)) data <- data %>% dplyr::rename(facet_row_var = !!facet_row)
  if (!is.null(facet_col)) data <- data %>% dplyr::rename(facet_col_var = !!facet_col)

  facet_vars <- c()
  if (!is.null(facet_row)) facet_vars <- c(facet_vars, "facet_row_var")
  if (!is.null(facet_col)) facet_vars <- c(facet_vars, "facet_col_var")

  split_data <- if(length(facet_vars) > 0) group_split(data, across(all_of(facet_vars))) else list(data)

  loc_letters_list <- lapply(split_data, function(subdf) {
    if(nrow(subdf) == 0) return(NULL)
    facet_info <- subdf[1, facet_vars, drop=FALSE]
    loc_letters <- lapply(split(subdf, subdf$g), function(df_g) {
      res <- tryCatch(get(method)(aov(y ~ x, data = df_g), "x"), error = function(e) NULL)
      if (is.null(res) || is.null(res$groups) || nrow(res$groups) == 0) return(NULL)
      out <- data.frame(
        g = rep(unique(df_g$g), nrow(res$groups)),
        x = rownames(res$groups),
        loc_group = toupper(res$groups$groups)
      )
      if(length(facet_vars) > 0) out <- cbind(out, facet_info)
      out
    })
    do.call(rbind, loc_letters)
  })
  loc_letters_df <- do.call(rbind, loc_letters_list)

  cross_letters_list <- lapply(split_data, function(subdf) {
    if(nrow(subdf) == 0) return(NULL)
    facet_info <- subdf[1, facet_vars, drop=FALSE]
    cross_letters <- lapply(split(subdf, subdf$x), function(df_x) {
      res <- tryCatch(get(method)(aov(y ~ g, data = df_x), "g"), error = function(e) NULL)
      if (is.null(res) || is.null(res$groups) || nrow(res$groups) == 0) return(NULL)
      out <- data.frame(
        x = rep(unique(df_x$x), nrow(res$groups)),
        g = rownames(res$groups),
        cross_group = res$groups$groups
      )
      if(length(facet_vars) > 0) out <- cbind(out, facet_info)
      out
    })
    do.call(rbind, cross_letters)
  })
  cross_letters_df <- do.call(rbind, cross_letters_list)

  join_vars <- c("x", "g", facet_vars)
  if(!is.null(loc_letters_df) && !is.null(cross_letters_df)){
    final_letters <- dplyr::left_join(loc_letters_df, cross_letters_df, by = join_vars)
    final_letters$letters <- paste0(final_letters$loc_group, final_letters$cross_group)
  } else {
    final_letters <- data.frame()
  }

  group_vars <- c("x", "g", facet_vars)
  summary_df <- data %>%
    dplyr::group_by(across(all_of(group_vars))) %>%
    dplyr::summarise(
      mean_value = mean(y, na.rm = TRUE),
      se_value = se(y),
      .groups = "drop"
    )
  if(nrow(final_letters) > 0){
    summary_df <- dplyr::left_join(summary_df, final_letters, by = join_vars)
  } else {
    summary_df$letters <- NA
  }

  p <- ggplot(summary_df, aes(x = x, y = mean_value, fill = g)) +
    geom_bar(stat = "identity", position = position_dodge(width = 0.9)) +
    geom_errorbar(aes(ymin = mean_value - se_value, ymax = mean_value + se_value),
                  width = 0.2, position = position_dodge(width = 0.9)) +
    geom_text(aes(label = letters, y = mean_value + se_value + 0.05 * max(mean_value, na.rm = TRUE)),
              position = position_dodge(width = 0.9), vjust = 0, size = 4, color = "black", na.rm = TRUE) +
    labs(y = value, x = x.factor, fill = group) +
    theme_bw()
  if (!is.null(facet_row) & !is.null(facet_col)) {
    p <- p + facet_grid(facet_row_var ~ facet_col_var,, scales = scales)
  } else if (!is.null(facet_row)) {
    p <- p + facet_grid(facet_row_var ~ .,, scales = scales)
  } else if (!is.null(facet_col)) {
    p <- p + facet_grid(. ~ facet_col_var,, scales = scales)
  }
  return(p)
}

