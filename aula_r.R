#? Coment�rios com "?" s�o coment�rios normais
#! Coment�rios com "!" s�o c�digos errados
#* Coment�rios com "*" s�o para corre��es
# Apenas "#" s�o c�digos comentados (ignorados)
#TODO � algo para fazermos juntos

#? Vamos adicionar a biblioteca dplyr 
library(dplyr)

#? E outras bibliotecas que ser�o �teis
library(lubridate)
library(stringr)

#? Vamos come�ar com os dados de pokemon
#? https://www.kaggle.com/datasets/igorcoelho24/pokemon-all-generations/versions/1?resource=download
dados <- read.csv("Dados/Pokemon_full.csv")
head(dados) #? v� as primeiras linhas de dados
#dados <- read.csv("D:/Aulas/ferramentasdemodelagem/R/Dados/Pokemon_full.csv")
#? A biblioteca dplyr possui o operador "pipe"
#? dado por  %>%
#? Ele "pega" tudo que est� � esquerda dele e coloca como primeiro elemento
#? da fun��o � direita.
#? Tamb�m � poss�vel usar o operador "."
#? para especificar onde ele deve substituir.

#? Exemplo: contar o n�mero de linhas de dados

nrow(dados)
dados %>% nrow()
dados %>% nrow(.)


## grepl() # verifica se um padr�o de string esta em um elemento
grepl("ap", "apple")
grepl("apple", "ap")

x <- "apple"

x %>% grepl("ap", .)
x %>% grepl("ap")

#? Algumas fun��es da biblioteca dplyr

#? A fun��o filter seleciona linhas com base em um teste
df_grass <- filter(dados, type == "grass")
df_grass

#? podemos usar o seguinte comando tamb�m
dados %>% filter(type == "grass")

#TODO Vamos filtrar todos os pokemons do tipo fogo ou �gua

df_fogo_e_agua <- dados %>% filter(type == "fire" | type == "water")

#TODO Vamos filtrar todos os pokemons que tem  "fly"

dados %>% filter(grepl("fly", name))

#TODO Vamos filtrar todos os pokemons que tem  "bee" ou "saur"

dados %>% filter(grepl("bee",name) | grepl("saur",name))
