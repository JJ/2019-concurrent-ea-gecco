library(reshape2)
library(ggplot2)
library(ggthemes)

data.freqs.threads <- read.csv('../data/gecco-2019-freqs-threads.csv')


ggplot(data.freqs.threads,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")
ggplot(data.freqs.threads,aes(x=Threads,y=Time,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Time",title="Generation gap = 8")
ggplot(data.freqs.threads,aes(x=Threads,y=Evaluations/Time,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluation/time",title="Generation gap = 8")
