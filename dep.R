
getProsody <- function(wdrow){
  cat(class(wdrow))
  prosody <- ""
  cols <- c("V", "OBJ","PP1")
  class(wdrow['Strongest'])
  if (wdrow['Strongest'] != "NONE" && is.na(wdrow['Strongest']) != TRUE) {
    prosody <- paste(wdrow['Strongest'], ">")
  }
  
  for(i in 1:length(cols)) {
    if (wdrow[paste("Break_", cols[i], sep="")] == "YES" && 
        cols[i] != wdrow['Strongest'] && 
        cols[i] != wdrow['Weakest']
    ){
      prosody <- paste(prosody,cols[i])
    }
    
  }
  cat("2",prosody)
  if (wdrow["Weakest"] != "NONE" && is.na(wdrow['Weakest']) != TRUE) {
    prosody <- paste(prosody, ">", wdrow['Weakest'])
  }
  cat("3",prosody)
  prosody <- trimws(gsub("> >", ">", prosody))
  if(substr(prosody,1,1) == ">"){
    prosody <- str_sub(prosody,2,-1)
  }
  if(str_sub(prosody,-1,-1) == ">"){
    prosody <- str_sub(prosody,-2)
  }
  return (prosody);
}