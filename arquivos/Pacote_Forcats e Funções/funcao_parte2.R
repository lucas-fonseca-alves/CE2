##############################################
####### Aula CE2 - Prof. Thais         #######
#######       FUNCTIONS                #######
##############################################

## Exercise 2
## Write your own function to cumpute the variance of a vector 
variance <- function(x){
  (sum((x-mean(x))^2))/(length(x)-1)
}

z <- -100:100
var(z)
variance(z)


# Função rescale e RETURN
df <- tibble(
  a = rnorm(10), b = rnorm(10),
  c = rnorm(10), d = rnorm(10))

rescale <- function (x, bola = F){
  y <- x-min(x, na.rm = bola)
  z <- max(x, na.rm = bola) -  min(x, na.rm = bola)
  w <- y/z
  return(list(y,z,w))
}
rescale(df$a, bola=T)


## Return 
complicated_function <- function(x, y, z) {
  if (length(x) == 0 || length(y) == 0) {
    return(0)
  }
  
  # Complicated code here
}


## Environment
z <- 20000
f <- function(x) {
  z <- 10000
  j <- x^2
  x + z + j 
} 

y <- 100
f(y)
z


## Exercício: Escrever uma função que retorna o seguinte texto para a data que o usuário escolher
"Bom dia, hoje é sexta-feira dia 03 de maio de 2023!"

