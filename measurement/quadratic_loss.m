function stress = quadratic_loss(deltas,zetas)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

f1 = deltas - zetas;
stress = sum(f1 .* f1);
end
