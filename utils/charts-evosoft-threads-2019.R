library(ggplot2)
library(ggthemes)


data.freqs.ap.threads <- read.csv('../data/royal-road-evosoft.csv')

ggplot(data.freqs.ap.threads,aes(x=Threads,y=Evaluations,group=Threads)) + geom_boxplot(fill='green',notch=TRUE)+theme_tufte()+scale_x_continuous(name="Threads",breaks=c(2,4,6,8))+labs(x="Threads",y="Evaluations",title="Adaptive population")

ggplot(data.freqs.ap.threads,aes(x=Threads,y=Time,group=Threads))+geom_boxplot(fill='blue',notch=TRUE)+theme_tufte()+scale_x_continuous(name="Threads",breaks=c(2,4,6,8))+labs(x="Generation.Gap",y="Time",title="Adaptive population")


ggplot(data.freqs.ap.threads,aes(x=Threads,y=Evaluations/Time,group=Threads))+geom_boxplot(fill='yellow',notch=TRUE)+theme_tufte()+scale_x_continuous(name="Threads",breaks=c(2,4,6,8))+labs(x="Generation.Gap",y="Evaluation/time",title="Adaptive population")
