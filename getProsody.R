# load working data
wd <- read.csv("working_data.csv")

substrRight <- function(x, n){
  substr(x, nchar(x)-n+1, nchar(x))
}

getProsodyVect <- function (data) {
  cols <- c("V", "OBJ","PP1")
  if(data$Strongest != "NONE" && is.na(data$Strongest) != TRUE){
    prosody <- paste(data$Strongest, ">")
  }

  for(i in 1:length(cols)) {
    if (wdrow[[paste("Break_", cols[i], sep="")]] == "YES"
        && wdrow$Strongest != cols[i]
        && wdrow$Weakest != cols[i]){
      prosody <- paste(prosody,cols[i])
    }
  }
  if(data$Weakest != "NONE" && is.na(data$Weakest) != TRUE
     && data$Weakest != data$Strongest){
    prosody <- paste(">", data$Weakest)
  }
  prosody <- trimws(gsub("> >", ">", prosody))
  if(substr(prosody,1,1) == ">"){
    prosody <- str_sub(prosody,2,-1)
  }
  if(str_sub(prosody,-1,-1) == ">"){
    prosody <- str_sub(prosody,-2)
  }
  return (prosody)
}

cat(getProsodyVect(wd))