<<<<<<< HEAD
function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);

h1 = sigmoid([ones(m, 1) X] * Theta1'); % size of h1 is training_examples x hidden_units
h2 = sigmoid([ones(m, 1) h1] * Theta2'); % size of h2 is training_examples x output_units
[dummy, p] = max(h2, [], 2); % p is vector of training_examples x 1

% =========================================================================


=======
function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

m = size(X, 1);
num_labels = size(Theta2, 1);

p = zeros(size(X, 1), 1);

h1 = sigmoid([ones(m, 1) X] * Theta1'); % size of h1 is training_examples x hidden_units
h2 = sigmoid([ones(m, 1) h1] * Theta2'); % size of h2 is training_examples x output_units
[dummy, p] = max(h2, [], 2); % p is vector of training_examples x 1

% =========================================================================


>>>>>>> origin/master
end