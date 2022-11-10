

function res = jsd(A,B)
%these lines run about 20 times faster than the more understandable version
%below!
ha = h(A);
hb = h(B);
hc = h(A + B);
hacc = (hb - hc) + ha;
he = -sum(hacc,2,"omitnan") ./ log(4) + 1;
res = sqrt(max(0,he));
end

function D2 = oldJsd(ZI,ZJ)
D2 = zeros( size( ZJ,1 ), 1 );

for i = 1 : size(ZJ,1)
    D2(i) = jsd_single(ZI,ZJ(i,:));
end

end

function d = jsd_single(A,B)

E = zeros(1,length(A));
for j = 1 : length(A)
    if A(j) > 0 && B(j) > 0
        E(j) = h(A(j)) + h(B(j)) - h(A(j) + B(j));
    end
end
d = sqrt(1 - sum(E)/2);

end

function d = old_h(x)
d = -x * (log(x)/log(2));
end

function d = h(x)
d = -x .* log(x);
end
