##data frame data piping##
library(tidyverse)
dat <- read_tsv("data/raw-data.tsv")
dat1 <- pivot_longer(dat, cols = Base:Total, names_to = "region", values_to = "count")

# calculate the mean for each region within treatment
dat.sum <- dat1 %>% 
  group_by(region, treatment) %>% 
  summarize(mean_cnt = mean(count, na.rm = TRUE),
            sd_cnt = sd(count, na.rm = TRUE))

#make error

#calulate se
n <-length(dat1)
se_cnt <- sd_cnt / sqrt(n)


# plot

ggplot(dat1, aes(region, count, fill=treatment)) + 
  geom_bar(stat = "summary", fun = "mean", position = "dodge", colour = "black") + geom_errorbar(dat.sum, aes(ymin = mean_cnt - sd_cnt, ymax = mean_cnt + sd_cnt)) + scale_fill_manual(values = c("#FF6633", "grey")) + ylab("Macrophage density") +
  xlab("Region") + geom_point(aes(x = region), color = "black", position = position_dodge(width = 0.8), size = 1)
   


ggsave("data/test1.png")
#geom_point(data = dat1, aes(x = region, y = count, fill=treatment))
                             
                             
#geom_errorbar(aes(ymin = count - sd_cnt, ymax = count + sd_cnt)) +  

ggplot(dat.sum, aes(region, mean_cnt, fill=treatment)) + 
  geom_bar(stat = "identity", position = "dodge", colour = "black") + geom_errorbar(aes(ymin = mean_cnt - sd_cnt, ymax = mean_cnt + sd_cnt), position = position_dodge(0.9), width = 0.2) + scale_fill_manual(values = c("#FF6633", "grey")) + ylab("Macrophage density") + 
   xlab("Region")

