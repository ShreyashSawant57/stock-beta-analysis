library(readxl)
library(tidyverse)
beta_data <- read_excel(choose.files())
view(beta_data)
beta_data$P_DATE <- as.Date(beta_data$P_DATE)
beta_data <- arrange(beta_data, P_DATE)

beta_data <- arrange(beta_data, BLOOMBERGTICKER, P_DATE)
beta_data <- beta_data %>% group_by(P_DATE) %>% mutate( SP500P =(P_PRICE * SP500WEIGHT))
beta_data <- beta_data %>% group_by(P_DATE)%>% mutate(summarise(beta_data, SP500 = sum(P_PRICE*SP500WEIGHT))) 
beta_data <- beta_data %>% group_by(BLOOMBERGTICKER) %>% mutate(SP500RTNS = (((SP500- lag(SP500))/ lag(SP500))*100)) %>% ungroup()

beta_data <- beta_data %>% arrange(BLOOMBERGTICKER) %>% mutate(STOCKRTNS = (( (P_PRICE- lag(P_PRICE)) / lag(P_PRICE)))*100) %>% ungroup()

beta_new <- beta_data[, c("P_DATE","SP500RTNS", "STOCKRTNS", "BLOOMBERGTICKER")] %>% group_by(BLOOMBERGTICKER)  %>% mutate(COVSTKMKT = cov(STOCKRTNS, SP500RTNS, use = 'complete')) %>% ungroup()
beta_new <- beta_new %>% mutate( VARMKT = var(SP500RTNS, na.rm = T))
beta_new <- beta_new %>% group_by(BLOOMBERGTICKER) %>% mutate( Beta_VAL = COVSTKMKT/ VARMKT)
Highest_Beta <- max(beta_new$Beta_VAL)
Highest_Beta
#After Finding Beta values now we have to show histogram. 
#We will first save beta values along with company name in a new vector
#Using hist() we will plot histogram with beta values on X-axis and frequency of beta on Y-axis

?dplyr
