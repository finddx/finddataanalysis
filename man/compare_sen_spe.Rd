% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compare_sen_spe.R
\name{compare_sen_spe}
\alias{compare_sen_spe}
\title{compare_sen_spe}
\usage{
compare_sen_spe(s1, s2, n1, n2, two.sided = TRUE)
}
\arguments{
\item{s1}{Sensitivity/specificity of the first group}

\item{s2}{Sensitivity/specificity of the second group}

\item{n1}{Total number of confirmed positives/negatives respectively in the first group}

\item{n2}{Total number of confirmed positives/negatives respectively in the second group}

\item{two.sided}{If TRUE, equivalence is tested, if FALSE, directional inferences are made}
}
\value{
A dataframe containing Z-Score and the P-value
}
\description{
Because these are two independent groups, a Z-score is calculated from the two proportions (i.e. sensitivities or specificities) to be compared. By default, the test is two tailed, but lower or upper tail can be specified in parameters.
}
\examples{
result.df <- data.frame(Tests = c("Test1", "Test2"), TP = c(82, 140), FN = c(18, 60))
result.df$N <- result.df$TP +result.df$FN
result.df$sen <- result.df$TP/result.df$N
compare_sen_spe(s1 = result.df$sen[1], s2 = result.df$sen[2], n1 = result.df$N[1], n2 = result.df$N[2],two.sided = TRUE)
}
\references{
Zhou XH, Obuchowski NA and McClish DK. Statistical Methods in Diagnostic Medicine. 2011;2:193-228
}
