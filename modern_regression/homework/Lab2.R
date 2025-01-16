getwd()

Carseats = read.csv("Carseats.csv") 

?Carseats

dim(Carseats)
#400 rows, 11 columns
head(Carseats)

attach(Carseats)
lm.fit = lm(Sales~Price)
summary(lm.fit)

cor(Sales, Price)

predict(lm.fit, data.frame(Price=coef(lm.fit)), interval="confidence")

coef(lm.fit)
beta0hat = 13.64191518
beta1hat = -0.05307302
sale = beta0hat + beta1hat * 192
sale

predict(lm.fit, data.frame(Price=192), interval="confidence")
predict(lm.fit, data.frame(Price=192), interval="prediction")

plot(Price,Sales)
abline(lm.fit, lwd=3, col="red")

par(mfrow=c(2,2))
plot(lm.fit)
