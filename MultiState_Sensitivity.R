MultiState_Sensitivity = function( tree, x) {

table <- matrix(nrow=length(tree), ncol=9)
colnames(table) <- c("N.Tree", "q12","q13","q23","q21", "q31","q32","AICc","logL")
table <- data.frame(table)
for (i in 1:length(tree)) {
  fitModel=fitDiscrete(tree[[i]],x,model="ARD")
  table[i,1]=i
  table[i,2]=as.numeric(fitModel$opt$q12)
  table[i,3]=as.numeric(fitModel$opt$q13)
  table[i,4]=as.numeric(fitModel$opt$q23)
  table[i,5]=as.numeric(fitModel$opt$q21)
  table[i,6]=as.numeric(fitModel$opt$q31)
  table[i,7]=as.numeric(fitModel$opt$q32)
  table[i,8]=as.numeric(fitModel$opt$aicc)
  table[i,9]=as.numeric(fitModel$opt$lnL)
  }
  return(table)
}