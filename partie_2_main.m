clear all ; clc ; close all

M=5;
[S,k_S] = generateur_de_sequence_s_de_k (M);    # S est la fft de s le signal en question

# Générer le vecteur correspondant à X(f), TFTD de x[k], pour les fréquences comprises entre −1.5 ≤ f ≤ 1.5−1/N
# avec un pas ∆f =1/N et N = 2048.

N = 2048;
f = -1.5:1/N:1.5-1/N;
r = 0.91;
X_f = 1./(1-r*exp(-2*i*pi*f));

figure(2)
# parties reellees de S_f et X_f
subplot (2,2,1)
plot(f,real(X_f),k_S,real(S))
legend("X_f","S")
title("partie reelle")
xlabel("frequence reduite")
# parties imaginaires
subplot(2,2,2)
plot(f,imag(X_f),k_S,imag(S))
legend("X_f","S")
title("parties imaginaires")
xlabel("frequence reduite")
# modules
subplot(2,2,3)
plot(f,X_f,k_S,S)
legend("X_f","S")
title("modules")
xlabel("frequence reduite")
# phases
subplot(2,2,4)
plot(f,angle(X_f),k_S,angle(S))
legend("X_f","S")
title("phases")
xlabel("frequence reduite")

# partie fftshift
figure(3)
S_fftshift = fftshift(S);
k_S_fftshift = linspace(-0.5,0.5,N);


# parties reellees
subplot (2,2,1)
plot(f,real(X_f),k_S_fftshift,real(S_fftshift))
legend("X_f","S")
title("partie reelle")
xlabel("frequence reduite")
# parties imaginaires
subplot(2,2,2)
plot(f,imag(X_f),k_S_fftshift,imag(S_fftshift))
legend("X_f","S")
title("parties imaginaires")
xlabel("frequence reduite")
# modules
subplot(2,2,3)
plot(f,X_f,k_S_fftshift,S_fftshift)
legend("X_f","S")
title("modules")
xlabel("frequence reduite")
# phases
subplot(2,2,4)
plot(f,angle(X_f),k_S_fftshift,angle(S_fftshift))
legend("X_f","S")
title("phases")
xlabel("frequence reduite")











































