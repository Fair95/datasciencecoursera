# q1
1100±2.306×30/sqrt(9)

# q2
# -2 + qt(0.975,9-1)*sd/sqrt(9) = 0
sd = 2*3/qt(0.975,8)

# q6 unequal variance, two-sided
n1 <- n2 <- 100
xbar1 <- 4
xbar2 <- 6
s1 <- 0.5
s2 <- 2
xbar2 - xbar1 + c(-1, 1) * qnorm(0.975) * sqrt(s1^2/n1 + s2^2/n2)

# q7 equal variance, two-sided
n1 <- n2 <- 9
x1 <- -3 ##treated
x2 <- 1 ##placebo
s1 <- 1.5 ##treated
s2 <- 1.8 ##placebo
s <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2)/(n1 + n2 - 2))
(x1 - x2) + c(-1, 1) * qt(0.95, n1 + n2 - 2) * s * sqrt(1/n1 + 1/n2)