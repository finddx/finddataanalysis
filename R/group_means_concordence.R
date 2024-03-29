# WARNING - Generated by {fusen} from dev/flat_concordence.Rmd: do not edit by hand

#'  Group Means - Supplement for Concordance Analysis
#' 
#' Calculate group means of a continuous variable of interest in all possible combinations if agreements between three reference columns
#' 
#' @param data_var The data table
#' @param mean_var The continuous variable from which the mean will be calculated
#' @param var1 A bifactor variable with "Positive" and "Negative" results.
#' @param var2 A bifactor variable with "Positive" and "Negative" results.
#' @param var3 A bifactor variable with "Positive" and "Negative" results.
#'
#' @return Mean of a numeric column based on groups defined by combination of three reference columns 
#' 
#' @import checkmate
#' @import dplyr
#' @export
#' @examples
#'
#' df <- data.frame(Test1 = c(rep("Positive", 20), rep("Negative", 20)), Test2 = c(rep("Negative", 5), rep("Positive", 5), rep("Negative", 30)), Test3 = c(rep("Positive", 10), rep("Negative", 25), rep("Positive", 5)), MyVariable = sample(1:100, 40))
#'
#'
#' group_means_concordence(data_var = df, mean_var = "MyVariable", var1 = "Test1", var2 = "Test2", var3 = "Test3")
#'
group_means_concordence <- function(data_var, mean_var, var1, var2, var3) {
  All_pos        <- data_var %>% filter_at(vars(c(var1, var2, var3)), all_vars(. == 'Positive'))
  All_neg        <- data_var %>% filter_at(vars(c(var1, var2, var3)), all_vars(. == 'Negative'))
  v1P_v2N_v3N    <- data_var %>% filter_at(vars(var1) , all_vars(. == 'Positive')) %>% filter_at(vars(var2) , all_vars(. == 'Negative')) %>% filter_at(vars(var3) , all_vars(. == 'Negative'))
  v1N_v2P_v3N    <- data_var %>% filter_at(vars(var1) , all_vars(. == 'Negative')) %>% filter_at(vars(var2) , all_vars(. == 'Positive')) %>% filter_at(vars(var3) , all_vars(. == 'Negative'))
  v1N_v2N_v3P    <- data_var %>% filter_at(vars(var1) , all_vars(. == 'Negative')) %>% filter_at(vars(var2) , all_vars(. == 'Negative')) %>% filter_at(vars(var3) , all_vars(. == 'Positive'))
  v1P_v2P_v3N    <- data_var %>% filter_at(vars(var1) , all_vars(. == 'Positive')) %>% filter_at(vars(var2) , all_vars(. == 'Positive')) %>% filter_at(vars(var3) , all_vars(. == 'Negative'))
  v1N_v2P_v3P    <- data_var %>% filter_at(vars(var1) , all_vars(. == 'Negative')) %>% filter_at(vars(var2) , all_vars(. == 'Positive')) %>% filter_at(vars(var3) , all_vars(. == 'Positive'))
  v1P_v2N_v3P    <- data_var %>% filter_at(vars(var1) , all_vars(. == 'Positive')) %>% filter_at(vars(var2) , all_vars(. == 'Negative')) %>% filter_at(vars(var3) , all_vars(. == 'Positive'))
  #browser()
  data_to_return <- data.frame(Groups = c("All_pos", "All_neg", "v1P_v2N_v3N", "v1N_v2P_v3N", "v1N_v2N_v3P","v1P_v2P_v3N", "v1N_v2P_v3P", "v1P_v2N_v3P"),
                               Mean = c(mean(All_pos[,mean_var], na.rm = TRUE), mean(All_neg[,mean_var], na.rm = TRUE), mean(v1P_v2N_v3N[,mean_var], na.rm = TRUE), mean(v1N_v2P_v3N[,mean_var], na.rm = TRUE), mean(v1N_v2N_v3P[,mean_var], na.rm = TRUE), mean(v1P_v2P_v3N[,mean_var], na.rm = TRUE), mean(v1N_v2P_v3P[,mean_var], na.rm = TRUE), mean(v1P_v2N_v3P[,mean_var], na.rm = TRUE)),
                               Stdev = c( sd(All_pos[,mean_var], na.rm = TRUE),sd(All_neg[,mean_var], na.rm = TRUE),sd(v1P_v2N_v3N[,mean_var], na.rm = TRUE),sd(v1N_v2P_v3N[,mean_var], na.rm = TRUE),sd(v1N_v2N_v3P[,mean_var], na.rm = TRUE),sd(v1P_v2P_v3N[,mean_var]),sd(v1N_v2P_v3P[,mean_var], na.rm = TRUE),sd(v1P_v2N_v3P[,mean_var], na.rm = TRUE)))
  return(data_to_return)

}
