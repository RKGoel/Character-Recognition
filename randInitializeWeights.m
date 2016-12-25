<<<<<<< HEAD
function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections
%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) randomly initializes the weights 
%   of a layer with L_in incoming connections and L_out outgoing 
%   connections. 
%
%   Note that W is set to a matrix of size(L_out, 1 + L_in) as
%   the column row of W handles the "bias" terms
% 
W = zeros(L_out, 1 + L_in);

% Initialize W randomly so that we break the symmetry while training the neural network.
%
% Note: The first row of W corresponds to the parameters for the bias units

% init_epsilon is calculated by formula init_epsilon = sqroot(6)/sqroot(input_units + output_units)
% In this case init_epsilon = sqroot(6)/sqroot(400+26)
% rand(L_out,1+L_in) returns matrix of size L_out x (1+L_in) with values between 0 & 1

init_epsilon=0.048736; % Any small random value
W=rand(L_out,1+L_in)*2*init_epsilon-init_epsilon;

end
=======
function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections
%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) randomly initializes the weights 
%   of a layer with L_in incoming connections and L_out outgoing 
%   connections. 
%
%   Note that W is set to a matrix of size(L_out, 1 + L_in) as
%   the column row of W handles the "bias" terms
% 
W = zeros(L_out, 1 + L_in);

% Initialize W randomly so that we break the symmetry while training the neural network.
%
% Note: The first row of W corresponds to the parameters for the bias units

% init_epsilon is calculated by formula init_epsilon = sqroot(6)/sqroot(input_units + output_units)
% In this case init_epsilon = sqroot(6)/sqroot(400+26)
% rand(L_out,1+L_in) returns matrix of size L_out x (1+L_in) with values between 0 & 1

init_epsilon=0.048736; % Any small random value
W=rand(L_out,1+L_in)*2*init_epsilon-init_epsilon;

end
>>>>>>> origin/master
