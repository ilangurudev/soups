pacman::p_load(tidyverse, rebus, glue, fs, anytime)

df_key_info <- read_csv("./data/processed/key_info.csv")
df_pre <- read_csv("./data/processed/pre_survey.csv")
df_kapr_samples <- 
  read_csv("./data/background/kapr_limit.csv") %>% 
  mutate(sample = ifelse(uid == 0, 10, uid)) %>% 
  select(-uid)

df_kapr_samples <- 
  df_key_info %>% 
  select(u_id) %>% 
  mutate(sample = u_id%%10,
         sample = ifelse(sample == 0, 10, sample)) %>% 
  crossing(section = 1:10) %>% 
  left_join(df_kapr_samples, by = c("sample", "section"))


#limit used
df_key_info %>% 
  select(mode, section_2_kapr) %>% 
  group_by(mode) %>% 
  summarise_all(sd)

#budget
df_kapr_samples %>% 
  left_join(df_key_info %>% select(section_2_percent_attention, mode, u_id)) %>% 
  filter(section  == 2, 
         section_2_percent_attention > 0.8, 
         mode %in% 4:5) %>% 
  mutate(budget = case_when(
    mode == 4 ~ moderate,
    mode == 5 ~ minimum,
    TRUE ~ 100
  )) %>% 
  group_by(mode) %>% 
  summarise_all(mean)

df_key_info <- 
  df_key_info %>% 
  filter(section_2_percent_attention > 0.8)

df_pre <- 
  df_pre %>% 
  filter(u_id %in% df_key_info$u_id)
  

add_prop <- function(df, col){
  col <- enquo(col)
  
  df %>% 
    count((!!col), sort = T) %>% 
    mutate(prop = n/sum(n))
}


df_pre %>% 
  count(u_id, sort = T)

df_pre %>% 
  count(mode)

df_pre %>% 
  add_prop(sex)

df_pre %>% 
  add_prop(highest_degree)

df_pre %>% 
  add_prop(current_degree)

df_pre %>% 
  pull(age) %>% 
  summary()

# df_pre %>% 
#   group_by(mode) %>% 
#   summarize(data_ana = mean(data_ana))
# 
# df_key_info %>% 
#   group_by(mode) %>% 
#   summarize(scr = mean(section_2_grade30))

us_countries <- c("United States", "USA", "US", "United States of America", "U.S.", "U.S.A", "U.S.A.", "US Virgin Islands")

df_pre %>% 
  mutate(country_corrected = ifelse(str_trim(country) %in% us_countries, "USA", country),
         is_usa = country_corrected == "USA") %>% 
  add_prop(is_usa)


df_pre %>% 
  add_prop(english)

df_pre %>% 
  add_prop(dpt)


df_key_info %>% 
  filter(section_2_percent_attention > 0.8) %>% 
  group_by(mode) %>% 
  summarise(kapr = median(section_2_kapr))

df_key_info %>% 
  filter(section_2_percent_attention > 0.8) %>% 
  group_by(mode) %>% 
  summarise(kapr = mean(section_2_kapr))

df_key_info %>% 
  filter(mode %in% 3:5) %>% 
  select(u_id, mode, contains("section_2")) %>% 
  select(u_id, mode, contains("page")) %>% 
  select(u_id, mode, contains("kapr")) %>% 
  summarise_all(mean) %>% 
  gather(page, kapr, 3:8) %>% 
  mutate(page = page %>% str_replace("section_2_page_", "") %>% str_replace("_kapr", "") %>% as.integer()) %>% 
  ggplot(aes(page, kapr, fill = factor(mode))) +
  geom_col()

df_key_info %>% 
  filter(mode %in% 3:5) %>% 
  select(u_id, mode, contains("section_2")) %>% 
  select(u_id, mode, contains("page")) %>% 
  select(u_id, mode, contains("kapr")) %>% 
  group_by(mode) %>% 
  summarise_all(mean) %>% 
  gather(page, kapr, 3:8) %>% 
  mutate(page = page %>% str_replace("section_2_page_", "") %>% str_replace("_kapr", "") %>% as.integer()) %>% 
  left_join(df_kapr_samples %>% 
              left_join(df_key_info %>% select(section_2_percent_attention, mode, u_id)) %>% 
              filter(section  == 2, 
                     section_2_percent_attention > 0.8, 
                     mode %in% 3:5) %>% 
              mutate(budget = case_when(
                mode == 4 ~ moderate,
                mode == 5 ~ minimum,
                TRUE ~ 100
              )) %>% 
              group_by(mode) %>% 
              summarise_all(mean) %>% 
              select(mode, budget)) %>% 
  ggplot(aes(page, kapr, fill = factor(mode))) +
  geom_col() +
  geom_hline(aes(yintercept = budget/6), lty = 3) +
  # scale_y_continuous(limits = c(0, 100/6)) +
  facet_grid(~mode)

