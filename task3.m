function [A_k S] = task3(image, k)
  %citesc matricea imaginii
  matrix = double(imread(image));
  m = size(matrix, 1);
  n = size(matrix, 2);
  
  medie = [];
  %calculez media aritmetica pentru fiecare linie
  for i = 1:m
    medie(i) = (sum(matrix(i,1:n)))/n;
  endfor
  %calculez eroarea si o introduc in matrice
  for i = 1:m
    for j = 1:n
      matrix(i,j) = matrix(i,j) - medie(i);
    endfor
  endfor
  %calculez SVD pentru Z
  Z = (matrix')* (1/sqrt(n-1));
  [U,S,V] = svd(Z); 
  %determin spatiul k-dimensional al componentelor principale
  W = V(:,1:k);
  %calculez proiectia lui matrix
  Y = (W') * matrix;
  %aproximez matricea initiala
  A_k = W * Y + medie';
endfunction