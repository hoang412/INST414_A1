
data <- read.csv("D:\\INST414\\Acquired_studios_by_EA_full.csv")

#count number of rows
num_row <- nrow(data)

#trimming any extra spaces
data$Status <- trimws(data$Status)
#count open and closed
value_count <- table(data$Status)

#percentage
percentage <- (value_count/num_row)*100
print(percentage)

#pie chart
percentage_labels <- paste0(names(percentage), ": ", round(percentage, 1), "%")
pie(percentage, 
    labels = percentage_labels, 
    main = "Open and Closed Percentage After Acquisition",
    col = c("lightcoral", "lightblue"))