df_bud <- 
  df_key_info %>% 
  filter(mode %in% 3:5) %>% 
  select(u_id, mode, contains("section_2")) %>% 
  select(u_id, mode, contains("page")) %>% 
  select(u_id, mode, contains("kapr")) %>% 
  group_by(mode) %>% 
  summarise_all(mean) %>% 
  gather(page, kapr, 3:8) %>% 
  mutate(page = page %>% str_replace("section_2_page_", "") %>% str_replace("_kapr", "") %>% as.integer()) %>% 
  left_join(df_kapr_samples %>% 
              left_join(df_key_info %>% select(section_2_percent_attention, mode, u_id)) %>% 
              filter(section  == 2, 
                     section_2_percent_attention > 0.8, 
                     mode %in% 3:5) %>% 
              mutate(budget = case_when(
                mode == 4 ~ moderate,
                mode == 5 ~ minimum,
                TRUE ~ 100
              )) %>% 
              group_by(mode) %>% 
              summarise_all(mean) %>% 
              select(mode, budget))
df_bud2 <- 
  df_kapr_samples %>% 
  left_join(df_key_info %>% select(section_2_percent_attention, mode, u_id)) %>% 
  filter(section  == 2, 
         section_2_percent_attention > 0.8, 
         mode %in% 3:5) %>% 
  mutate(budget = case_when(
    mode == 4 ~ moderate,
    mode == 5 ~ minimum,
    TRUE ~ 100
  )) %>% 
  group_by(mode) %>% 
  summarise_all(mean) %>% 
  select(mode, budget)

budget_mode4 <- 
  df_bud2 %>% 
  filter(mode == 4) %>% 
  pull(budget)

df_bud %>% 
  ggplot(aes(page, kapr/budget, fill = factor(mode))) +
  geom_col() +
  scale_y_continuous(limits = c(0, 1)) +
  facet_grid(~mode)

ggsave("plots/expense_by_mode_budget_scaled.png")

df_bud %>% 
  ggplot(aes(page, kapr/budget_mode4, fill = factor(mode))) +
  geom_col() +
  scale_y_continuous(limits = c(0, 1)) +
  facet_grid(~mode)

ggsave("plots/expense_by_mode4_budget4_scaled.png")

df_bud %>% 
  ggplot(aes(page, kapr/budget, fill = factor(mode))) +
  geom_col() +
  # scale_y_continuous(limits = c(0, 1)) +
  facet_grid(~mode)
ggsave("plots/expense_by_mode_budget_unscales.png")

df_bud %>% 
  ggplot(aes(page, kapr/budget_mode4, fill = factor(mode))) +
  geom_col() +
  # scale_y_continuous(limits = c(0, 1)) +
  facet_grid(~mode)
ggsave("plots/expense_by_mode4_budget_unscaled.png")



df_key_info %>% 
  select(u_id, mode, section_2_kapr) %>% 
  left_join(
    df_kapr_samples %>% 
      filter(section == 2) %>% 
      select(-sample, -section),
    by = "u_id"
  ) %>% 
  mutate(
    section_2_kapr = ifelse(mode == 1, 100, section_2_kapr),
    budget = case_when(
      mode == 1 ~ 100,
      mode == 2 ~ 100,
      mode == 3 ~ 100,
      mode == 4 ~ moderate,
      TRUE ~ minimum
    ), 
    budget_percent = section_2_kapr*100 / budget) %>% 
  group_by(mode) %>% 
  summarise(budget_percent = mean(budget_percent))


# df_budget <- read_csv("data/processed/all_dfs/df_u_raw.csv")
# 
# df_budget %>% 
#   filter(extra %>% str_detect("ustudy_budget")) %>% 
#   group_by(u_id) %>% 
#   slice(1)
