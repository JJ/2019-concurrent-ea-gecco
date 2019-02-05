library(reshape2)
library(ggplot2)
library(ggthemes)

data.freqs.threads <- read.csv('../data/gecco-2019-freqs-threads.csv')


ggplot(data.freqs.threads,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")
ggplot(data.freqs.threads,aes(x=Threads,y=Time,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Time",title="Generation gap = 8")
ggplot(data.freqs.threads,aes(x=Threads,y=Evaluations/Time,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluation/time",title="Generation gap = 8")


data.freqs.generations <- read.csv('../data/gecco-2019-freqs-generations.csv')


ggplot(data.freqs.generations,aes(x=Generation.Gap,y=Evaluations,group=Generation.Gap))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Evaluations",title="Generation gap = 8")
ggplot(data.freqs.generations,aes(x=Generation.Gap,y=Time,group=Generation.Gap))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Time",title="Generation gap = 8")
ggplot(data.freqs.generations,aes(x=Generation.Gap,y=Evaluations/Time,group=Generation.Gap))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Evaluation/time",title="Generation gap = 8")
