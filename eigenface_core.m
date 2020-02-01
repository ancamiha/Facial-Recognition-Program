function [m A eigenfaces pr_img] = eigenface_core(database_path)
  for j = 1:10    
    s = sprintf("%s/%d%s",database_path,j,".jpg");
    %pentru fiecare j citesc matricea imaginii
    matrix = double(rgb2gray(imread(s)));
    
    %transform matricea in vector si o adaug in matricea T
    T(:,j) = matrix(:);
  endfor   
  
    %calculez media aritmetica pentru fiecare linie
    linii = size(T, 1);
    coloane = size(T, 2);
    for i = 1:linii
      m(i) = (sum(T(i,1:coloane)))/coloane;
    endfor
    
    A = T - (m');
    [V lambda] = eig(A' * A);
    %elimin elementele mai mici ca 1
    for i=1:size(lambda,1)
      if lambda(i,i) < 1
        V(:,i) = [];
      endif
    endfor
   
    eigenfaces = A * V;
    pr_img = (eigenfaces') * A;
end