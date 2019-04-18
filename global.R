library(shiny)
# library(shinyrdiversity)
library(vegan)
library(rdiversity)
library(ggplot2)
library(ggrdiversity)
data(BCI, package = "vegan")
source("R/select_diversity.R")
source("R/whatisdiv.R")
source("R/whatisq.R")

##datasets
# Create datasets -------

tree.pop <- rowSums(BCI)
species.names <- names(tree.pop)
num.sp <- length(tree.pop)
num.trees <- sum(tree.pop)
mean.trees <- mean(tree.pop)

# all of the created datasets have the same total population number as the true data for fair comparison

#a dataset with only one species:
one.pop <- c(num.trees, rep(0, num.sp - 1))
#a dataset with the same number of species as the truth but one species makes up more than half of the total count
uneven.pop <- c(num.trees / 2, rep(0, num.sp - 1)) + rep(mean.trees / 2, num.sp)
# a dataset where successive species counts make up an increasing arithmetic sequence
mixed.pop <- (1:num.sp) / sum(1:num.sp) * num.trees
# a dataset where each species count is the same
even.pop <- rep(mean.trees, num.sp)
# a dataset where the species counts are randomly distributed
rand.pop <- as.vector(rmultinom(1, num.trees, rep(1 / num.sp, num.sp)))
# a dataset where the species counts are randomly distributed and are multiples of 50
rand50.pop <- as.vector(rmultinom(1, round(num.trees / 50), rep(1 / num.sp, num.sp))) * 50

# gather datasets in a list
all.pops <- list(true=tree.pop,one=one.pop, uneven=uneven.pop, mixed=mixed.pop, even=even.pop, rand=rand.pop, rand50=rand50.pop)

qvals <- seq(0,10,0.5)
