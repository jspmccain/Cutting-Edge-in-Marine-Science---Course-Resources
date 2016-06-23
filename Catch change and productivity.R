library(gsheet)
library(magrittr)
library(ggplot2)

##If you don't have the above packages installed, use: install.packages(c("gsheet", "magrittr", "ggplot2"))

#reading in URL from Scott's google drive
url1 <- "https://docs.google.com/spreadsheets/d/1zUaj1RRCJ5S4LzJaAOQvKrtOwWTDRYMXY3uIj5VQ57c/edit?usp=sharing"

#If you want to look at the data, this reads it in and converts it to a data.frame
data1 <- gsheet2tbl(url1) %>% as.data.frame()

library(dplyr)

data2 <- data1 %>% mutate(per.change = (peak.catch - current.catch)/peak.catch)

#plotting total catch change from peak and primary production
g1 <- data2 %>% ggplot(aes(primary.prod, per.change)) + 
  geom_point(size = 5, alpha = 0.5) +
  theme_bw() + 
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 18)) + 
  geom_text(aes(label = country), size = 7, vjust = -0.5);g1

g3 <- data2 %>% ggplot(aes(primary.prod, peak.catch)) + 
  geom_point(size = 5, alpha = 0.5) +
  theme_bw() + 
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 18)) + 
  geom_text(aes(label = country), size = 7, vjust = -0.5);g3

#plotting total catch change by continent
g2 <- data2 %>% ggplot(aes(continent, peak.year)) + 
  geom_boxplot() +
  geom_point(size = 5, alpha = 0.7) + 
  theme_bw() + 
  xlab("Continent") + 
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 18));g2

#plotting total catch change by continent
g4 <- data2 %>% ggplot(aes(continent, per.change)) + 
  geom_boxplot() +
  geom_point(size = 5, alpha = 0.7) + 
  theme_bw() + 
  xlab("Continent") + 
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 18));g4


