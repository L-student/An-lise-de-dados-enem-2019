
#Trabalho Probabilidade e Estatística Lívia Soares e Pedro Henrique Isidoro
#Lendo o arquivo em formato .csv

ENEM <- read.csv2('ENEM2.csv' , sep=',' , dec=',')

#Chamar alguns pacotes para serem usados

library(gridExtra)
library(formattable)
library(dplyr)
library(psych)

#Criar um boxplot com as NOTA_ENEM
boxplot(ENEM$NOTA_ENEN,col = "pink", ylab = "Média no ENEM 2019", main = "Boxplot NOTAS ENEM 2019")

# Tabela de frequências:

#Criação da tabela frequência relativa
FreqRel <- table(cut(ENEM$NOTA_ENEN, seq(300, 800, l = 6)))
FreqRel
#Criação da tabela frequência absoluta
FreqAbs <-prop.table(FreqRel)
FreqAbs
FreqAbs <-percent(c(FreqAbs))
FreqAbs
#Criar uma tabela com as frequências
Tabela_frequencias <- data.frame(
  Frequencia_Relativa = c(FreqRel),
  Frequencia_Absoluta =  c(FreqAbs))
#Exibir a tabela
Tabela_frequencias
#Plotar a tabela
formattable(Tabela_frequencias)

#Criar um histograma com as NOTA_ENEM
#800 - 300 = 500 
#500 / 10 = 50

hist(ENEM$NOTA_ENEN, breaks = 50, col = "purple",xlab = "Média geral", ylab = "Frequência", main = "Histograma com a frequência das notas - ENEM 2019(Lívia)")


#Gerar um gráfico de barras com as NOTA_ENEN agrupado pelos quartis e sexo e interpretar os valores.

#Gera os quartis da das notas
Quartil_Nota <- c(quantile(ENEM$NOTA_ENEN))
Quartil_Nota

#Transformar Feminino em 1 e masculino em 0 para uma melhor manipulação dos dados
GENERO <- ENEM$NOTA_ENEN
for(i in 1:67192){
  if(ENEM$TP_SEXO[i] == 'Feminino'){
    GENERO[i] = 1
  }else{
    GENERO[i] = 0
  }
}
#Criar variáveis para armazenar a quantidade feminina(m) e masculina (n) em cada quartil
m1 = 0
m2 = 0
m3 = 0
m4 = 0
n1 = 0
n2 = 0
n3 = 0 
n4 = 0
#Calcular a quantidade de cada um 
for(i in 1:67192){
  if(i < 16798){
    if(GENERO[i] == 1){m1 = m1 + 1}
    else{n1 = n1 + 1}
    }
  else{if(i < 33596){
      if(GENERO[i] == 1){m2 = m2 +1}
      else{n2 = n2 + 1}
    }
    else{if(i < 50394){
        if(GENERO[i] == 1){m3 = m3 + 1}
        else{n3 = n3 + 1}
      }
      else{if(GENERO[i] == 1){m4 = m4 + 1}
        else{n4 = n4 + 1}
      }
    }
  }
}
Percentil_MF<-c(m1,n1,m2,n2,m3,n3,m4,n4)
Per_Gen <-matrix(data = Percentil_MF, ncol = 4, byrow = TRUE,
            dimnames = (list(c("Feminino","Masculino"),
                             c("0% - 25%","25% - 50%","50% - 75%","75% - 100%"))))
#Gerar o gráfico com os respectivos quartis
barplot(Per_Gen,
        main = "Mulheres e homens por percentil",
        xlab = "Percentis",
        col = c("purple","green")
)
legend("topleft",
       c("Mulheres","Homens"),
       fill = c("purple","green")
)


