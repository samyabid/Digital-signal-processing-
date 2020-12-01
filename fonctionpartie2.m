function [x,h,y_c] = fonctionpartie2 (num_figure,N)
  k_x = linspace (0,10,11);
  k_h = linspace (0,11,12);
  x_k = 6 - abs(k_x-5) ;
  h_k = abs(k_h-8) - 1 & [0,0,0,0,0,1,1,1,1,1,1,1] ;
  
  #figure(num_figure)
  #subplot(2,1,1)
  #stem(k_x,x_k,"b")
  #subplot(2,1,2)
  #stem(k_h,h_k,"g")
  
  X = fft(x_k,N);
  H = fft(h_k,N);
  Y = X .* H;
  y_c = ifft (Y);
  
  figure(num_figure)
  subplot(3,1,1)
  stem(k_x,x_k)
  title("x(k)")
  xlabel("k")
  subplot(3,1,2)
  stem(k_h,h_k)
  title("h(k)")
  xlabel("k")
  subplot(3,1,3)
  stem(y_c)
  title("yc")
  xlabel("k")
  
  end
  