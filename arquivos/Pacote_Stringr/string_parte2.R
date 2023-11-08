# Regular Expressions #

library(tidyverse)

# It's a language tha allow you to desceibe patterns in strings

?regex
x <- c('apple', 'banana', 'pear')
str_view(x, "an")
str_view("bananana", ".a.")


#how do you match the character "."?
#Só o ponto significa que você quer qualquer caracter, mas se você quer achar um ponto você precisa usar
#duas contrabarras e o ponto \\.
x <- c('apple.', 'banana', 'pear')
str_view_all(x, "\\.")

#How do you match de character "\"?

#Aqui colocar 2 contrabarras pq eu quero que ela apareça uma contra barra quando colocar no writelines
x <- c('apple\\', 'banana', 'pear')
writeLines(x)

str_view(x, "\\\\")

#Anchor 
x <- c('apple', 'banana', 'pear')
str_view(x, "^a") #encontrar a primeira letra a, comece com a letra a o ^ indica começo
str_view(x, "a$") # termina com a letra a

#character classes

x<-c('dog\'', 'cat1', 'cat2')
str_view_all(x, "[digit]") #encontra qualquer caracter que corresponda ao que está na palavra 
str_view_all(x, "[:digit:]")#classe especial, representa o que tá dentro, então no caso ele tá procurando um digito, um número
str_view_all(x, "[^digit]") #o circunflexo indica tudo exceto o que tá especificado
str_view_all(x, "[:^digit:]")
str_view_all(x, "[:digit:]$")#Procura digitos no fim da palavra

#alternation

str_view(c("grey", "gray"),"gr(e|a)y") #procura o que tive e ou a nessa posição da palavra
str_view(c("grey", "gray"),"gre|ay")#o que começa com gre ou o que termina com ay
str_view(c("grey", "gray"),"g(re|a)y")


#range

x <- c("apple", "banana", "pear")
str_view_all(x, "[a-i]") #intervalo abcdefhi
str_view_all(x, "[aeiouy]")# pegar as vogais
str_view_all(x, "[^aeiou]") #tudo exceto essa classe


#repetition
x <- "1888: MDCCCLXXXVIII "
str_view_all(x, "Aula0?1") #pode ou não ter o carcater que tá escrito ali, então ele tá buscando Aula01 ou Aula1
#pode ou não ocorrer o caracter imediatamente antes dele

str_view(x, "CC+") #pode estar presente uma ou mais vezes no texto, se tem o caracter imediatamente antes

str_view(x, "CC*") #se tem 0 ou mais desse caracter imediantamente anterior, então tem algum c ou mais ?

str_view(x, 'C[LX]+')#tem uma letra c depois uma L e X repetidos 1 ou mais vezes
str_view(x, 'C{3}')# acha 3 c
str_view(x, 'C{4,}')# 4 ou mais
str_view(x, 'C{1,2}')

