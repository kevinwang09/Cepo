% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotDensities.R
\name{plotDensities}
\alias{plotDensities}
\title{Plot densities}
\usage{
plotDensities(
  x,
  cepoOutput,
  nGenes = 2,
  assay = "logcounts",
  celltypeColumn,
  celltype = NULL,
  genes = NULL,
  plotType = c("histogram", "density"),
  color = NULL
)
}
\arguments{
\item{x}{a \code{\linkS4class{SummarizedExperiment}} or a \code{\linkS4class{SingleCellExperiment}} object.}

\item{cepoOutput}{an output from Cepo or doLimma/doVoom/doTtest/doWilcoxon functions}

\item{nGenes}{number of top genes from each celltype to plot. Default to 2.}

\item{assay}{a character ('logcounts' by default),
indicating the name of the assays(x) element which stores the expression data (i.e., assays(x)$name_assays_expression).
We strongly encourage using normalized data, such as counts per million (CPM) or log-CPM.}

\item{celltypeColumn}{a character, indicating the name of the name of the cell type column in the colData(x).}

\item{celltype}{a character, indicating the name of the cell type to plot. Default is NULL which selects all celltypes in the cepoOutput.}

\item{genes}{a character vector, indicating the name of the genes to plot. Default to NULL, so that 2 top genes from each celltype will be plotted.}

\item{plotType}{Either 'histogram' or 'density'}

\item{color}{a named color vector. The names should correspond to the \code{celltype} argument above}
}
\value{
A \code{\link{ggplot}} object
with cell-type specific densities for a gene.

A \code{\link{ggplot}} object.
}
\description{
Plot densities
}
\examples{
library(SingleCellExperiment)
data('cellbench', package = 'Cepo')
cellbench
cepoOutput <- Cepo(logcounts(cellbench), cellbench$celltype)

plotDensities(
  x = cellbench,
  cepoOutput = cepoOutput,
  assay = 'logcounts',
  plotType = 'histogram',
  celltypeColumn = 'celltype'
)

plotDensities(
  x = cellbench,
  cepoOutput = cepoOutput,
  genes = c('PLTP', 'CPT1C', 'MEG3', 'SYCE1', 'MICOS10P3', 'HOXB7'),
  assay = 'logcounts',
  plotType = 'histogram',
  celltypeColumn = 'celltype'
)
}
