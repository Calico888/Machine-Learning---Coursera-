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

t1 = -y' *log(sigmoid(X*theta));
t2 = (1-y')*log(1 - sigmoid(X*theta));

theta_woo= theta;
theta_woo(1) = 0;
r = (lambda/(2*m))*sum(theta_woo.^2);

J = sum((t1 - t2)/m + r);

grad = (X' * (sigmoid(X * theta) - y)) * (1/m) + theta_woo * (lambda / m);

% =============================================================

end
