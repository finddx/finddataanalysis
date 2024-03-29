# WARNING - Generated by {fusen} from dev/flat_composite_reference.Rmd: do not edit by hand

#' categorize_result
#' 
#' Categorize a subject as "Positive" or "Negative", based on a variable of interest and a specified threshold. The values are bigger or equal to the threshold are categorized as "Positive", others "Negative".
#' A list of thresholds can be provided.
#' 
#' @param dataframe The data table containing test results
#' @param variable A continuous variable
#' @param thresholds The thresholds to be applied
#'
#' @return Data table with the categorization added
#' 
#' @export
#' @examples
#'
#' df <- data.frame(results = c(sample(1:100, 50, replace=TRUE)))
#' categorize_result(dataframe = df, variable = "results", thresholds = 50)
categorize_result <- function(dataframe, variable, thresholds){
 for(i in thresholds){
   #browser()
   dataframe <- dataframe %>% mutate (col = ifelse(as.numeric(dataframe[,variable]) >=i, "Positive", "Negative" ))
   dataframe[,"col"]<-  replace(dataframe[,"col"], is.na(dataframe[,"col"]), "Negative")
   dataframe <- plyr::rename(dataframe,c("col"= paste0("Result", i)))
 }
 return(dataframe)
}
