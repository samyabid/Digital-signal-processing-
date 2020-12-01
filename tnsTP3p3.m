close all; clear all; clc;

nu1 = 2625;
nu2 = 7280;
nu3 = 10000;
nue = 20000;

nu1_r = nu1/nue;
nu2_r = nu2/nue;
nu3_r = nu3/nue;

z1 = exp(2*i*pi*nu1_r);
z1c = exp(-2*i*pi*nu1_r);
z2 = exp(2*i*pi*nu2_r);
z2c = exp(-2*i*pi*nu2_r);
z3 = exp(2*i*pi*nu3_r);
z3c = exp(-2*i*pi*nu3_r);  # on calcule les zero

racines = [z1,z1c,z2,z2c,z3,z3c]
polynome = real(poly(racines)); # coefficients du polynome (les parties imaginaires sont nulles

polynome = 1/polyval(polynome,1) * polynome; # on normalise

# reponse frequentielle / gain complexe
N = 10000; # nombre de points ou sera evalué notre filtre
[h,w] = freqz(polynome,1,N,nue);
racines_empiriques = roots(polynome);

# on affiche les courbes : 
figure (3)

subplot(2,2,1)
# diagramme pole zeros
hold on
plot(real(roots(polynome)),imag(roots(polynome)),"bo");
t = linspace(0,2*pi,100);
plot(cos(t),sin(t))
xlabel("Axe des reels")
ylabel("Axe des imaginaires")
title("Diagramme pole zeros")

subplot(2,2,2)
# reponse impultionnelle
stem(polynome);
title("reponse impultionelle")
xlabel("k")
ylabel("h(k)")

subplot(2,2,3)
# module du gain complexe
plot(w,20*log10(h))
title("Gain complexe (module)")
xlabel("frequences")


subplot(2,2,4)
# phase du gain complexe
plot(w,angle(h))
title("Phase du gain complexe")
xlabel("frequence")

# partie 3.3

load signal16.mat

nua = 2625;
nub = 7280;

A = 8;
sin1 = A*sin(2*pi*nua*t);
sin2 = A*sin(2*pi*nub*t);
s_brouille = s+sin1+sin2;
N = 3000
#figure(16)
#plot (real(fft(sin1,4000)))

signal_filtre = filter(polynome,1,s_brouille);


f = 0:1/N:1-1/N;
f = f * nue;


figure(17)
subplot(3,1,1)
plot(s)
title("Signal originel")
xlabel("indices k") 
subplot(3,1,2)
plot(s_brouille)
title("Signal brouille")
xlabel("indices")
subplot(3,1,3)
plot(signal_filtre)
title("Signal filtre")
xlabel("indices k")




figure(18)
subplot(3,1,1)
plot(f,abs(fft(s,N)).^2)
title("densite spectrale du signal s originel")
xlabel("frequences")
subplot(3,1,2)
plot(f,abs(fft(s_brouille,N)).^2)
title("densite spectrale du signal s brouille")
xlabel("frequences")
subplot(3,1,3)
plot(f,abs(fft(signal_filtre,N)).^2)
title("densite spectrale du signal s ")
xlabel("frequences")





