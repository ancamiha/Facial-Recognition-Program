function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %citesc matricea imaginii
  A = double(rgb2gray(imread(image_path)));
  
  %transform matricea in vector
  V_im = A(:);
  V = V_im - m';
  
  %calculez proiectia imaginii
  pr_test_img = (eigenfaces') * V;
  
  %determin distanta minima
  min = norm(pr_test_img - pr_img(:,1));
  for j = 2:10
    dist = norm(pr_test_img - pr_img(:,j));
    if(dist < min)
      min = dist;
      output_img_index = j;
    endif
  endfor
  min_dist = min;
end