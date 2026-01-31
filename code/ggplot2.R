# Load library
# Always do this at the top of the file
library(ggplot2)

# Import data
gapminder <- read.csv("data/gapminder_data.csv")

# Make minimal plot
# It should be blank
ggplot(data = gapminder)

# Add aesthetics to plot
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) + geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp)) + geom_point()

ggplot(data = gapminder, mapping = aes(x = year, y = lifeExp, color=continent)) + geom_line()

ggplot(data = gapminder, 
       mapping = aes(x=year, y=lifeExp, group=country, color=continent)) + geom_line() + geom_point()

ggplot(data = gapminder,
       mapping = aes(x=year,
                     y=lifeExp,
                     group=country)) +
  geom_line(mapping = aes(color=continent)) +
  geom_point()

ggplot(data = gapminder,
       mapping = aes(x=year,
                     y=lifeExp,
                     group=country)) +
  geom_point() +
  geom_line(mapping = aes(color=continent))

# Original Plot
ggplot(data = gapminder, mapping = aes(x = gdpPercap,
                                       y = lifeExp)) +
  geom_point()

# Scaling and alpha
ggplot(data = gapminder, mapping = aes(x = gdpPercap,
                                       y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10()

# Use lm method with geom_smooth
ggplot(data = gapminder, mapping = aes(x = gdpPercap,
                                       y = lifeExp)) +
  geom_point(alpha = 0.5) + scale_x_log10() + geom_smooth(method="lm",
                                                          linewidth=1.5)

# Creating a multipanel plot
americas <- gapminder[gapminder$continent == "Americas",]

life_exp_plot <- ggplot(data = americas, mapping = aes(x = year,
                                      y = lifeExp,
                                      color = continent)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45)) +
  labs(x = "Year", y = "Life Expectancy", title = "Figure 1",
       color = "Continent")

# Show the plot
life_exp_plot

# Export as png
ggsave(filename = "output/life_exp.png",
       plot = life_exp_plot,
       width = 12,
       height = 10,
       dpi = 300,
       units = "cm")









