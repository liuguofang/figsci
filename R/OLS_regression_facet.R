OLS_regression_facet <- function(data, x, y, group = NULL, facet = NULL,
                                 nrow = NULL, ncol = NULL, alpha = 0.05,title.pos=0.5) {
  library(ggplot2)
  library(ggpmisc)
  library(dplyr)
  if (!requireNamespace("ggthemes", quietly = TRUE)) stop("Please install ggthemes package.")

  group_vars <- c()
  if (!is.null(group)) group_vars <- c(group_vars, group)
  if (!is.null(facet)) group_vars <- c(group_vars, facet)

  if (length(group_vars) > 0) {
    signif_df <- data %>%
      group_by(across(all_of(group_vars))) %>%
      summarise(
        p_value = tryCatch({
          summary(lm(.data[[y]] ~ .data[[x]]))$coefficients[2, 4]
        }, error = function(e) NA),
        .groups = "drop"
      ) %>%
      mutate(signif = !is.na(p_value) & p_value < alpha)
    data <- left_join(data, signif_df[, c(group_vars, "signif")], by = group_vars)
  } else {
    p_value <- tryCatch({
      summary(lm(data[[y]] ~ data[[x]]))$coefficients[2, 4]
    }, error = function(e) NA)
    data$signif <- !is.na(p_value) & p_value < alpha
  }

  aes_main <- aes_string(x = x, y = y)
  if (!is.null(group)) aes_main <- modifyList(aes_main, aes_string(color = group, group = group))
  p <- ggplot(data, aes_main) + geom_point()

  if (any(data$signif %in% TRUE)) {
    p <- p +
      geom_smooth(
        data = data %>% filter(signif),
        method = "lm", se = FALSE
      )
  }

  p <- p +
    stat_poly_eq(
      aes_string(label = "paste(..rr.label.., ..p.value.label.., sep = \"*', '*\")",
                 group = group, color = group),
      formula = y ~ x, parse = TRUE
    )

  if (!is.null(facet)) {
    p <- p + facet_wrap(
      as.formula(paste("~", facet)),
      scales = "free",
      nrow = nrow, ncol = ncol
    )
  }

  p <- p + ggthemes::theme_few()
  p <- p + ggthemes::theme_few() + theme(strip.text.x = element_text(hjust = title.pos))

  return(p)
}