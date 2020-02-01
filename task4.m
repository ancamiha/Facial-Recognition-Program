function [A_k S] = task4(image, k)
  %citesc matricea imaginii
  matrix = double(imread(image));
  m = size(matrix, 1);
  n = size(matrix, 2);
  
  medie = [];
  %calculez media aritmetica pentru fiecare linie
  for i = 1:m
    medie(i) = (sum(matrix(i,1:n)))/n;
  endfor
  %calculez eroare si o introduc in matrice
  for i = 1:m
    for j = 1:n
      matrix(i,j) = matrix(i,j) - medie(i);
    endfor
  endfor
  Z = (matrix * matrix')/(n-1);
  [V S] = eig(Z);
  %determin spatiul k-dimensional al componentelor principale
  %tin cont ca functia "eig" intoarce valorile in ordine crescatoare
  W = V(:,(m - k + 1):m);
  %calculez proiectia lui matrix
  Y = (W') * matrix;
  %aproximez matricea initiala
  A_k = W * Y + medie';
endfunction