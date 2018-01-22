<!-- Guidance: see https://github.com/phnmnl/phenomenal-h2020/wiki/The-Guideline-for-Container-GitHub-Respository-README.md-Creation -->

![Logo](w4m.png)

# W4M Transformation
Version: 2.2.2

## Short description

<!-- 
This should only be 20 to 40 words, hopefully a single sentence.
-->

Transforms the dataMatrix intensity values.

## Description

Performs transformation of the dataMatrix intensity values aimed at stabilizing variance.
For mass spectrometry data, where multiplicative noise has been reported, logarithm transformation can be useful to make the peak intensity variance independent of the intensity mean (see for example Veselkov et al, 2011).
For the logarithm transformations, log(1+X) is used (to avoid returning -Inf for 0 values); NA values remain unchanged

## Key features

- Datamatrix.
- Intensity.

## Functionality

- Statistical Analysis

## Approaches

- Metabolomics / Targeted
- Metabolomics / Untargeted

## Data Analysis

- Statistics

## Screenshots

## Tool Authors

- [Étienne Thévenot](http://etiennethevenot.pagesperso-orange.fr) (CEA, LIST, MetaboHUB).

## Container Contributors

- Pierrick Roger (CEA).

## Website

- http://workflow4metabolomics.org

## Git Repository

- https://github.com/phnmnl/container-transformation.git

## Installation 

For local individual installation:

```bash
docker pull docker-registry.phenomenal-h2020.eu/phnmnl/transformation
```

## Usage Instructions

For direct docker usage:

```bash
docker run docker-registry.phenomenal-h2020.eu/phnmnl/transformation ...
```

## Publications

<!-- Guidance:
Use AMA style publications as a list (you can export AMA from PubMed, on the Formats: Citation link when looking at the entry).
-->

 - Veselkov et al (2011). Optimized Preprocessing of Ultra-Performance Liquid Chromatography/Mass Spectrometry Urinary Metabolic Profiles for Improved Information Recovery. Analytical Chemistry, 83:5864-5872. <http://dx.doi.org/10.1021/ac201065j>
