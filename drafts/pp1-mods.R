library(readr)
library(lme4)

mdata <- read_csv("export/prosody_data.csv")

pp1.full <- glmer(PP1 ~ SpeechAct * PP2Status * Reading + (1|SID) + (1|IID),data=mdata,family = "binomial")
pp1.red1a <- glmer(PP1 ~ SpeechAct * PP2Status + Reading + (1|SID) + (1|IID),data=mdata,family = "binomial")
pp1.red1b <- glmer(PP1 ~ SpeechAct * Reading + PP2Status * Reading + (1|SID) + (1|IID),data=mdata,family = "binomial")
pp1.red2 <- glmer(PP1 ~ SpeechAct  * PP2Status + (1|SID) + (1|IID),data=mdata,family = "binomial")
pp1.red3 <- glmer(PP1 ~ SpeechAct  + PP2Status + (1|SID) + (1|IID),data=mdata,family = "binomial")
pp1.red4 <- glmer(PP1 ~ PP2Status + (1 + PP2Status|SID) + (1+PP2Stats|IID),data=mdata,family = "binomial")
pp1.redRS <- glmer(PP1 ~ PP2Status + (1 + PP2Status|SID) + (1+PP2Status|IID),data=mdata,family = "binomial")
pp1.min <- glmer(PP1 ~ (1|SID) + (1|IID),data=mdata,family = "binomial")
pp1.red5 <- glmer(PP1 ~ SpeechAct + (1|SID) + (1|IID),data=mdata,family = "binomial")
pp1.red6 <- glmer(PP1 ~ PP2Status + (1|IID),data=mdata,family = "binomial")
pp1.red7 <- glmer(PP1 ~ PP2Status + (1|SID),data=mdata,family = "binomial")

anova(pp1.full,pp1.red2)
anova(pp1.red2,pp1.red3)
anova(pp1.red3,pp1.red4)
anova(pp1.red4,pp1.min)
anova(pp1.red5,pp1.min)

summary(pp1.red4)