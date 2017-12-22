######################################
######################################
######################################

dados_bruno <- read.csv2("dados_bruno.csv")
dados_bruno


if(!require(fitdistrplus)){install.packages("fitdistrplus", dependencies = T);require(fitdistrplus)}

######################################
######################################
######################################

tapply(dados_bruno$resp, dados_bruno$id,function (resp) coef (fitdist(resp, "weibull")))

tapply(dados_bruno$resp, dados_bruno$id,function (resp) coef (fitdist(resp, "gamma")))

tapply(dados_bruno$resp, dados_bruno$id,function (resp) coef (fitdist(resp, "cauchy")))

tapply(dados_bruno$resp, dados_bruno$id,function (resp) coef (fitdist(resp, "logis")))
