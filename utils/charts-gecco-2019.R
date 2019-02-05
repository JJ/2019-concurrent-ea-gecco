library(reshape2)
library(ggplot2)
library(ggthemes)

data.freqs.threads <- read.csv('../data/gecco-2019-freqs-threads.csv')
ggplot(data.freqs.threads,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")
ggplot(data.freqs.threads,aes(x=Threads,y=Time,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Time",title="Generation gap = 8")
ggplot(data.freqs.threads,aes(x=Threads,y=Evaluations/Time,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluation/time",title="Generation gap = 8")


data.compress.threads <- read.csv('../data/gecco-2019-compress-threads.csv')
ggplot(data.compress.threads,aes(x=Threads,y=Evaluations,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluations",title="Generation gap = 8")
ggplot(data.compress.threads,aes(x=Threads,y=Time,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Time",title="Generation gap = 8")
ggplot(data.compress.threads,aes(x=Threads,y=Evaluations/Time,group=Threads))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Threads",y="Evaluation/time",title="Generation gap = 8")

data.freqs.generations <- read.csv('../data/gecco-2019-freqs-generations.csv')


ggplot(data.freqs.generations,aes(x=Generation.Gap,y=Evaluations,group=Generation.Gap))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Evaluations",title="Generation gap = 8")
ggplot(data.freqs.generations,aes(x=Generation.Gap,y=Time,group=Generation.Gap))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Time",title="Generation gap = 8")
ggplot(data.freqs.generations,aes(x=Generation.Gap,y=Evaluations/Time,group=Generation.Gap))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Evaluation/time",title="Generation gap = 8")


data.compress.generations <- read.csv('../data/gecco-2019-compress-generations.csv')


ggplot(data.compress.generations,aes(x=Generation.Gap,y=Evaluations,group=Generation.Gap))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Evaluations",title="Generation gap = 8")
ggplot(data.compress.generations,aes(x=Generation.Gap,y=Time,group=Generation.Gap))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Time",title="Generation gap = 8")
ggplot(data.compress.generations,aes(x=Generation.Gap,y=Evaluations/Time,group=Generation.Gap))+geom_boxplot()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Evaluation/time",title="Generation gap = 8")

data.evostar <- read.csv("../data/evostar2019.csv")

data.generations <- data.frame(
    strategy=c(rep("Compress",length(data.compress.generations$Generation.Gap)),
               rep("EDA",length(data.freqs.generations$Generation.Gap)),
               rep("Full",length(data.evostar$gap))),
    gap=c(data.compress.generations$Generation.Gap,data.freqs.generations$Generation.Gap,data.evostar$gap),
    evaluations=c(data.compress.generations$Evaluations,data.freqs.generations$Evaluations,data.evostar$evaluations),
    time=c(data.compress.generations$Time,data.freqs.generations$Time,data.evostar$time) )

ggplot(data.generations,aes(x=gap,y=evaluations,group=strategy, color=strategy))+ stat_summary(fun.y="mean", geom="line")+geom_point()+scale_y_log10()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Evaluations")
ggplot(data.generations,aes(x=gap,y=time,group=strategy, color=strategy))+ stat_summary(fun.y="mean", geom="line")+geom_point()+scale_y_log10()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Time")
ggplot(data.generations,aes(x=gap,y=evaluations/time,group=strategy, color=strategy))+ stat_summary(fun.y="mean", geom="line")+geom_point()+scale_y_log10()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Evaluations/second")
