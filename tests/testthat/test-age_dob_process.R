# WARNING - Generated by {fusen} from dev/flat_variable_manipulations.Rmd: do not edit by hand

# Load the testthat package
library(testthat)


# Create a test data frame with some example data
test_data <- data.frame(
  ID = 1:5,
  AGE = c(20, NA, 35, 45, NA),
  DOB = as.Date(c("1990-01-01", "1985-05-10", "1980-03-15", "1975-11-20", "1995-09-05")),
  DATE = as.Date(c("2022-01-01", "2022-03-20", "2022-04-15", "2022-06-10", "2022-08-30"))
)

# Define the expected output based on the test data
expected_output <- data.frame(
  ID = 1:5,
  AGE = c(20, NA, 35, 45, NA),
  DOB = as.Date(c("1990-01-01", "1985-05-10", "1980-03-15", "1975-11-20", "1995-09-05")),
  DATE = as.Date(c("2022-01-01", "2022-03-20", "2022-04-15", "2022-06-10", "2022-08-30")),
  AGE_CALC = c(20, 36.85969, 35, 45, 26.98426),
  AGE_CATEG = c("<30", "30-39", "30-39", "≥40", "<30") #by limits 30 and 40
)

#Use the function
  result <- age_dob_process(
    data.var = test_data,
    age.var = "AGE",
    dob.var = "DOB",
    date.var = "DATE",
    lim1 = 30,
    lim2 = 40,
  )
# Define the test case using testthat
test_that("age_dob_process calculates age and age groups correctly", {
  # Call the age_dob_process function with the test data

  
  # Check if the output matches the expected output
  expect_equal(result, expected_output, tolerance = 0.1)
})

