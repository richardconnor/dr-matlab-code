function stress = sammon(deltas,zetas)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


f1 = sum( deltas );
f2 = deltas - zetas;
f3 = f2 .* f2;
f4 = f3 ./ deltas;

stress = (1 / f1) .* sum(f4);
end
