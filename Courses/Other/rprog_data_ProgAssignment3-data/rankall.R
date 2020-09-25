rankall <- function(outcome, num="best") {
  data <- read.csv('outcome-of-care-measures.csv')
  # outcome_str = paste(outcome)
  # data_by_state = data[which(data$State==state),]
  
  # if(nrow(data) == 0) {
  #   stop('invalid state')
  # }
  if(outcome %in% c('heart attack', 'pneumonia', 'heart failure')) {
    if(outcome == 'heart attack') {
      outcome_col <- 11
    } else if(outcome == "pneumonia") {
      outcome_col <- 23
    } else if(outcome == "heart failure") {
      outcome_col <- 17
    }
    data[outcome_col] <- lapply(data[outcome_col], as.numeric)
    sub <- data[, outcome_col]
    sub_new <- data[!is.na(sub), ]
    hospital <- sub_new[order(sub_new[, outcome_col], sub_new[,2]),]
    if (num == "best") {
      rankorder = 1
    }
    else if (num =="worst") {
      rankorder = nrow(hospital)
    }
    else {
      rankorder = num
    }
    names(hospital)[names(hospital) == "Hospital.Name"] <- "hospital"
    names(hospital)[names(hospital) == "State"] <- "state"
    hospital[c('hospital', 'state')]
    
  }else {
    stop("invalid outcome")
  }
}
r <- rankall("heart failure", 10)
as.character(subset(r, state == "NV")$hospital)