##############################################
####### Aula CE2 - Prof. Thais #######
##############################################


## Loading packages
library(tidyverse)
#library(stringr)

###################################
## Exercício do slide Aula 02 #####
###################################
library(babynames)
library(nycflights13)
babynames %>%
  mutate(last = str_sub(name, -1),
         vowel = last %in% c("a", "e", "i", "o", "u", "y")) %>%
  group_by(year, sex) %>%
  summarise(p_vowel = weighted.mean(vowel, n)) %>%
  ggplot(aes(year, p_vowel, color=sex)) +
  geom_line()


###################################
####### Strings Basic #############
###################################

# Creating a string
string1 <- "This is a string"
string1

# Escape character:  \ 
double_quote <- "\""
double_quote
writeLines(double_quote)

# quiz: include a literal backslash
backslash <- "\\"
writeLines(backslash)

# quiz: write http:\\
text <- "http:\\\\"
text
writeLines(text)

# quiz: write "http:\\"
text <- " \"http:\\\\\" "
text
writeLines(text)

text <- ' "http:\\\\" '
text2 <- " 'http:\\\\' " 
writeLines(text)
writeLines(text2)


# Special characters
?"'"
x <- "\u00b5"
x

setwd("C:\\Users\\Professor\\Desktop")


# Number of characters in a string
str_length(c("a", "R for data science", NA))
str_length("   ")

# Combine strings
str_c("x", "y", "z", sep = "_")
str_c("x", "y", "z")
str_c("Turma-", c("a", "b", "c"), "-Prof.Thais")
?str_c

pessoas <- c(" Rafael", " Andre", " Mateus")
n <- length(pessoas)
birthday <- c(T, F, F)
for(i in 1:n){
  writeLines(str_c("Good morning", pessoas[i], 
                   if(birthday[i]) " and happy birthday", "!"))
}

# Vector collapse
str_c("x", "y", "z", sep = ", ")

vet1 <- c("x", "y", "z")
str_c(vet1, collapse = ", ") 

length(vet1)
length(vet2)

# Subsetting strings  
x <- c("Apple", "Banana", "Pear")
str_sub(x, 1, 3)
str_sub(x, -3, -1)
str_to_lower(str_sub(x, 1, 1))
str_sub(x, 1, 1) <- str_to_lower(str_sub(x, 1, 1))
x <- str_to_lower(x)
str_sub(x, 1, 1) <- "Anajapjsdp"
x

x
str_to_lower(x)
?str_to_lower

dog <- "The quick brown dog"
str_to_upper(dog)
str_to_lower(dog)
str_to_title(dog)
str_to_sentence("the quick brown dog")
