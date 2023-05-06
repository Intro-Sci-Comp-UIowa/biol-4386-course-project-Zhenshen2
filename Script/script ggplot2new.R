##data frame data piping##
library(tidyverse)
dat <- read_tsv("data/raw-data.tsv")
dat1 <- pivot_longer(dat, cols = Base:Total, names_to = "region", values_to = "count")

# calculate the mean for each region within treatment
dat.sum <- dat1 %>% 
  group_by(region, treatment) %>% 
  summarize(mean_cnt = mean(count, na.rm = TRUE),
            sd_cnt = sd(count, na.rm = TRUE), se_cnt = std.error(count, na.rm = TRUE))

#se 

library(plotrix)

#calulate se
n <-length(dat1)
se_cnt <- sd_cnt / sqrt(n)


# plot with dots

ggplot(data = dat1, aes(region, count, fill=treatment)) + 
  geom_bar(stat = "summary", fun = "mean", position = "dodge", colour = "black") + scale_fill_manual(values = c("#FF6633", "grey")) + ylab("Macrophage density") +
  xlab("Region") + geom_point(aes(x = region), color = "black", position = position_dodge(width = 0.8), size = 1)
  


ggsave("data/test1.png")
#geom_point(data = dat1, aes(x = region, y = count, fill=treatment))
                             
                             
#Barplot with error bar for SEE 

ggplot(dat.sum, aes(region, mean_cnt, fill=treatment)) + 
  geom_bar(stat = "identity", position = "dodge", colour = "black") + geom_errorbar(aes(ymin = mean_cnt - se_cnt, ymax = mean_cnt + se_cnt), position = position_dodge(0.9), width = 0.2) + scale_fill_manual(values = c("#FF6633", "grey")) + ylab("Macrophage density") + 
   xlab("Region") + geom_segment(aes(x=0.75, xend= 1.25, y=700, yend=700), color= "black", size=1) + geom_text(aes(x=1, y=710, label= "**", )) +
  geom_segment(aes(x=1.75, xend= 2.25, y=700, yend=700), color= "black", size=1) + geom_text(aes(x=2, y=710, label= "**", )) +
  geom_segment(aes(x=2.75, xend= 3.25, y=700, yend=700), color= "black", size=1) + geom_text(aes(x=3, y=710, label= "**", )) +
  geom_segment(aes(x=3.75, xend= 4.25, y=800, yend=800), color= "black", size=1) + geom_text(aes(x=4, y=810, label= "***", )) +
  geom_segment(aes(x=4.75, xend= 5.25, y=700, yend=700), color= "black", size=1) + geom_text(aes(x=5, y=710, label= "***", )) +
  labs(title = "Macrophage density in Hearing/Deaf Mice", caption = "Quantitaion of Macrophages Density in different region of Mice cochlea with hearing or deafness, welch Two sample t-test were performed between treatment")+
  theme(plot.caption = element_text(size= 11, hjust = 0))
ggsave("data/with_error.png")

dat.t <- dat1 %>% group_by(Hearing, Deaf, region)

#t test
#t.test(data=dat.sum, mean_cnt$"Deaf", mean_cnt$"Hearing", paired = FALSE)
#Deaf <- dat.sum[dat.sum$treatment == Deaf, "mean_cnt"]
#Hearing <- dat.sum[dat.sum$treatment == Hearing, "mean_cnt"]

#t test per region

#ANOVA TEST
> dat1 %>% filter(region == "Base") -> tmp
> t.test(count~treatment, data = tmp)      #significant difference in Base=** in Mid1** Mid2***apex**total***

res <- aov(count ~ treatment + region, data = dat1)
summary(res)
TukeyHSD(res)
