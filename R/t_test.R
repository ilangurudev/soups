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

fully_open <- session_important[which(session_important$mode_paper == "Fully open"),]
no_meter <- session_important[which(session_important$mode_paper == "No meter"),]
unlimited_meter <- session_important[which(session_important$mode_paper == "Unlimited meter"),]
high_limit <- session_important[which(session_important$mode_paper == "High limit"),]
low_limit <- session_important[which(session_important$mode_paper == "Low limit"),]

#########################################################
#                   error
#########################################################

t.test(100 - fully_open$percent30, 100 - no_meter$percent30)
t.test(100 - fully_open$percent30, 100 - unlimited_meter$percent30)
t.test(100 - fully_open$percent30, 100 - high_limit$percent30)
t.test(100 - fully_open$percent30, 100 - low_limit$percent30)
t.test(100 - no_meter$percent30, 100 - unlimited_meter$percent30)
t.test(100 - no_meter$percent30, 100 - high_limit$percent30)
t.test(100 - no_meter$percent30, 100 - low_limit$percent30)
t.test(100 - unlimited_meter$percent30, 100 - high_limit$percent30)
t.test(100 - unlimited_meter$percent30, 100 - low_limit$percent30)
t.test(100 - high_limit$percent30, 100 - low_limit$percent30)


#########################################################
#                   Time
#########################################################

t.test(fully_open$duration, no_meter$duration)
t.test(fully_open$duration, unlimited_meter$duration)
t.test(fully_open$duration, high_limit$duration)
t.test(fully_open$duration, low_limit$duration)
t.test(no_meter$duration, unlimited_meter$duration)
t.test(no_meter$duration, high_limit$duration)
t.test(no_meter$duration, low_limit$duration)
t.test(unlimited_meter$duration, high_limit$duration)
t.test(unlimited_meter$duration, low_limit$duration)
t.test(high_limit$duration, low_limit$duration)


#########################################################
#                   KAPR
#########################################################

t.test(fully_open$kapr, no_meter$kapr)
t.test(fully_open$kapr, unlimited_meter$kapr)
t.test(fully_open$kapr, high_limit$kapr)
t.test(fully_open$kapr, low_limit$kapr)
t.test(no_meter$kapr, unlimited_meter$kapr)
t.test(no_meter$kapr, high_limit$kapr)
t.test(no_meter$kapr, low_limit$kapr)
t.test(unlimited_meter$kapr, high_limit$kapr)
t.test(unlimited_meter$kapr, low_limit$kapr)
t.test(high_limit$kapr, low_limit$kapr)

