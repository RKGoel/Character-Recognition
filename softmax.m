function g = softmax(z)

% Activation Function

g = zeros(size(z));

for i=1:size(z,1);
temp(i,:) = exp(z(i,:))/sum(exp(z(i,:)));
end;

%fprintf("Size of softmax matrix: ");
%fprintf('%d %d', size(temp, 1), size(temp,2));
g = temp;