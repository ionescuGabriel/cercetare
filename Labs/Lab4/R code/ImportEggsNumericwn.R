#import eggs numeric
library(readxl)
library(dbscan)
library(data.table)
library(cluster) # PAM - K-medoids
library(ggplot2) # visualisations
library(grid) # visualisations
library(gridExtra) # visualisations

#Clustering for Eggs+Lights with normalization
EggNumeric2<-read_excel("OuaNumeric.xlsx")
EggNumeric=scale(EggNumeric2)
names(EggNumeric)
result<-dbscan(EggNumeric,eps=1, minPts=10)
table(result$cluster)
EgN=data.table(EggNumeric)
EgN[, class := as.factor(result$cluster)]
levels(EgN$class)[1] <- c("Noise")
ggplot(EgN, aes(mean_Inc_per,Light_UV, color = class, shape = class)) +
  geom_point(alpha = 0.75, size = 5) +
  theme_bw() +
  scale_shape_manual(values = c(3,15:19,1))
v=1:277;
v[result$cluster==0]
#remove outliers
vout<-v[result$cluster==0]
EggNumeric_new<-EggNumeric[-vout,]
result<-dbscan(EggNumeric_new, eps=1, minPts=10)
table(result$cluster)
EgN=data.table(EggNumeric_new)
EgN[, class := as.factor(result$cluster)]
ggplot(EgN, aes(mean_Inc_per,Light_UV, color = class, shape = class)) +
  geom_point(alpha = 0.75, size = 5) +
  theme_bw() +
  scale_shape_manual(values = c(15:19,1))