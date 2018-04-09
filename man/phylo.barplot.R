\name{phylo.barplot}
\alias{phylo.barplot}
\title{Plot a phylogenetic tree and associated barplot(s) based on same species list}
\usage{
phylo.barplot(phylo,dat,SE=NULL,var.lab=NULL, ...)
}
\description{
The function could be used as plotting a phylogenetic tree and associated with barplot. It is very convenient to visualize the traits on phylogenetic tree. 
}

\arguments{
	\item{phylo} {a phylogenetic tree.}
	\item{dat} {a data.frame including continous traits}
	\item{SE} {an associated \code{\link{barplot}} with standard error (\code{\link{se}}) }
	\item{var.lab} {the labs of trait(s) used for a \code{\link{barplot}}}
	\item{...} {further arguments passed to the \code{\link{plot.phylo}}}
}
\seealso{ 
\code{\link{plot.phylo}}, \code{\link{se}}, \code{\link{barplot}} 
}

\examples{
tre = "(((((((((salix_psammophila,salix_cheilophila)salix,populus_alba)salicaceae,(((((((hedysarum_leave,caragana_korshinskii),astragalus_adsurgens),glycyrrhiza_uralensis)irlc,lespedeza_davurica),thermopsis_lanceolata),radix_polygalae),((hippophae_rhamnoides,ulmus_pumila),potentilla_longifolia)rosales)),erodium_stephanianum),((((chenopodium_glaucum,agriophyllum_squarrosum,corispermum_hyssopifolium,amaranthus_retroflexus)amaranthaceae,(melandrium_apricum,stellaria_media)caryophyllaceae),(polygonum_hydropiper,Atraphaxis_bracteata_var._latifolia)polygonaceae)caryophyllales,((((echinops_gmelini,(artemisia_mongolica,artemisia_ordosica)artemisia),carpesium_abrotanoides,mulgedium_tataricum,saussurea_amara,heteropappus_altaicus)asteraceae,ferula_borealis),((((thymus_mongolicus,dracocephalum_moldavica),incarvillea_sinensis),convolvulus_arvensis),tournefortia_sibirica,(cynanchum_chinense,cynanchum_komarovii)cynanchum)))),thalictrum_squarrosum)eudicots,(setaria_viridis,(stipa_krylovii,(phragmites_australis,pennisetum_centrasiaticum)),calamagrostis_adans,psammochloa_villosa,cleistogenes_squarrosa,leymus_secalinus,achnatherum_sibiricum)poaceae)poales_to_asterales,((sabina_vulgaris,pinus_sylvestnis_var._mongolica)pinales,ephedra_sinica))seedplants,equisetum_ramosissimum)euphyllophyte;"

cat(tre, file = "ex.tre", sep = "\n")
tre <- ape::read.tree("ex.tre")
				

tre$tip.label <- paste(substr(tre$tip.label,1,1), substr(tre$tip.label,2,100), sep='')

N = length(tre$tip.label)

# traits mean
set.seed(1)
traits <- data.frame(species = tre$tip.label, trt1 = runif(N, 0, 1), trt2 = runif(N, 
				0, 100))
# traits se 
set.seed(1)
traits.se = data.frame(species = tre$tip.label, trt1 = runif(N, 0, 0.1), trt2 = runif(N, 
				0, 10))
head(traits.se)

# match dat according to species name
traits <- traits[match(tre$tip.label,traits$species),]
traits.se <- traits.se[match(tre$tip.label,traits.se$species),]

# two traits barplot and a phylogenetic tree
phylo.barplot(phylo=tre,dat=traits,SE=traits.se,var.lab=c("Trait 1","Trait 2"),cex=0.7)


traits2=traits[,1:2]
traits.se2=traits[,1:2]
# one trait barplot and a phylogenetic tree
phylo.barplot(phylo=tre,dat=traits2,SE=traits.se2,var.lab="Trait 1",cex=0.6)


}
