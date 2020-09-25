best <- function(state,outcome) {
  data <- read.csv('outcome-of-care-measures.csv')
  # outcome_str = paste(outcome)
  data_by_state = data[which(data$State==state),]
  
  if(nrow(data_by_state) == 0) {
    stop('invalid state')
  }
  if(outcome %in% c('heart attack', 'pneumonia', 'heart failure')) {
    if(outcome == 'heart attack') {
      sub <- subset(data_by_state,select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
    } else if(outcome == "pneumonia") {
      sub <- subset(data_by_state,select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
    } else if(outcome == "heart failure") {
      sub <- subset(data_by_state,select=c(Hospital.Name, Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
    }
    sub[sub[,2] == min(as.numeric(sub[,2]), na.rm = TRUE),]
    
  }else {
    stop("invalid outcome")
  }
  
}

best("AK", "pneumonia")
