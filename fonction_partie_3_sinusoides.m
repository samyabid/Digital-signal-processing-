function [S,k] = fonction_partie_3_sinusoides (f0,N)
  k = 0:34;
  s = cos ( 2 * pi * f0 * k );
  
  
  figure (1)
  stem(k,s)
  title("sequence generee")
  xlabel("indices k")
  
  
  S = fft(s,N);
  f_reduite = linspace(0,1,N);
  # l’affichage des parties réelle, imaginaire, module et phase de la TFD graduées en fréquence réduite
  
  figure(2)
  subplot(2,2,1)
  stem(f_reduite,real(S))
  xlabel("frequence reduite")
  title("partie reelle")
  
  subplot(2,2,2)
  stem(f_reduite,imag(S))
  title("partie imaginaire")
  xlabel("frequence reduite")
  
  subplot(2,2,3)
  stem(f_reduite,S)
  xlabel("frequence reduite")
  title("module")
  
  subplot(2,2,4)
  stem(f_reduite,angle(S))
  xlabel("frequence reduite")
  title("phase")
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  