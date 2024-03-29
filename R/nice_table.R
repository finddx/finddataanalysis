# WARNING - Generated by {fusen} from /dev/flat_performance_evaluation.Rmd: do not edit by hand

#' nice_table
#' 
#' To create a well formatted table from the basic data frame version of the performance characteristic table generated using dplyr for subgroup analyses, where the data is not formatted in the long format necessarily.
#' 
#' @param data_var data frame
#' @param group_name Name of the grouping variable used in subgroups
#'
#' @return A nicely formatted DT table
#' @import DT
#' @export
#' @examples
#' library(dplyr)
#' df <- data.frame(Index1 = c(rep("Positive", 20), rep("Negative", 20)), Index2 = c(rep("Positive", 5), rep("Negative", 35)), Index3 = c(rep("Positive", 9), rep("Negative", 31)), Reference = c(rep("Positive", 10), rep("Negative", 30)), Sex = rep(c("M","F", "F", "M"), 10))
#' 
#' sex_ana <- df %>% group_by(Sex) %>% group_modify(~ performance_eval_auto(
#'   data_var = (.x),
#'   list_index =c("Index1", "Index2"),
#'   ref = "Reference",
#'   conf.level = 0.95,
#'   index_names = NULL,
#'   labels = "Test",
#'   forest_plot = FALSE, #!!!
#'   table_output = FALSE, #!!!
#'   file_name = "performance_eval",
#'   data_long = FALSE, #!!!
#'   group_var = NULL
#' ))
#' nice_table(sex_ana, "Sex")
nice_table <- function(data_var, group_name){
      table <- as.data.frame(data_var)
      table$Group <- table[,c(group_name)]
    sens_ci_text <- paste0("[", format(table$SensLower, nsmall = 1), 
        "-", format(table$SensUpper, nsmall = 1), "]")
    spe_ci_text <- paste0("[", format(table$SpeLower, nsmall = 1), 
        "-", format(table$SpeUpper, nsmall = 1), "]")
    BA_ci_text <- paste0("[", format(table$BAlower, nsmall = 1), 
        "-", format(table$BAupper, nsmall = 1), "]")
    DOR_ci_text <- paste0("[", format(table$DORLower, nsmall = 1), 
        "-", format(table$DORUpper, nsmall = 1), "]")
  ppv_ci_text <- paste0('[', format(table$PPVLower, nsmall = 1), '-', format(table$PPVUpper, nsmall = 1), ']')
  npv_ci_text  <- paste0('[', format(table$NPVLower, nsmall = 1), '-', format(table$NPVUpper, nsmall = 1), ']')
  acc_ci_text   <- paste0('[', format(table$ACCLower, nsmall = 1), '-', format(table$ACCUpper, nsmall = 1), ']')

    
    data_to_return_1 <-
      tibble(
        Test = table$Test,
        Group = table$Group,
        N = table$N,
        TP = table$TP,
        FP = table$FP,
        FN = table$FN,
        TN = table$TN,
        Sensitivity = table$Sensitivity,
        `Sensitivity [95%CI]` = sens_ci_text,
        Specificity = table$Specificity,
        `Specificity [95%CI]` = spe_ci_text,
        `Balanced Accuracy` = table$Balanced_Accuracy,
        `B. Accuracy [95%CI]` = BA_ci_text,
        DOR = table$DOR,
        `DOR [95%CI]` = DOR_ci_text,
        `PPV [95%CI]` = ppv_ci_text,
        NPV = table$NPV,
        `NPV [95%CI]` = npv_ci_text,
        Accuracy = table$Accuracy,
        `Accuracy [95%CI]` = acc_ci_text
      )
        return_table <- datatable(data_to_return_1,
          extensions = 'Buttons',
                options = list(dom = 'Blfrtip',
                               buttons = list(
                                 list(extend = 'copy', filename = "subgroup.analysis"),
                                 list(extend = 'csv', filename = "subgroup.analysis"),
                                 list(extend = 'excel', filename = "subgroup.analysis"),
                                 list(extend = 'pdf', filename = "subgroup.analysis")),
                               lengthMenu = list(c(10,-1),
                                                 c(10,"All"))))
    return(return_table)
}

