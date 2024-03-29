# WARNING - Generated by {fusen} from /dev/flat_performance_evaluation.Rmd: do not edit by hand

#' compare_sen_spe
#' 
#' Because these are two independent groups, a Z-score is calculated from the two proportions (i.e. sensitivities or specificities) to be compared. By default, the test is two tailed, but lower or upper tail can be specified in parameters.
#' 
#' @param s1 Sensitivity/specificity of the first group
#' @param s2 Sensitivity/specificity of the second group
#' @param n1 Total number of confirmed positives/negatives respectively in the first group
#' @param n2 Total number of confirmed positives/negatives respectively in the second group
#' @param two.sided If TRUE, equivalence is tested, if FALSE, directional inferences are made
#'
#' @return A dataframe containing Z-Score and the P-value
#' @references Zhou XH, Obuchowski NA and McClish DK. Statistical Methods in Diagnostic Medicine. 2011;2:193-228
#' @export
#' @examples
#' result.df <- data.frame(Tests = c("Test1", "Test2"), TP = c(82, 140), FN = c(18, 60))
#' result.df$N <- result.df$TP +result.df$FN
#' result.df$sen <- result.df$TP/result.df$N
#' compare_sen_spe(s1 = result.df$sen[1], s2 = result.df$sen[2], n1 = result.df$N[1], n2 = result.df$N[2],two.sided = TRUE)
compare_sen_spe <- function(s1, s2, n1, n2, two.sided = TRUE){
  z <- (s1 - s2)/sqrt((s1*(1-s1)/n1) + (s2*(1-s2)/n2))
  Z <- -abs(z)
  p <- ifelse(two.sided == TRUE, 2*pnorm(Z), pnorm(Z))
  result <- data.frame(Statistic = c("Z", "P"), Value = c(Z, p) )

  return(result)
}
