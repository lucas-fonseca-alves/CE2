library(tidyverse)


#Criando a coluna delayded que representa os voos que estão atrasados
flight <- flight %>% 
  mutate(delayded = arr_delay > 0)

#Filtra os que não são NA e cria o sumario com o total e a proporção(Média)
flight %>% 
  filter(!is.na(delayded)) %>% 
  summarise(total_atrasados = sum(delayded), prop_atrasados =  mean(delayded) )


# Trabalhando com Strings 
install.packages("babynames")
library(babynames)

babynames <- babynames::babynames

#isolar a ultima letra de names

babynames <- babynames %>% 
  mutate(last_letter = str_sub(name,-1,-1))


#criar uma variavel lógica para caso seja a,e,i,o,u ou y

unique(babynames$last_letter)

babynames <- babynames %>% 
  mutate(last_letter = str_sub(name,-1), 
         logical_last_letter = last_letter %in% c("a","e","i","o","u","y"))

# Média ponderada 

#criando objeto peso da média ponderada
weight <-  babynames %>% 
  filter(last_letter %in% c("a","e","i","o","u","y") ) %>% 
  group_by(last_letter) %>% 
  summarise(qtd = sum(logical_last_letter))


prop_name_end_vowel <- babynames %>% 
  mutate(last_letter = str_sub(name,-1), 
         logical_last_letter = last_letter %in% c("a","e","i","o","u","y")) %>% 
  group_by(year, sex) %>% 
  summarise(p_vowel = weighted.mean(logical_last_letter, n)) %>% 
  ggplot(aes(year,p_vowel, color = sex)) +
  geom_line()



