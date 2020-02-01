function A_k = task1(image, k)
  %citesc matricea imaginii
  matrix = double(imread(image));
  m = size(matrix, 1);
  n = size(matrix, 2);
  %aplic SVD determinand U, S si D
  [Ui,Si,Vi] = svd(matrix, 0);
  %eliminarea portiunilor din cele 3 matrici
    U = Ui(:,1:k);
    S = Si(1:k,1:k);
    V = Vi(:,1:k);
  %constructia matricei A_k
  A_k = U * S * V';
endfunction