% Minor Project
% Character Recognition Software using Neural Networks
% Submitted By:
% Rajat Kant Goel
% Vibhu Varshney 
% B.Tech. Computer Engg.
% Session 2014-15


% Parameters for Neural Networks
input_layer_size = 2500; % 20x20 input images of characters
hidden_layer_size = 100; % 50 hidden units
num_labels = 26; % 26 English alphabets

no_of_iterations = 5;
% ================== Part 1: Loading and Visualizing the data =====================
% In this part of software we load training dataset from file

% Load Training Data
fprintf('Loading the Data ...\n')

%load("-ascii", 'training_set.dat'); % Loads variables X for character images and y for character label
%load("-ascii", 'test_set.dat');
%X = double(X);
%x_test = double(x_test);

%load training_set.dat; % Loads variables X for character images and y for character label
%load test_set.dat;
m = size(X, 1); % m is number of training data

% Randomly select 100 data points to display
sel = randperm(size(x_test, 1));
sel = sel(1:100);

displayData(x_test(sel, :));

fprintf('Program paused. Press enter to continue')
pause;

%hidden_layer_size = 1010;
%max_hid = hidden_layer_size;
no_of_iterations = 50;
max_it = no_of_iterations;
max_acc = 0;
while(no_of_iterations<=50)
% ================== Part 2: Initializing Parameters ===================
% In this part of software we initialize neural network weights
% A function randInitializeWeights() is used with parameters as number of inputs and number of outputs for a layer.

%fprintf('\nInitializing Neural Network Parameters ...\n')

initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%fprintf('NN Parameters initialized. Press enter to continue')
%pause;


% =================== Part 3: Training Neural Network ==============================
% In this part of software we compute cost by feedforwarding neural network
% with regularization and then executing backpropagation algorithm to
% compute gradients of NN parameters Theta1 and Theta2. Then we update neural network
% parameters by using optimization function fmincg. This process is continued until
% some specified iterations

% nnCostfunction computes cost by feedforwarding NN and returns gradients of parameters
% through backpropagation algorithm

%fprintf('\nTraining Neural Network... \n')

%  Try different values of lambda
lambda = 1;

% Returning trained parameters from 'train' function
% Theta1 = hidden_layer_size x (input_layer_size+1)
% Theta2 = num_labels x (hidden_layer_size+1)
[Theta1, Theta2] = train(initial_nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda, no_of_iterations);

%fprintf('Program paused. Press enter to continue.\n');
%pause;

% ================= Part 4: Predicting Character ====================
% In this part of software prediction is done through trained neural network
% by feeding it with test data. it also predicts the training set accuracy.

pred = predict(Theta1, Theta2, x_test);

%fprintf('\nHidden Units: %f', hidden_layer_size);
fprintf('\nNo. of iterations: %f', no_of_iterations);
fprintf('\nTraining Set Accuracy: %f\n\n', mean(double(pred == y_test)) * 100);

if(max_acc<mean(double(pred == y_test)) * 100)
max_acc = mean(double(pred == y_test)) * 100;
max_it = no_of_iterations;
endif

% ====================================================================

%end;

%hidden_layer_size = hidden_layer_size + 10;
no_of_iterations = no_of_iterations + 50;
endwhile

%fprintf('\nOptimum Hidden Units: %f', max_hid);
fprintf('\nOptimum No. of iterations: %f', max_it);
fprintf('\nOptimum Accuracy: %f', max_acc);