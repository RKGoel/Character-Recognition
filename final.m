%load test_set.dat;
%load thetas.dat;

pred = predict(Theta1, Theta2, x_test);
fprintf('\nTraining Set Accuracy: %f\n\n', mean(double(pred == y_test)) * 100);

rp = randperm(1800);

for i = 1:20
    % Display 
    fprintf('\nDisplaying Example Image\n');
    displayData(x_test(rp(i), :));

    pred = predict(Theta1, Theta2, x_test(rp(i),:));
    fprintf('\nNeural Network Prediction: %d (character %c)\n', pred, mod(pred, 27)+64);
    
    % Pause
    fprintf('Program paused. Press enter to continue.\n');
    pause;
end