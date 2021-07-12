if (!is.element("devtools", installed.packages()[,1])) {
  install.packages("devtools", dep = TRUE)
}

if (!is.element("esci", installed.packages()[,1])) {
  devtools::install_github(repo = "rcalinjageman/esci")
}


library("esci")
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
            kapr_sd = sd(kapr)) %>% 
  mutate(N = a$n) 
df_kapr %>% write.csv("data/effect_size_kapr_CI.csv")

b <- combn(df_kapr$mode_paper,2,FUN = NULL, simplify = TRUE)
b <- as.character(b)

df_comb <- data.frame("mode1" = NA, "mode2"= NA) 

for (i in 1:(length(b)/2)){
  index <- (i-1) * 2 + 1
  df_comb[i, 1] <- b[index]
  df_comb[i, 2] <- b[index + 1]
}

df_comb <- df_comb %>% 
  left_join(df_kapr, by = c("mode1" = "mode_paper")) %>%
  left_join(df_kapr, by = c("mode2" = "mode_paper"))

df_comb$kapr_sd.x[df_comb$kapr_sd.x == 0] <- 0.000000001

df_comb <- df_comb %>% 
  mutate(kapr_cohen_d = estimateStandardizedMeanDifference(m1 = kapr_mean.x,
                                                           m2 = kapr_mean.y,
                                                           s1 = kapr_sd.x,
                                                           s2 = kapr_sd.y,
                                                           n1 = N.x,
                                                           n2 = N.y,
                                                           conf.level = .95)[["cohend"]],
         kapr_cohen_d_low = estimateStandardizedMeanDifference(m1 = kapr_mean.x,
                                                           m2 = kapr_mean.y,
                                                           s1 = kapr_sd.x,
                                                           s2 = kapr_sd.y,
                                                           n1 = N.x,
                                                           n2 = N.y,
                                                           conf.level = .95)[["cohend.low"]],
         kapr_cohen_d_high = estimateStandardizedMeanDifference(m1 = kapr_mean.x,
                                                           m2 = kapr_mean.y,
                                                           s1 = kapr_sd.x,
                                                           s2 = kapr_sd.y,
                                                           n1 = N.x,
                                                           n2 = N.y,
                                                           conf.level = .95)[["cohend.high"]]) %>%
  select(mode1, mode2, kapr_cohen_d, kapr_cohen_d_low, kapr_cohen_d_high)

df_comb %>% write.csv("data/effect_size_kapr_cohen_d.csv")


#########################################################
#                   error
#########################################################
df_error <- session_important %>% 
  group_by(mode_paper) %>%
  summarise(error_mean = mean(100 - percent30),
            error_sd = sd(100 - percent30)) %>% 
  mutate(N = a$n) 
df_error %>% write.csv("data/effect_size_error_CI.csv")

b <- combn(df_error$mode_paper,2,FUN = NULL, simplify = TRUE)
b <- as.character(b)

df_comb <- data.frame("mode1" = NA, "mode2"= NA) 

for (i in 1:(length(b)/2)){
  index <- (i-1) * 2 + 1
  df_comb[i, 1] <- b[index]
  df_comb[i, 2] <- b[index + 1]
}


df_comb <- df_comb %>% 
  left_join(df_error, by = c("mode1" = "mode_paper")) %>%
  left_join(df_error, by = c("mode2" = "mode_paper")) 

df_comb <- df_comb %>% 
  mutate(error_cohen_d = estimateStandardizedMeanDifference(m1 = error_mean.x,
                                                           m2 = error_mean.y,
                                                           s1 = error_sd.x,
                                                           s2 = error_sd.y,
                                                           n1 = N.x,
                                                           n2 = N.y,
                                                           conf.level = .95)[["cohend"]],
         error_cohen_d_low = estimateStandardizedMeanDifference(m1 = error_mean.x,
                                                               m2 = error_mean.y,
                                                               s1 = error_sd.x,
                                                               s2 = error_sd.y,
                                                               n1 = N.x,
                                                               n2 = N.y,
                                                               conf.level = .95)[["cohend.low"]],
         error_cohen_d_high = estimateStandardizedMeanDifference(m1 = error_mean.x,
                                                                m2 = error_mean.y,
                                                                s1 = error_sd.x,
                                                                s2 = error_sd.y,
                                                                n1 = N.x,
                                                                n2 = N.y,
                                                                conf.level = .95)[["cohend.high"]]) %>%
  select(mode1, mode2, error_cohen_d, error_cohen_d_low, error_cohen_d_high)

df_comb %>% write.csv("data/effect_size_error_cohen_d.csv")

#########################################################
#                   duration
#########################################################
df_duration <- session_important %>% 
  group_by(mode_paper) %>%
  summarise(duration_mean = mean(duration),
            duration_sd = sd(duration)) %>% 
  mutate(N = a$n) 
df_duration %>% write.csv("data/effect_size_duration_CI.csv")


b <- combn(df_duration$mode_paper,2,FUN = NULL, simplify = TRUE)
b <- as.character(b)

df_comb <- data.frame("mode1" = NA, "mode2"= NA) 

for (i in 1:(length(b)/2)){
  index <- (i-1) * 2 + 1
  df_comb[i, 1] <- b[index]
  df_comb[i, 2] <- b[index + 1]
}

df_comb <- df_comb %>% 
  left_join(df_duration, by = c("mode1" = "mode_paper")) %>%
  left_join(df_duration, by = c("mode2" = "mode_paper"))


df_comb <- df_comb %>% 
  mutate(duration_cohen_d = estimateStandardizedMeanDifference(m1 = duration_mean.x,
                                                            m2 = duration_mean.y,
                                                            s1 = duration_sd.x,
                                                            s2 = duration_sd.y,
                                                            n1 = N.x,
                                                            n2 = N.y,
                                                            conf.level = .95)[["cohend"]],
         duration_cohen_d_low = estimateStandardizedMeanDifference(m1 = duration_mean.x,
                                                                m2 = duration_mean.y,
                                                                s1 = duration_sd.x,
                                                                s2 = duration_sd.y,
                                                                n1 = N.x,
                                                                n2 = N.y,
                                                                conf.level = .95)[["cohend.low"]],
         duration_cohen_d_high = estimateStandardizedMeanDifference(m1 = duration_mean.x,
                                                                 m2 = duration_mean.y,
                                                                 s1 = duration_sd.x,
                                                                 s2 = duration_sd.y,
                                                                 n1 = N.x,
                                                                 n2 = N.y,
                                                                 conf.level = .95)[["cohend.high"]]) %>%
  select(mode1, mode2, duration_cohen_d, duration_cohen_d_low, duration_cohen_d_high)



df_comb %>% write.csv("data/effect_size_duration_cohen_d.csv")

