% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/format_colnames.R
\name{format_colnames}
\alias{format_colnames}
\title{format_colnames}
\usage{
format_colnames(data_frame, test1, test2)
}
\arguments{
\item{data_frame}{the data table generated by cohen_agreement}

\item{test1}{Names of the test}

\item{test2}{Name of the comparator}
}
\value{
Returns nicely formatted colnames
}
\description{
Edits the column names of the table generated by cohen_agreement, to make it more explicit.
}
\examples{

df <- data.frame(Test1 = c(rep("Positive", 20), rep("Negative", 20)), Test2 = c(rep("Positive", 30), rep("Negative", 10)))
results <- cohen_agreement(data_var = df, var1 = "Test1", var2 = "Test2")
print(results)
format_colnames(data_frame = results, test1 = "This Test", test2 = "The Other Test")
}
