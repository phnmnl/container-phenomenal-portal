
![Logo](portal_logo.gif)

# PhenoMeNal Portal
Version: 0.2.2

## Short Description

Open source software for identifying and quantifying metabolites in NMR spectra.

## Description

Containerized rNMR: open source software for identifying and quantifying metabolites in NMR spectra, developed by the team around Ian A. Lewis (University of Calgary), see http://http://rnmr.nmrfam.wisc.edu/.

rNMR is an open source software package for visualizing and interpreting one and two dimensional NMR data. In contrast to most existing 2D NMR software, rNMR is specifically designed for high-throughput assignment and quantification of small molecules. As a result, rNMR supports extensive batch manipulation of plotting parameters and has numerous tools for expediting repetitive resonance assignment and quantification tasks.

The most powerful features of rNMR are built around the region of interest (ROI) concept. ROIs are user-defined chemical shift ranges that can be used to visualize and analyze hundreds of NMR signals from multiple spectra simultaneously. Unlike peak tables, ROIs are dynamic representations of the underlying NMR data. Users can actively manipulate the chemical shift ranges of ROIs while simultaneously visualizing the impact these changes will have on resonance assignments and quantification of signals.

## Key features

- NMR Processing

## Functionality

- Annotation / NMR
- Post-processing

## Approaches

- Metabolomics / Targeted
  
## Instrument Data Types

- NMR / 1D NMR
- NMR / 2D NMR / 2D TOCSY
- NMR / 1H NMR

## Screenshots

Screen shots obtained from the original PhenoMeNal Portal page.
![screenshot](screenshots/s1.jpg)

## Tool Authors

- Sijin He (EMBL-EBI)

## Container Contributors

- [Sijin He](https://github.com/sh107) (EMBL-EBI)

## Website

- http://portal.phenomenal-h2020.eu/


## Git Repository

- https://github.com/phnmnl/container-phenomenal-portal.git

## Installation 

For local individual installation:

```bash
docker pull docker-registry.phenomenal-h2020.eu/phnmnl/rnmr
```

## Usage Instructions

For direct docker usage:

```bash
docker run -d -p 3000:80 -it portal:0.1.19 nginx -g 'daemon off;'
```

## Publications

<!-- Guidance:
Use AMA style publications as a list (you can export AMA from PubMed, on the Formats: Citation link when looking at the entry).
IMPORTANT: Publications sectio must be placed at the end and cannot be emptied!
-->

- 
