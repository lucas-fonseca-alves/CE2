library(tidyverse)


# 1. From the words data: 
### a. Find all words that start or end with x.
pattern1 = "\\bx|x\\b"
pattern2 = "^x|x$"
words[str_detect(words, pattern2)]
str_subset(words, pattern1)
words[!is.na(str_extract(words, pattern1))]

### b. Find all words that start with a vowel and end with a consonant.
pattern = "^[aeiouy]&[^aeiouy]$" # obs: não funciona
pattern1 = "^[aeiouy]"
pattern2 = "[^aeiouy]$"
words[str_detect(words, pattern1) & str_detect(words, pattern2)]

pattern = "^[aeiouy].*[^aeiouy]$"
str_subset(words, "^[aeiouy].*[^aeiouy]$")

str_subset(words, "^[aeiouy][aeiouy].*[^aeiouy]$") # começa com 2 vogais
str_subset(words, "^[aeiouy]{2}.*[^aeiouy]$") # começa com 2 vogais
str_subset(words, "^[aeiouy].*[^aeiouy]{2}$") # termina com 2 consoantes


# 2. From the Harvard sentences data, extract:
### a. The first word from each sentence.
pattern = "^.*\\b$" # não funciona
sentences[str_detect(sentences, pattern)]
str_subset(sentences, pattern)
head(sentences)

pattern2 = "[:alpha:]+"
pattern2 = "[A-Za-z]+"
pattern2 = "[^ ]+" # essa opção não exclui caracteres como , - '
pattern2 = "[^ ]{1,}"
str_extract(sentences, pattern2)
str_extract_all(sentences, pattern2)

### b. All words ending in ing.
pattern = "[:alpha:]*ing\\b"
pattern = "\\b[A-Za-z]+ing\\b"
frases = str_subset(sentences, pattern )  # opção 1
unique(str_extract_all(frases, pattern, simplify = T)) # opção 1

unique(str_extract_all(sentences, pattern, simplify = T))[-1] # opção 2
