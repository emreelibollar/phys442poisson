% Part2 cs137 1s
clc

data = cs137_1s;                                       % Create Data
lambda = mean(data);
mu = mean(data);
sd = std(data);
ndfcn = @(mu,sd,x) exp(-(x-mu).^2 ./ (2*sd^2)) /(sd*sqrt(2*pi));    % Standard Normal Distribution
pdfcn = @(lambda,x) poisspdf(lambda,x);
[hc,edges] = histcounts(data,8);                                  % Histogram
ctrs = edges(1:length(edges)-1) + mean(diff(edges))/2;              % Calculate Centres
ctrsx = linspace(min(ctrs), max(ctrs));                             % High-Resolution Vector
pdnd = pdfcn(lambda,ctrsx);
sdnd = ndfcn(mu,sd,ctrsx);
sdnd2 = ndfcn(mu,sd,ctrs);
figure(1)
bar(ctrs, hc)                                                       % Plot Histogram
errorpdnd = sqrt(hc);
a = histfit(data,8,'poisson');

hold on
errorbar(ctrs,hc,errorpdnd,'o')
plot(ctrsx, sdnd*max(hc)/max(sdnd), '-g', 'LineWidth',0.02);           % Plot Scaled Standard Normal Distribution

hold off
 echi2cs1p= ((hc-cs1p)./errorpdnd).^2;
 echi2cs1n= ((hc-cs1n)./errorpdnd).^2;
 chi2cs1n=sum(echi2cs1n)
 chi2cs1p=sum(echi2cs1p)

