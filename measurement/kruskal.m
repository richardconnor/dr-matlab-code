function stress = kruskal(deltas,zetas)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

disparities = lsqisotonic(deltas,zetas);
[dum,ord] = sortrows([disparities(:) deltas(:)]);

k1 = (disparities - zetas);
k1 = sum(k1 .* k1);
k2 = sum(zetas .* zetas);
stress = sqrt(k1 / k2);
end
