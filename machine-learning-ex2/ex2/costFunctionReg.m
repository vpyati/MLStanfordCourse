function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

J1 = 0;

for i=1:m
	A = -1*y(i)*log(sigmoid(X(i,:)*theta));
	B = -1*(1 - y(i)) * log(1 - sigmoid(X(i,:)*theta));
	J1 = J1+A+B;
end;


J1 = J1/m;

J2 = 0;
for i=2:length(theta)
	J2 = J2 + theta(i)*theta(i);
end;
J2 = (J2 * lambda)/(2.0*m);

J = J2 + J1;


n = size(grad);
for j=1:n
	for i = 1:m
		P = sigmoid(X(i,:)*theta);
		grad(j) = grad(j) + ((P - y(i)) * X(i,j));
	end;
	grad(j) = grad(j)/m;
end;

for j = 2:n
	grad(j) = grad(j) + (lambda/m)*theta(j);
end;

% =============================================================

end
