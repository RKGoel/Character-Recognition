function [Theta1, Theta2] = train(initial_nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda, no_of_iterations)

% This function trains the neural networks
% and returns trained nn parameters Theta1 and Theta2

%  Change the MaxIter to a larger value to see how more training helps.
options = optimset('MaxIter', no_of_iterations);

% Create "short hand" for the cost function to be minimized
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);

% Now, costFunction is a function that takes in only one argument (the
% neural network parameters)
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
				 
end;