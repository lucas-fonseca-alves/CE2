##############################################
####### Aula CE2 - Prof. Thais         #######
#######       IF STATEMENT             #######
##############################################


## If statement
x <- 1:10
x <- x-mean(x)
x
#x <- 1:10

# exemplo 1
# observe a diferença entre stop/print/warning
# condition: mean(x)!=0
if(mean(x)!=0){
  x/mean(x)
}else{
  stop("A variável x tem média zero.") 
  x/(mean(x)+.000000000001)
}


## Note que o "else" pode ser opcional
if(mean(x)==0){
  stop("você tem certeza disso?")
}
x/mean(x)


if(mean(x)==0){
  x + 0.00000001
}
x/mean(x)


# exemplo 2: Erro!
x <- 1:10
#all(x!=0)
#any(x!=0)
sum(x!=0)>=2
any(x!=0)
x

if(all(x!=0)){
  x/mean(x)
}else{
  stop("você tem certeza disso?")
}

# all (todos são verdadeiros?), any (pelo menos 1 é verdadeiro?)



# exemplo 3: erro
x <- c(1,2,3,NA)
mean(x)
mean(x)!=0

if(mean(x)!=0){
  x/mean(x)
}else{
  stop("warning ...")
}


if(mean(x, na.rm=T)!=0){
  z = x/mean(x, na.rm=T)
  print(z + 5)
  2 + 2
}else{
  stop("warning ...")
}


x <- c(1,2,3)
if(all(x>0)){
  sqrt(x)
}else{
  stop("warning ...")
}


# It’s ok to drop the curly braces if you have 
# a very short if statement that can fit on one line
x <- 1:10
if(all(x>0)){
  z <- sqrt(x)
}else{
  z <- sqrt(abs(x))
}

x <- 1:10
if(all(x>0)){z<-sqrt(x)}else{z<-sqrt(abs(x))}
if(all(x>0)) z<-sqrt(x)  else z<-sqrt(abs(x))


## Combine multiple logical expressions
# ||, &&, any, all, == , near
x <- 1:10
y <- -1:-10
mean(x)>0
mean(y)>0

mean(x)>0 || mean(y)>0 # OU não vetorizado
mean(x)>0 | mean(y)>0 # OU vetorizado (elemento a elemento)

x>0 || mean(y)>0 # OU não vetorizado: ERRO pois || não é vetorizada
x>0 | mean(y)>0 # OU vetorizado (elemento a elemento)

if(mean(x)>0 || mean(y)>0){
  sqrt(x)
}else{
  stop("warning ...")
}

x<- c(T,T) 
y<- c(T,F) 

x||y

x&&y



if(mean(x)>0 && mean(y)>0){
  sqrt(x)
}else{
  stop("warning mean(x)< 0 or mean(y)< 0")
}

library(tidyverse)
y <- 2
z <- sqrt(2)^2
typeof(y)
typeof(z)
y==z

if(y==z){ #evitar esse código e utilizar NEAR
  
}
near(y,z)
?near
near(2, 1.9999999)
near(2, 1.9999999, tol=0.001)
.Machine$double.eps^0.5
near

## Write multiple conditions
if (this) {
  # do that
} else if (that) {
  # do something else
}else {
  # 
}

## Exercise
# Write a greeting function that says “good morning”, 
# “good afternoon”, or “good evening”, depending on 
# the time of day. (Hint: use a time argument that 
# defaults to lubridate::now().)