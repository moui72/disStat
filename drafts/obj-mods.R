library(readr)
library(lme4)

mdata <- read_csv("export/prosody_data.csv")

obj.full <- glmer(OBJ ~ SpeechAct * PP2Status * Reading + (1|SID) + (1|IID),data=mdata,family = "binomial")
obj.red1a <- glmer(OBJ ~ SpeechAct * PP2Status + Reading + (1|SID) + (1|IID),data=mdata,family = "binomial")
obj.red1b <- glmer(OBJ ~ SpeechAct * Reading + PP2Status * Reading + (1|SID) + (1|IID),data=mdata,family = "binomial")
obj.red2 <- glmer(OBJ ~ SpeechAct  * PP2Status + (1|SID) + (1|IID),data=mdata,family = "binomial")
obj.red3 <- glmer(OBJ ~ SpeechAct  + PP2Status + (1|SID) + (1|IID),data=mdata,family = "binomial")
obj.red4 <- glmer(OBJ ~ PP2Status + (1 + PP2Status|SID) + (1+PP2Status|IID),data=mdata,family = "binomial")
obj.redRS <- glmer(OBJ ~ PP2Status + (1 + PP2Status|SID) + (1+PP2Status|IID),data=mdata,family = "binomial")
obj.min <- glmer(OBJ ~ (1|SID) + (1|IID),data=mdata,family = "binomial")
obj.red5 <- glmer(OBJ ~ SpeechAct + (1|SID) + (1|IID),data=mdata,family = "binomial")
obj.red6 <- glmer(OBJ ~ PP2Status + (1|IID),data=mdata,family = "binomial")
obj.red7 <- glmer(OBJ ~ PP2Status + (1|SID),data=mdata,family = "binomial")

anova(obj.full,obj.red2)
anova(obj.red2,obj.red3)
anova(obj.red3,obj.red4)
anova(obj.red4,obj.min)
anova(obj.red5,obj.min)

#best
summary(obj.red3)
