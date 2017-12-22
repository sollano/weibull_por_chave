if(!require(fitdistrplus)){install.packages("fitdistrplus", dependencies = T);require(fitdistrplus)}
if(!require(dplyr)){install.packages("dplyr", dependencies = T);require(dplyr)}

dados <- read.csv2("dados.csv")
head(dados,10)

# Os dados sao inseridos direto, sem a necessidade de separar em classes
ajuste_weibull <- dados %>% 
  group_by(PARCELA) %>%  # Aqui insere-se as variaveis chave, separadas por virgula
  do( ajuste = fitdist(.$DAP, "weibull") ) %>%  # Aqui a variavel resposta, e a distribuicao
  mutate(forma = coef(ajuste)[[1]],  # Os parametros aqui dependem da distribuicao
         escala = coef(ajuste)[[2]] ) %>% 
  select(-ajuste)

ajuste_weibull

write.csv2(ajuste_weibull, "ajuste_weibull.csv", row.names = F)
