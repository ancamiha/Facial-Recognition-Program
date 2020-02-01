function [err] = task2(image)
   %citesc matricea imaginii
   A = double(imread(image));
   m = size(A, 1);
   n = size(A, 2);
   k = min(m,n);
   %1. reprezentarea grafica a tuturor val. singulare
   %aplic SVD
   values = svd(A);
   subplot(2,2,1)
   plot(values)
   
   %2. reprezentare k si informatie
   %aplic SVD
   [U S V] = svd(A);
   sum1 = 0;
   sum2 = 0;
   info = [];
   %calculez numitorul
   for i=1:min(m,n)
     sum1 = sum1 + S(i,i);
   endfor
   %calculez numaratorul
   for i=1:k
    sum2 = sum2 + S(i,i);
    %pentru fiecare numitor nou adaug rezultatul impartirii in info
    info(i) = sum2/sum1;
   endfor 
   subplot(2,2,2)
   plot(1:k,info)
   
   %3. reprezentare k si eroarea aproximarii
   err = [];
   num = 0;
   for i=1:k
    A_k = task1(image, i);
    suma = (A - A_k).^2;
    num = sum(sum(suma));
    err(i) = num/(m*n);
   endfor
   subplot(2,2,3)
   plot(1:k,err)
   
   %4. reprezentare k si rata de compresie
   for i=1:k
     r_c(i) = (m*i + n*i + i)/(m*n);
   endfor
   subplot(2,2,4)
   plot(1:k, r_c)
end