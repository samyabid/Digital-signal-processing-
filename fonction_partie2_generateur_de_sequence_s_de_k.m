function [S,k_S] = generateur_de_sequence_s_de_k (M)
  k = 0:M;
  s = (0.91).^(k);
  figure(1)
  stem(k,s);
  title("sequence S")
  xlabel("indices k")
  
  # on va calculer la TFD 2048 points
  S = fft(s,2048);
  #S1 = S_(1:2048/2);
  #S2 = S_(2048/2+1:2048);
  #S = [S2,S1];
  k_S = linspace(0,1,2048);
  
  
  