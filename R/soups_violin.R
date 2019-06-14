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

session_important %>%
  ggplot(aes(x = mode_paper, y = 1 - percent30/100)) + 
  geom_violin(lwd = 0.85,
               fatten = 1,
               outlier.size = 2,
               fill = "darkslategray3",
               alpha = 0.9,
              trim = FALSE) +
  geom_boxplot(width = 0.12,
               # fill = "darkslategray3",
               alpha = 0.8) +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 17)) + 
  labs(title = "Record Linkage Error Rate by Condition") +
  theme_pub(20, 17, 18) +
  guides(fill = FALSE)  +
  # stat_summary(fun.y = median, fun.ymin = median, fun.ymax = median,
  #              geom = "crossbar", width = 0.75, lwd = 0.75) +
  scale_y_continuous(labels = scales::percent, limits = c(0,1), breaks = seq(0,1,0.2))

ggsave("./plots/pb_error_soups_violin.png", dpi = 500, width = 10, height = 8*.8)



session_important %>%
  mutate(kapr = ifelse(mode_paper == "Fully open", 100, kapr)) %>% 
  ggplot(aes(x = mode_paper, y = kapr/100)) + 
  geom_violin(lwd = 0.85, 
               fatten = 1, 
               outlier.size = 2, 
               fill = "darkslategray3", 
               alpha = 0.9,
               trim = T
              ) +
  geom_segment(aes(x = 0.5, xend = 1.5, y = 1, yend = 1), size = 1.15) +
  geom_boxplot(width = 0.12,
               # fill = "darkslategray3",
               alpha = 0.8) +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 17)) + 
  labs(title = "Privacy Risk Score (KAPR) by Condition") +
  theme_pub(20, 17, 18) +
  guides(fill = FALSE)  +
  # stat_summary(fun.y = median, fun.ymin = median, fun.ymax = median,
  #              geom = "crossbar", width = 0.75, lwd = 0.75) +
  scale_y_continuous(labels = scales::percent, limits = c(0,1), breaks = seq(0,1,0.2))

ggsave("./plots/pb_kapr_soups_violin_110.png", dpi = 500, width = 10, height = 8*.8)


session_important %>%
  ggplot(aes(x = mode_paper, y = duration)) + 
  geom_violin(lwd = 0.85, 
               fatten = 1, 
               outlier.size = 2, 
               fill = "darkslategray3", 
               alpha = 0.9,
              trim = F) +
  geom_boxplot(width = 0.12,
               # fill = "darkslategray3",
               alpha = 0.8) +
  scale_x_discrete(labels = function(x) str_wrap(x, width = 17)) + 
  labs(title = "Record Linkage Time (minutes) by Condition") +
  theme_pub(20, 17, 18) +
  guides(fill = FALSE)  +
  # stat_summary(fun.y = median, fun.ymin = median, fun.ymax = median,
  #              geom = "crossbar", width = 0.75, lwd = 0.75) +
  scale_y_continuous(limits = c(0, 25), breaks = seq(0, 25, 5))

ggsave("./plots/pb_duration_soups_violin.png", dpi = 500, width = 10, height = 8*.8)
