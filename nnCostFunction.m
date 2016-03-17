function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
								   
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices.
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));
%fprintf("Size of Theta1: ");
%fprintf('%d %d', size(Theta1, 1), size(Theta1,2));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));
%fprintf("Size of Theta2: ");
%fprintf('%d %d', size(Theta2, 1), size(Theta2,2));
				 
m = size(X, 1);
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ======== Part 1: Feedforwarding the neural network ==========

X=[ones(m,1),X]; % adding bias unit to input layer

a1=X; % value for input layer
%fprintf("Size of a1: ");
%fprintf('%d %d', size(a1, 1), size(a1,2));
z1=Theta1*a1';
a2=sigmoid(z1); % value for hidden layer

a2=a2';
a2=[ones(m,1),a2];
z2=Theta2*a2';
a3=sigmoid(z2); % value for output layer

hypothesis=a3;

% ========= Part 2: Calculating Cost ============

for i=1:num_labels
k = eye(num_labels)(y,:); % returns yth row of identity matrix of dimension num_labels*num_labels
var1=(-1)*(k'(i,:)*(log(hypothesis(i,:)))');
var2=((1-k)'(i,:)*(log(1-hypothesis(i,:)))');
J+=(var1-var2)/m;
end

% Computing Cost using Regularisation
Theta1(:,1)=0; % exclude bias unit
Theta2(:,1)=0; % exclude bias unit
var3=sum(Theta1(:).^2);
var4=sum(Theta2(:).^2);
J=J+(lambda/(2*m))*(var3+var4);

% ======= Part 3: Backpropagation Algorithm =========

delta3=a3-k';
Theta2(:,1)=[];
%Theta1(:,1)=[];
delta2=((Theta2)'*delta3).*sigmoidGradient(z1);
Delta2=zeros(num_labels,hidden_layer_size+1);
Delta1=zeros(hidden_layer_size,input_layer_size+1);
Delta2=Delta2+(delta3*(a2));
Delta1=Delta1+delta2*(a1);
Theta1_grad=(1/m).*Delta1+(lambda/m).*Theta1;
Theta2=[zeros(num_labels,1),Theta2];
Theta2_grad=(1/m).*Delta2+(lambda/m).*Theta2;

% =====================================================

% Unrolling Gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end