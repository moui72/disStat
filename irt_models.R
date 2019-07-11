library("readr")
library("lme4")
library("lmerTest")

irt_data <- read_csv("drafts/export/irt_data.csv")


irt.max <- lmer(
  wirt ~ Condition_Q * Condition_GP + P2 + P1 + V + Asp +
    (1 | Participant) +
    (1 | Item),
  data = irt_data,
  REML=F
)

irt.nov <- lmer(
  wirt ~ Condition_Q * Condition_GP + P2 + P1 + Asp +
    (1 | Participant) +
    (1 | Item),
  data = irt_data,
  REML=F
)


irt.nogp<- lmer(
  wirt ~ Condition_Q + P2 + P1 + Asp +
    (1 | Participant) +
    (1 | Item),
  data = irt_data,
  REML=F
)
irt.nogp2<- lmer(
  wirt ~ Condition_Q + P2s + P1 +
    (1 | Participant) +
    (1 | Item),
  data = irt_data,
  REML=F
)

irt.nogpPP2<- lmer(
  wirt ~ Condition_Q + P2 +
    (1 | Participant) +
    (1 | Item),
  data = irt_data,
  REML=F
)
irt.nogpPP2s<- lmer(
  wirt ~ Condition_Q + P2s +
    (1 | Participant) +
    (1 | Item),
  data = irt_data,
  REML=F
)

irt.nogp4<- lmer(
  wirt ~ Condition_Q * P2s +
    (1 | Participant) +
    (1 | Item),
  data = irt_data,
  REML=F
)
irt.nogpq<- lmer(
  wirt ~ P2s +
    (1 | Participant) +
    (1 | Item),
  data = irt_data,
  REML=F
)

irt.nogp.int<- lmer(
  wirt ~ Condition_Q * P2s + P1 +
    (1 | Participant) +
    (1 | Item),
  data = irt_data,
  REML=F
)

irt.p2 <- lmer(
  wirt ~ Condition_Q * Condition_GP + P2 +
    (1 | Participant) +
    (1 | Item),
  data = irt_data,
  REML=F
)

irt.full <- lmer(
  wirt ~ Condition_GP * Condition_Q + 
    (1 | Participant) + 
    (1 | Item),
  data = irt_data,
  REML=F
)
irt.noint <- lmer(
  wirt ~ Condition_Q + Condition_GP + 
    (1 | Participant) + 
    (1 | Item),
  data = irt_data,
  REML=F
)
irt.noq <- lmer(
  wirt ~  Condition_GP + 
    (1 | Participant) + 
    (1 | Item),
  data = irt_data,
  REML=F
)
