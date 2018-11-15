library(reshape2)
library(ggplot2)
library(ggthemes)

data.128 <- read.csv('../data/8gens-128pop.csv')
data.256 <- read.csv('../data/8generations.csv')
data.512 <- read.csv('../data/8gens-512pop.csv')
data.1024 <- read.csv('../data/8gens-1024pop.csv')


data <- data.frame(population=c(rep(128,length(data.128$Time)),
                                 rep(256,length(data.256$Time)),
                                 rep(512,length(data.512$Time)),
                                 rep(1024,length(data.1024$Time))),
                   time=c(data.128$Time,data.256$Time,data.512$Time,data.1024$Time),
                   evaluations=c(data.128$Generations,data.256$Evaluations,data.512$Generations,data.1024$Generations))

data$population = as.factor(data$population)
ggplot(data,aes(x=evaluations,y=time,color=population))+scale_color_brewer(palette="Set1")+geom_point()+theme_tufte()+labs(x="Evaluations",y="Time",title="Evaluations vs Time per generation gap")


ggplot(data,aes(x=population,y=evaluations,group=population))+geom_boxplot()+theme_tufte()+labs(title="Evaluations vs generation gap")
ggplot(data,aes(x=population,y=time,group=population))+geom_boxplot()+theme_tufte()+labs(title="Time vs generation gap")

data$avg.eval = data$evaluations/data$time
ggplot(data,aes(x=population,y=avg.eval,group=population))+geom_boxplot()+theme_tufte()+labs(title="Time vs generation gap")
