function stress1 = shepard(trueDists,redDists,plotTitle)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


%disp is the isotonic regression mapping from pcaDists to trueDists
disparities = lsqisotonic(trueDists,redDists);
[dum,ord] = sortrows([disparities(:) trueDists(:)]);

% calculate Kruskal stress
k1 = (disparities - redDists);
k1 = sum(k1 .* k1);
k2 = sum(redDists .* redDists);
stress1 = sqrt(k1 / k2);

% make the Shepard plot
figure;
hold on;
xlim([ min(redDists), max(redDists)]);
plot(redDists,trueDists,'o');
plot(disparities(ord),trueDists(ord),'-k','LineWidth',3);
plot(linspace(0,max(trueDists),1000),linspace(0,max(trueDists),1000),'--k','LineWidth',3);

legend("individual measurements","isotonic regression","y=x","FontSize",14,"Location","southeast");
title(strcat( plotTitle," ( ", "S_K = ",num2str(stress1,2)," )"),"FontSize",18);
ylabel("\delta_{ij}","FontSize",18);
xlabel("\zeta_{ij}","FontSize",18);

hold off;


end

