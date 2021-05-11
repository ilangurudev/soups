#install.packages("effectsize")
library(effectsize)
library(tidyverse)

df_mode_descriptions <- 
  tribble(
    ~mode, ~mode_paper,
    1, "Fully open",
    2, "No meter",
    3, "Unlimited meter",
    4, "High limit",
    5, "Low limit"
  )



session_important <- 
  read_csv("data/processed/df_key_info_section_2.csv") %>%
  arrange(mode) %>% 
  filter(percent_attention > 0.8) %>% 
  left_join(df_mode_descriptions) %>% 
  mutate(mode_paper = mode_paper %>% fct_inorder())


theme_pub <- function(size_txt_x = 15, size_txt_y = 14, size_txt_title = 14){
  theme_minimal() +
    theme(axis.text.x=element_text(size = size_txt_x),
          axis.text.y=element_text(size = size_txt_y),
          title=element_text(size = size_txt_title),
          plot.title = element_text(hjust = 0.5),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          panel.grid.major.x = element_blank(),
          panel.grid.minor.x = element_blank(),
          panel.grid.minor.y = element_blank(),
          panel.grid.major.y = element_line(color = "darkgrey", size = 0.75))
}


df_pre <- read_csv("./data/processed/pre_survey.csv")
a <- df_pre %>% count(mode)


#########################################################
#                   kapr
#########################################################

df_kapr <- session_important %>% 
  group_by(mode_paper) %>%
  summarise(kapr_mean = mean(kapr),
            kapr_sd = sd(kapr)) 

df_kapr <- df_kapr %>% 
  mutate(N = a$n) %>% 
  mutate(kapr_ci95 = 1.96 * (kapr_sd/ sqrt(N)))

df_kapr %>% write.csv("data/effect_size_kapr_CI.csv")

b <- combn(df_kapr$mode_paper,2,FUN = NULL, simplify = TRUE)
b <- as.character(b)

df_comb <- data.frame("mode1" = NA, "mode2"= NA, "kapr_pooled_sd"= NA) 

for (i in 1:(length(b)/2)){
  index <- (i-1) * 2 + 1
  df_comb[i, 1] <- b[index]
  df_comb[i, 2] <- b[index + 1]
  
  z <- session_important[which(session_important$mode_paper == b[index] |
                                  session_important$mode_paper == b[index + 1]),]
  z$mode_paper <- factor(as.character(z$mode_paper))
  df_comb[i, 3] = sd_pooled(kapr ~ mode_paper, data = z)
  
}


df_comb <- df_comb %>% 
  left_join(df_kapr, by = c("mode1" = "mode_paper")) %>%
  left_join(df_kapr, by = c("mode2" = "mode_paper")) %>%
  mutate(kapr_cohen_d = (kapr_mean.y - kapr_mean.x) / kapr_pooled_sd) %>%
  select(mode1, mode2, kapr_pooled_sd, kapr_cohen_d, everything())
  
df_comb %>% write.csv("data/effect_size_kapr_cohen_d.csv")


#########################################################
#                   error
#########################################################

df_error <- session_important %>% 
  group_by(mode_paper) %>%
  summarise(error_mean = mean(100 - percent30),
            error_sd = sd(100 - percent30)) 

df_error <- df_error %>% 
  mutate(N = a$n) %>% 
  mutate(error_ci95 = 1.96 * (error_sd/ sqrt(N)))

df_error %>% write.csv("data/effect_size_error_CI.csv")

b <- combn(df_error$mode_paper,2,FUN = NULL, simplify = TRUE)
b <- as.character(b)

df_comb <- data.frame("mode1" = NA, "mode2"= NA, "error_pooled_sd"= NA) 

for (i in 1:(length(b)/2)){
  index <- (i-1) * 2 + 1
  df_comb[i, 1] <- b[index]
  df_comb[i, 2] <- b[index + 1]
  
  z <- session_important[which(session_important$mode_paper == b[index] |
                                 session_important$mode_paper == b[index + 1]),]
  z$mode_paper <- factor(as.character(z$mode_paper))
  df_comb[i, 3] = sd_pooled(100 - percent30 ~ mode_paper, data = z)
  
}


df_comb <- df_comb %>% 
  left_join(df_error, by = c("mode1" = "mode_paper")) %>%
  left_join(df_error, by = c("mode2" = "mode_paper")) %>%
  mutate(error_cohen_d = (error_mean.y - error_mean.x) / error_pooled_sd) %>%
  select(mode1, mode2, error_pooled_sd, error_cohen_d, everything())

df_comb %>% write.csv("data/effect_size_error_cohen_d.csv")


#########################################################
#                   duration
#########################################################

df_duration <- session_important %>% 
  group_by(mode_paper) %>%
  summarise(duration_mean = mean(duration),
            duration_sd = sd(duration)) 

df_duration <- df_duration %>% 
  mutate(N = a$n) %>% 
  mutate(duration_ci95 = 1.96 * (duration_sd/ sqrt(N)))

df_duration %>% write.csv("data/effect_size_duration_CI.csv")

b <- combn(df_duration$mode_paper,2,FUN = NULL, simplify = TRUE)
b <- as.character(b)

df_comb <- data.frame("mode1" = NA, "mode2"= NA, "duration_pooled_sd"= NA) 

for (i in 1:(length(b)/2)){
  index <- (i-1) * 2 + 1
  df_comb[i, 1] <- b[index]
  df_comb[i, 2] <- b[index + 1]
  
  z <- session_important[which(session_important$mode_paper == b[index] |
                                 session_important$mode_paper == b[index + 1]),]
  z$mode_paper <- factor(as.character(z$mode_paper))
  df_comb[i, 3] = sd_pooled(duration ~ mode_paper, data = z)
  
}


df_comb <- df_comb %>% 
  left_join(df_duration, by = c("mode1" = "mode_paper")) %>%
  left_join(df_duration, by = c("mode2" = "mode_paper")) %>%
  mutate(duration_cohen_d = (duration_mean.y - duration_mean.x) / duration_pooled_sd) %>%
  select(mode1, mode2, duration_pooled_sd, duration_cohen_d, everything())

df_comb %>% write.csv("data/effect_size_duration_cohen_d.csv")

