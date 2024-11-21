#import eggs numeric
library(readxl)
library(dbscan)
library(data.table)
library(cluster) # PAM - K-medoids
library(ggplot2) # visualisations
library(grid) # visualisations
library(gridExtra) # visualisations

#Clustering for Eggs+Lights without normalization
EggNumeric<-read_excel("OuaNumeric.xlsx")
#EggNumeric2=scale(EggNumeric)
names(EggNumeric)
result<-dbscan(EggNumeric,eps=6, minPts=10)
table(result$cluster)
EgN=data.table(EggNumeric)
EgN[, class := as.factor(result$cluster)]
levels(EgN$class)[1] <- c("Noise")
ggplot(EgN, aes(mean_Inc_per,Light_UV, color = class, shape = class)) +
  geom_point(alpha = 0.75, size = 8) +
  theme_bw() +
  scale_shape_manual(values = c(3,5, 7, 9, 16,17,18, 11, 12, 10, 15))
v=1:277;
v[result$cluster==0]
#remove outliers
vout<-v[result$cluster==0]
EggNumeric_new<-EggNumeric[-vout,]
result<-dbscan(EggNumeric_new,eps=6, minPts=10)
table(result$cluster)
EgN=data.table(EggNumeric_new)
EgN[, class := as.factor(result$cluster)]
ggplot(EgN, aes(mean_Inc_per,Light_UV, color = class, shape = class)) +
  geom_point(alpha = 0.75, size = 8) +
  theme_bw() +
  scale_shape_manual(values = seq(from=24, to=14, by=-1))