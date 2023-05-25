library(dplyr)
library(lubridate)
library(stringr)
library(ggplot2)
library(tidyr)


dados <- readr::read_rds("imdb.rds")
View(dados)
head(dados)
names(dados)

df <- dados %>% 
  select(titulo, orcamento, receita, receita_eua)
df

# um gráfico com 10 primeiros filmes
# barras
# cada barra vem de uma coluna e aparece com uma cor diferente

#TODO checar se cada filme tem apenas um genero associado

#? Pivoteamento

#? pivot_longer

df_long <- df %>%
  slice(1:10) %>% 
  tidyr::pivot_longer(2:4, values_to = "Valor", names_to = "Tipo de Valor")

df %>%
  slice(1:10) %>% 
  tidyr::pivot_longer(2:4, values_to = "Valor", names_to = "Tipo de Valor")




View(df %>% slice(1:10))
View(df_long)

# carregar

ggplot()+
  geom_col(data = df_long, aes(x = titulo, y = Valor, fill = `Tipo de Valor`),
           position = position_dodge2()
  )+
  theme_bw()+
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1.0)
  )



## Pivot wider
df_long %>% 
  tidyr::pivot_wider(names_from = `Tipo de Valor`, values_from = Valor)

correlation_matrix <- cor(df[, c("orcamento", "receita", "receita_eua")], use = "complete.obs")
print(correlation_matrix)
