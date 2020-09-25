rankhospital <- function(state, outcome, num) {
  data <- read.csv('outcome-of-care-measures.csv')
  # outcome_str = paste(outcome)
  data_by_state = data[which(data$State==state),]
  
  if(nrow(data_by_state) == 0) {
    stop('invalid state')
  }
  if(outcome %in% c('heart attack', 'pneumonia', 'heart failure')) {
    if(outcome == 'heart attack') {
      outcome_col <- 11
    } else if(outcome == "pneumonia") {
      outcome_col <- 23
    } else if(outcome == "heart failure") {
      outcome_col <- 17
    }
    data_by_state[outcome_col] <- lapply(data_by_state[outcome_col], as.numeric)
    sub <- data_by_state[, outcome_col]
    sub_new <- data_by_state[!is.na(sub), ]
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
    hospital[rankorder, 2]
    
  }else {
    stop("invalid outcome")
  }
  
}
