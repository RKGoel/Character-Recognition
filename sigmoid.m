<<<<<<< HEAD
function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   J = SIGMOID(z) computes the sigmoid of matrix z.

g = zeros(size(z));

temp = (1+ exp((-1).*z));
g = 1./temp;
end
=======
function g = sigmoid(z)
%SIGMOID Compute sigmoid function
%   J = SIGMOID(z) computes the sigmoid of matrix z.

g = zeros(size(z));

temp = (1+ exp((-1).*z));
g = 1./temp;
end
>>>>>>> origin/master
