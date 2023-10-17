# Problem 3

library(ggplot2)

# Load necessary libraries (assuming you have data loaded)
library(ggplot2)

# Create a scatter plot of linear diameter vs. distance
# D represents the distance to the galaxy in Mpc, can be considered a spacial position
# 'a_26' represents the linear diameter of the galaxy in kpc.
ggplot(data =  galaxies, aes(x = D, y = a_26)) +
  geom_point(alpha = 0.5) +
  labs(x = "Distance (Mpc)", y = "Linear Diameter (kpc)") +
  ggtitle("Galaxy Linear Diameter vs. Distance") +
  theme_minimal() 

# It seems like there are fewer data points at the 11 Mpc. Suggest that the smaller
# galaxies are underrepresented. 
