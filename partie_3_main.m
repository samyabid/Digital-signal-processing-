clear all ; clc ; close all

# TFD de sinusoïdes

N = 70;
f0 = 5.2  / 35;


[S,k] = fonction_partie_3_sinusoides (f0,N);


# signal 5 periodes pas de parties imag 
# en quoi le fait que contenir 5 periodes exactement entraine une tfd reelle ?
# reponse a la question 3.D
# pour qu'une tfd sot reelle et pair, il faut que la sequence associee soit reelle et pair
# quand on calcule un tfd n points, on periodise la sequence temporelle tout les n points
# si on prolonge , on regarde les allures des signaux 5 periodes et plus que 5 periodes















































