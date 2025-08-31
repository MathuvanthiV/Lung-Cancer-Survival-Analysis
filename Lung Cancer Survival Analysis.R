library(survival)

data(veteran)


#0. Basic Analysis

veteran$trt <- factor(veteran$trt, labels = c("Standard", "Test"))
veteran$celltype <- factor(veteran$celltype,
                           labels = c("Squamous", "Small Cell", "Adeno", "Large"))


km_trt <- survfit(Surv(time, status) ~ trt, data = veteran)
plot(km_trt, col = c("blue","red"), lty = 1:2,
     xlab = "Days", ylab = "Survival Probability",
     main = "Survival by Treatment")
legend("topright", legend = c("Standard","Test"), col = c("blue","red"), lty = 1:2, bty = "n")


cox_model <- coxph(Surv(time, status) ~ trt + age + karno + celltype, data = veteran)


cox_model

newdata <- data.frame(
  trt = factor(c("Standard","Test"), levels = levels(veteran$trt)),
  age = mean(veteran$age),
  karno = mean(veteran$karno),
  celltype = factor("Squamous", levels = levels(veteran$celltype))
)
fit_adj <- survfit(cox_model, newdata = newdata)
plot(fit_adj, col = c("blue","red"), lty = 1:2,
     xlab = "Days since Randomization",
     ylab = "Adjusted Survival Probability",
     main = "Adjusted Survival by Treatment (Cox Model)")
legend("topright", legend = c("Standard","Test"), col = c("blue","red"), lty = 1:2, bty = "n")


###########1. Kaplan Meir Curves by Tumor Type



km_cell <- survfit(Surv(time, status) ~ celltype, data = veteran)

km_cell

plot(km_cell, col = 1:4, lty = 1:4, xlab = "Days", ylab = "Survival Probability",
     main = "Kaplan-Meier Survival by Tumor Type")
legend("topright", legend = levels(veteran$celltype), col = 1:4, lty = 1:4, bty = "n")


#################2. Survival by Karnofsky Performance Score


veteran$karno_group <- cut(veteran$karno, breaks=c(0,50,70,100), labels=c("Low","Medium","High"))


km_karno <- survfit(Surv(time, status) ~ karno_group, data = veteran)
plot(km_karno, col=1:3, lty=1:3, xlab="Days", ylab="Survival Probability",
     main="Survival by Karnofsky Score Group")
legend("topright", legend=levels(veteran$karno_group), col=1:3, lty=1:3, bty="n")





###########3. Interaction Between Treatment and Tumor Type



cox_inter <- coxph(Surv(time, status) ~ trt * celltype + age + karno, data = veteran)
summary(cox_inter)



###########4. # Example patient: 65 years old, High Karnofsky, Small Cell

new_patient <- data.frame(
  trt = factor("Standard", levels=c("Standard","Test")),
  age = 65,
  karno = 80,
  celltype = factor("Small Cell", levels=levels(veteran$celltype))
)

pred_fit <- survfit(cox_model, newdata=new_patient)


pred_df <- data.frame(
  Days = pred_fit$time,
  Survival_Prob = pred_fit$surv
)
head(pred_df, 10)  
median_surv <- summary(pred_fit)$table["median"]
median_surv

lp <- predict(cox_model, newdata=new_patient, type="lp")


HR <- exp(lp)
HR


plot(pred_fit, xlab="Days", ylab="Survival Probability", main="Predicted Survival for Example Patient")



####5. Forest Plot of Hazard Ratios

hr <- exp(coef(cox_model))
lower <- exp(confint(cox_model)[,1])
upper <- exp(confint(cox_model)[,2])
vars <- names(hr)

plot(hr, 1:length(hr), xlim=c(min(lower)*0.9, max(upper)*1.1), pch=19, yaxt="n",
     xlab="Hazard Ratio", ylab="", main="Forest Plot of Cox Model")
axis(2, at=1:length(hr), labels=vars, las=1)
segments(lower, 1:length(hr), upper, 1:length(hr))
abline(v=1, col="red", lty=2)




hr <- exp(coef(cox_inter))
lower <- exp(confint(cox_inter)[,1])
upper <- exp(confint(cox_inter)[,2])
vars <- names(hr)

plot(hr, 1:length(hr), xlim=c(min(lower)*0.9, max(upper)*1.1), pch=19, yaxt="n",
     xlab="Hazard Ratio", ylab="", main="Forest Plot of Cox Model")
axis(2, at=1:length(hr), labels=vars, las=1)
segments(lower, 1:length(hr), upper, 1:length(hr))
abline(v=1, col="red", lty=2)


##################################

