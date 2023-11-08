##############################################
####### Aula CE2 - Prof. Thais         #######
#######       FUNCTIONS                #######
##############################################

# Geração de números aleatórios
library(tidyverse)
set.seed(1526)
rnorm(10)
x<-2
y<-3
rnorm(10)
set.seed(984651)
rnorm(10)

df <- tibble(
  a = rnorm(10), b = rnorm(10),
  c = rnorm(10), d = rnorm(10))


# Exemplo do slide IQR
set.seed(123)
x <- rnorm(10)
na.rm <- T 
type <- 7
diff(quantile(as.numeric(x), c(0.25, 0.75),
              na.rm = na.rm, names = FALSE,
              type = type))


IQR <- function (x, na.rm = FALSE, type = 7) {
  diff(quantile(as.numeric(x), c(0.25, 0.75),
                na.rm = na.rm, names = FALSE,
                type = type))
}


# Exemplo do slide - padronização
x <- df$a
remove.na <- T
(x - min(x, na.rm= remove.na))/ (max(x, na.rm=remove.na ) - min(x, na.rm=remove.na))


rescale <- function (x, remove.na = F){
  (x - min(x, na.rm = remove.na)) / (max(x, na.rm = remove.na) - 
                                       min(x, na.rm = remove.na))
}
rescale(df$a, remove.na = T)
rescale(df$b, remove.na = T)
rescale(df$c, remove.na = T)
rescale(df$d, remove.na = T)


# testando a função rescale
# opção 1: variando os inputs
rescale(c(1, 2, 3, NA, 5), remove.na=F)
rescale(c(0, 0.1, 0.2, 0.7, 1), remove.na=T)

# opção 2: extraindo corpo da função
x = c(1, 2, 3, NA, 5)
remove.na = T
(x - min(x, na.rm = remove.na)) / (max(x, na.rm = remove.na) - 
                                     min(x, na.rm = remove.na))


# outra função rescale
range(df$a)

rescale <- function (x, remove.na = F){
  (x - min(x, na.rm = na.rm)) / diff(range(x, na.rm = remove.na))
}


## Outra opção: função rescale01
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
   (x - rng[1]) / (rng[2] - rng[1])
}
rescale01(c(0, 5, 10))

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  oi = (x - rng[1]) / (rng[2] - rng[1])
}
resposta = rescale01(c(0, 5, 10))


## Exercise 2
## Write your own function to compute the variance of a vector 

x <- c(1,10,100,1000, NA)
remover <- T
xbar <- mean(x, na.rm = remover)
x <- x[!is.na(x)]
n <- length(x)
sum((x-xbar)^2)/(n-1)

variancia <- function(x ){
  if(is.numeric(x)==F){
    warning("X deve ser um vetor numérico") # print, return, stop, warning
  }
  n <-  length(x)
  xbar <- mean(x)
  sum((x-xbar)^2)/(n-1)
}

v <- 1:5
v <- c("1","2","3")
variancia(v)
var(v)
