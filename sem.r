### Inlämningsuppgift Strukturekvationsmodeller
library(lavaan)
library(sem)

data_path <- ("C:\\Users\\Arian\\Documents\\R\\psych-stats\\SEM_Attachment_Depression.txt")
data <- read.table(data_path, header = TRUE)

names(data)

model <- '
  # mätmodellen
  attach_anxiety =~ Anxiety_1 + Anxiety_2 + Anxiety_3
  attach_avoid =~ Avoid_1 + Avoid_2 + Avoid_3
  dependence =~ DEQ_D + PSI_D
  self_criticism =~ DEQ_SC + PSI_SC
  depression =~ SDS + CES_D + DASS_D
  
  # regressionseffekter
  dependence ~ attach_anxiety + attach_avoid
  self_criticism ~ attach_anxiety + attach_avoid
  depression ~ attach_anxiety + attach_avoid + dependence + self_criticism

  # korrelationer
  attach_anxiety ~~ attach_avoid
'

model_fit <- sem(model, data = data)
parameterEstimates(model_fit, standardized = TRUE)
summary(model_fit, standardized = TRUE)
