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
t1 = theta(1,:);
sigmoidX = sigmoid(X*theta);
J=((1/size(X,1))* ...
    sum(-y.*log(sigmoidX)-((ones(size(y,1),1)-y).* log(1-sigmoidX)))) ...
    + (sum(theta(2:size(theta,1)).*theta(2:size(theta,1))) *0.5* (lambda./size(X,1)));


%grad = (1/size(X,1)) * ...
%    sum((sigmoidX - y) .* X);

grad = (1/size(X,1)) * ...
    X' * (sigmoidX - y);
m=size(X,1);
temp = ((lambda.*theta)./m);
temp(1) = 0;
grad = grad+ temp;

 



% =============================================================

end
