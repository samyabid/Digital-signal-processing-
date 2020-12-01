%Definition du signal
[s,nue] = audioread('signal1.wav');
% soundsc(s);
 figure(1)
 sgram(s,nue,70,1);

%Definition des variables et creation des filtres avec la 
%methode des fenetres

N = 45;
window_1 = rectwin(N+1);
window_2 = hamming(N+1);
window_3 = hann(N+1);
window_4 = blackman(N+1);

nuc = 2800;
fc = 2*nuc/nue;
B_1 = fir1(N,fc,window_1); 
B_2 = fir1(N,fc,window_2);
B_3 = fir1(N,fc,window_3);
B_4 = fir1(N,fc,window_4);
N_suite = 1024;
% 
% %Tracés pour fenetre rectangulaire
% % 
figure(2);
subplot(2,2,1);
stem(B_1);
title("Réponse impulsionnelle avec une fenêtre rectangulaire")
xlabel("Indices")
ylabel("h[k]")
subplot(2,2,2);
zplane(roots(B_1));
title("Diagramme pôle-zéro avec une fenêtre rectangulaire")
subplot(2,2,3);
[H_f,nu]= freqz(B_1,1,N_suite,nue); %on prend un grand nombre d'indices 
%pour avoir la meilleure precision 
G = 20*log10(abs(H_f));
plot(nu,G);
title("Module du gain complexe avec une fenêtre rectangulaire")
xlabel("Fréquences en hertz")
ylabel("dB")
subplot(2,2,4);
plot(nu,unwrap(angle(H_f)))
title("Phase du gain complexe avec une fenêtre rectangulaire")
xlabel("Fréquences en hertz")
ylabel("Phase")
% % 
%%Tracés pour fenetre de Hamming
% 
figure(3);
subplot(2,2,1);
stem(B_2);
title("Réponse impulsionnelle avec une fenêtre de Hamming")
xlabel("Indices")
ylabel("h[k]")
subplot(2,2,2);
zplane(roots(B_2));
title("Diagramme pôle-zéro avec une fenêtre de Hamming")
subplot(2,2,3);
[H_f_h,nu]= freqz(B_2,1,N_suite,nue); %on prend un grand nombre d'indices 
%pour avoir la meilleure precision 
G = 20*log10(abs(H_f_h));
plot(nu,G);
title("Module du gain complexe avec une fenêtre de Hamming")
xlabel("Fréquences en hertz")
ylabel("dB")
subplot(2,2,4);
plot(nu,unwrap(angle(H_f_h)))
title("Phase du gain complexe avec une fenêtre de Hamming")
xlabel("Fréquences en hertz")
ylabel("Phase")
% 
% % %Comparaison des réponses impulsionnelles
% % 
figure(4);
subplot(2,1,1);
stem(B_1)
title("Réponse impulsionnelle avec une fenêtre rectangulaire")
xlabel("Indices")
subplot(2,1,2);
stem(B_2)
title("Réponse impulsionnelle avec une fenêtre de Hamming")
xlabel("Indices")
% 
% % 
% % %Comparaison des diagrammes pôle-zéro
% % 
figure(5);
subplot(2,1,1);
zplane(roots(B_1))
title("Diagramme pôle-zéro avec une fenêtre rectangulaire ")
subplot(2,1,2);
zplane(roots(B_2))
title("Diagramme pôle-zéro avec une fenêtre de Hamming ")
% % 
% % %Comparaison des modules de gains complexes
% % 
figure(6);
subplot(2,1,1);
[H_f_1,nu1]= freqz(B_1,1,N_suite,nue); %on prend un grand nombre d'indices 
%pour avoir la meilleure precision 
G = 20*log10(abs(H_f_1));
plot(nu1,G)
xlabel("Fréquences en hertz")
ylabel("dB")
title("Module du gain complexe avec une fenêtre rectangulaire")
subplot(2,1,2);
[H_f_2,nu2]= freqz(B_2,1,N_suite,nue); %on prend un grand nombre d'indices 
%pour avoir la meilleure precision 
G = 20*log10(abs(H_f_2));
plot(nu2,G)
xlabel("Fréquences en hertz")
ylabel("dB")
title("Module du gain complexe avec une fenêtre de Hamming")
% % 
% % %Comparaison des phases
% % 
figure(7);
subplot(2,1,1);
plot(nu,unwrap(angle(H_f_1)))
xlabel("Fréquences en hertz")
ylabel("Phase")
title("Phase du gain complexe avec une fenêtre rectangulaire")
subplot(2,1,2);
plot(nu,unwrap(angle(H_f_2)))
xlabel("Fréquences en hertz")
ylabel("Phase")
title("Phase du gain complexe avec une fenêtre de Hamming")
% 
% %filtrage
% 
s_f_1 = filter(B_1,1,s);
 s_f_2 = filter(B_2,1,s);
s_f_3 = filter(B_3,1,s);
s_f_4 = filter(B_4,1,s);
% 
% %soundsc(s_f_2);
 sgram(s_f_2,nue,70,12)
% 
% 
% 
%amelioration du filtre
 figure(8);
 sgram(s_f_2,nue,70,1)


%FILTRE RII

%Definition du filtre analogique

w_nuc=2*pi*nuc; %freqence de coupure en rad/s
W=0:1:2*pi*nue; 
Rp=1; %atténuation à la freqence de coupure
Rs=55; %atténuation au niveau de la bande atténuée
n=9; %ordre du filtre
[b,a]=ellip(n,Rp,Rs,w_nuc,'s'); 
[H_ana,nu_ana]=freqs(b,a,W);
G_H_ana=20*log10(abs(H_ana));
ang_H_ana = unwrap(angle(H_ana));

%tracés

figure(10);
subplot(2,1,1);
plot(nu_ana,G_H_ana);
xlabel("rad/s");
ylabel("dB");
title("Module du gain complexe d'un filtre elliptique d'ordre 7");
subplot(2,1,2);
plot(nu_ana,ang_H_ana)
xlabel("rad/s");
ylabel("Phase");
title("Phase du gain complexe d'un filtre elliptique d'ordre 7");


%filtre numérique
[B_n,A_n] = bilinear(b,a,nue,nuc);
[H_num,nu_num] = freqz(B_n,A_n,N_suite,nue);
[h_num, k_num] = impz(B_n,A_n);
G_H_num = 20*log10(abs(H_num));
ang_H_num = unwrap(angle(H_num));

%tracés
figure(11);

subplot(2,2,1);
stem(k_num,h_num);
title("Réponse impulsionnelle du filtre numérique issu d'un filtre analogique")
xlabel("Indices")
ylabel("h[k]")
subplot(2,2,2);
zplane(roots(B_n),roots(A_n));
title("Diagramme pôle-zéro du filtre numérique issu d'un filtre analogique")
subplot(2,2,3);
plot(nu_num,G_H_num);
title("Module du gain complexe du filtre numérique issu d'un filtre analogique")
xlabel("Fréquences en hertz")
ylabel("dB")
subplot(2,2,4);
plot(nu_num,ang_H_num)
title("Phase du gain complexe du filtre numérique issu d'un filtre analogique")
xlabel("Fréquences en hertz")
ylabel("Phase")

%filtrage

s_RII = filter(B_n,A_n,s);
soundsc(s_RII) %meme prob que precedemment mais mieux 
sgram(s_RII,nue,70,13)%Meilleur filtrage

%optimisation 



