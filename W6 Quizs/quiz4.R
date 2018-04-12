## q1
patient1 <- c(140,138,150,148,135)
patient2 <- c(132,135,151,146,130)
t.test(patient1,patient2,alternative = "two.sided",paired = TRUE)

## q2
1100 + c(-1, 1) * qt(0.975, 8) * 30/sqrt(9)

## q3
pbinom(2, size = 4, prob = 0.5, lower.tail = FALSE) ## 3 or 4

## q4
ppois(10,0.01*1787) ## less than or equal to 10 observed

## q5
n1 <- n2 <- 9
x1 <- -3 ##treated
x2 <- 1 ##placebo
s1 <- 1.5 ##treated
s2 <- 1.8 ##placebo
s <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2)/(n1 + n2 - 2))
ts <- (x1 - x2)/(s * sqrt(1/n1 + 1/n2))
2 * pt(ts, n1 + n2 - 2)

## q7
power.t.test(n = 100, delta = 0.01,sd = 0.04, sig.level = 0.05
             ,alternative = "one.sided",type = "one.sample")

## q8
power.t.test(power = 0.90, delta = 0.01,sd = 0.04,
             sig.level = 0.05,alternative = "one.sided",
             type = "one.sample")