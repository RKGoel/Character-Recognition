%load thetas.dat;
%load test_set.dat;

%rp = randperm(1800);

%displayData(x_test(rp(20), :));
%localtime(time())
path="C:/Users/user/Desktop/test";
img_path=strcat(path,".jpg");
[img, map, alpha] = imread (img_path);
img=img(:)';
%img= (double)img;
i2 = im2double(img);
displayData(i2);
pred = predict(Theta1, Theta2, i2);
    fprintf('\nNeural Network Prediction: %d (character %c)\n', pred, mod(pred, 27)+64);
%localtime(time())