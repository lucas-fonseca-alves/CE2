###################################
####### Regular expressions #######
###################################
library(tidyverse)

## It is language that allow you to describe 
## patterns in strings
?regex
x <- c("apple", "banana", "pear")
str_view(x, "an")

str_view(x, ".a.")
str_view("bananana", ".a.")
str_view_all("bananana", ".a.")
# obs.: matches never overlap

# how do you match the character “.”?
x <- c("apple. ", "banana", "pear")
str_view_all(x, ".")
str_view_all(x, "\.")
str_view_all(x, "\\.") # reg. expr. \.
1. escrever um texto
2. ler o texto e tranformar em expressão regular
3. Interpretar a expressão regular para a leitura literal

# how do you match the character “\”?
x <- c("apple\\", "banana", "pear")
writeLines(x)

str_view(x, "\\\\") # reg. exp. \\


# Anchor
x <- c("apple", "banana", "pear")
str_view(x, "^a")
str_view(x, "a$")


# Character classes
x <- c("dog\"", "cat1", "cat2")
writeLines(x)

str_view_all(x, "[digit]")
str_view_all(x, "^[:digit:]")
str_view_all(x, "[:digit:]")
str_view_all(x, "[^digit]")
str_view_all(x, "[:^digit:]")
str_view_all(x, "[\"]")


# Look for a literal character that normally has special meaning in a regex
str_view(c("abc", "a.c", "a*c", "a c"), "a\\.c") 
str_view(c("abc", "a.c", "a*c", "a c"), "a[.]c")
1. texto: "a\\.c"
2. expressão regular: "a\.c"
3. padrão: a.c

# alternation
str_view(c("grey", "gray"), "gr(e|a)y")
str_view(c("grey", "gray"), "gre|ay")
str_view(c("grey", "gray"), "g(re|a)y")
1. grey
2. gay

# range
x <- c("Apple", "banana", "pear")
str_view_all(x, "[a-i]") # abcdefghi
str_view_all(x, "[I-f]") # range com algumas maiúsculas e outras minúsculas
str_view_all(x, "^[A-Z].*[a-z]$") # começa com maiúscula e termina com minúscula
str_view_all(x, "^[A-Z][a-z]$") # começa com maiúscula e termina com minúscula
str_view_all(x, "[aeiouy]") # vogais
str_view_all(x, "[^aeiouy]") # consoantes 

# Repetition
x <- "1888: MDCCCCCCLXXXVIII"
str_view_all(x, "Aula0?1") # 0/1  => Aula01 ou Aula1
str_view(x, "CC+") # 1+
str_view(x, "CC*") # 0+
str_view(x, "CCC")

str_view(x, 'C[LX]+')
str_view(x, 'C{3}')
str_view(x, 'C{4,}')
str_view_all(x, 'C{1,2}')
