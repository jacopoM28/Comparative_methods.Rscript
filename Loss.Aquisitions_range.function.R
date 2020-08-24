####Arguments:
#tree = phylogenetic tree
#x = named vector with character states for each tip of the tree
#Endprob = maximal improbability of re-aquisition
#nsim = number of simulation makes by make.simmap
#interval.prob = interval for improbabilities
#StartProb = first improbability value
#StarRates = Starting loss rate
#EndRates = Ending loss rate
#Interval.rates = Interval for loss rate

Stochastic_range<-function(tree, x, losses, EndProb, nsim, interval.prob,
                           StartProb, StartRates, EndRates, interval.rates) {

  l=seq(StartRates, EndRates, interval.rates)
  j=seq(StartProb,EndProb, interval.prob)

  mean_transitions=matrix(nrow=0, ncol=4) 
  colnames(mean_transitions) <- c("q01","q10","gains","losses")
  mean_transitions=data.frame(mean_transitions)

  mean_transitions_tmp=matrix(nrow=1, ncol=5) 
  colnames(mean_transitions_tmp) <- c("q01","q10","gains","losses","improbability")
  mean_transitions_tmp=data.frame(mean_transitions_tmp)

    for(k in 1:length(l)){
      for(i in 1:length(j)) {
    
        Q=matrix(c(-(l[k]/j[i]),l[k],(l[k]/j[i]),-l[k]),2,2)
        rownames(Q)<-colnames(Q)<-c(0,1)
    
        Object=make.simmap(tree=tree,x=x, Q=Q,nsim=nsim)
        Object=describe.simmap(Object)
        mean_transitions_tmp[1,1]=l[k]/j[i]
        mean_transitions_tmp[1,2]=l[k]
        mean_transitions_tmp[1,3]=mean(Object$count[,2])
        mean_transitions_tmp[1,4]=mean(Object$count[,3])
        mean_transitions_tmp[1,5]=j[i]
        mean_transitions <- rbind(mean_transitions, mean_transitions_tmp)
      }
    }
  return(mean_transitions)
  }