
#Trabalho Probabilidade e Estatística Lívia Soares e Pedro Henrique Isidoro
#Lendo o arquivo em formato .csv

ENEM <- read.csv2('ENEM2.csv' , sep=',' , dec=',')

#Instalar alguns pacotes caso não estejam instalados

if(!require(dplyr))
  install.packages("dplyr")
library(dplyr)

if(!require(psych))
  install.packages("psych")
library(psych)

#Criar um boxplot com as NOTA_ENEM
boxplot(ENEM$NOTA_ENEN,col = "pink", ylab = "Média no ENEM 2019", main = "Boxplot NOTAS ENEM 2019")

#Criar um histograma com as NOTA_ENEM
#800 - 300 = 
hist(ENEM$NOTA_ENEN)

hist(dados$NOTA_ENEN, breaks = 14, col = "green", ylab = "Média no ENEM 2019", main = "Histograma com a frequência das notas - ENEM 2019")

glimpse(ENEM)

