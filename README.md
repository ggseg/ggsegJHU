
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ggsegJHU

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/LCBC-UiO/ggsegJHU.svg?branch=master)](https://travis-ci.org/LCBC-UiO/ggsegJHU)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/LCBC-UiO/ggsegJHU?branch=master&svg=true)](https://ci.appveyor.com/project/LCBC-UiO/ggsegJHU)
[![Codecov test
coverage](https://codecov.io/gh/LCBC-UiO/ggsegJHU/branch/master/graph/badge.svg)](https://codecov.io/gh/LCBC-UiO/ggsegJHU?branch=master)
<!-- badges: end -->

Contains data for ggseg and ggseg3d for the JHU white matter
segmentation.

Hua et al. (2008) NeuroImage, 39(1):336-347
[pubmed](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2724595/)

## Installation

You can install the released version of ggsegJHU from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("ggsegJHU")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("LCBC-UiO/ggsegJHU")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(ggsegJHU)
```

``` r
library(ggseg)

plot(jhu) +
  theme(legend.position = "bottom",
        legend.text = element_text(size = 7)) +
  guides(fill = guide_legend(ncol = 2))
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

``` r
library(ggseg3d)

ggseg3d(atlas = jhu_3d) %>% 
  add_glassbrain("left") %>% 
  pan_camera("right lateral")
```

<img src="man/figures/README-3d-plot.png" width="100%" />

Please note that the ‘ggsegJHU’ project is released with a [Contributor
Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project,
you agree to abide by its terms.
