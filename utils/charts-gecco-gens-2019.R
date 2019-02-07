library(ggplot2)
library(ggthemes)


data.freqs.nw.gens <- read.csv('../data/gecco-2019-freqs-noweb-generations.csv')
data.compress.nw.gens <- read.csv('../data/gecco-2019-compress-noweb-generations.csv')
data.freqs.generations <- read.csv('../data/gecco-2019-freqs-generations.csv')
data.compress.generations <- read.csv('../data/gecco-2019-compress-generations.csv')
data.evostar <- read.csv("../data/evostar2019.csv")

data.generations <- data.frame(
    strategy=c(rep("Compress",length(data.compress.generations$Generation.Gap)),
               rep("CompressNW",length(data.compress.nw.gens$Generation.Gap)),
               rep("EDA",length(data.freqs.generations$Generation.Gap)),
               rep("EDANW",length(data.freqs.nw.gens$Generation.Gap)),
               rep("Full",length(data.evostar$gap))),
    gap=c(data.compress.generations$Generation.Gap,data.compress.nw.gens$Generation.Gap,data.freqs.generations$Generation.Gap,data.freqs.nw.gens$Generation.Gap,data.evostar$gap),
    evaluations=c(data.compress.generations$Evaluations,data.compress.nw.gens$Evaluations,data.freqs.generations$Evaluations,data.freqs.nw.gens$Evaluation,data.evostar$evaluations),
    time=c(data.compress.generations$Time,data.compress.nw.gens$Time,data.freqs.generations$Time,data.freqs.nw.gens$Time,data.evostar$time) )

ggplot(data.generations,aes(x=gap,y=evaluations,group=strategy, color=strategy))+ stat_summary(fun.y="mean", geom="line", size=2)+geom_point()+scale_y_log10()+scale_x_continuous(trans='log10',name="Generations",breaks=c(4,8,16,32,64))+theme_tufte()+labs(x="Generations",y="Evaluations")
ggplot(data.generations,aes(x=gap,y=time,group=strategy, color=strategy))+ stat_summary(fun.y="mean", geom="line")+geom_point()+scale_y_log10()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Time")
ggplot(data.generations,aes(x=gap,y=evaluations/time,group=strategy, color=strategy))+ stat_summary(fun.y="mean", geom="line")+geom_point()+scale_y_log10()+scale_x_log10()+theme_tufte()+labs(x="Generations",y="Evaluations/second")
