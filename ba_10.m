% Part2 ba133 10s

clc


data = ba133_10s;                                       % Create Data
lambda = mean(data);
mu = mean(data);
sd = std(data);
ndfcn = @(mu,sd,x) exp(-(x-mu).^2 ./ (2*sd^2)) /(sd*sqrt(2*pi));    % Standard Normal Distribution
pdfcn = @(lambda,x) poisspdf(lambda,x);
[hc,edges] = histcounts(data,11);                                  % Histogram
ctrs = edges(1:length(edges)-1) + mean(diff(edges))/2;              % Calculate Centres
ctrsx = linspace(min(ctrs), max(ctrs));                             % High-Resolution Vector
pdnd = pdfcn(lambda,ctrsx);
sdnd = ndfcn(mu,sd,ctrsx);
sdnd2 = ndfcn(mu,sd,ctrs);
figure(1)
bar(ctrs, hc)                                                       % Plot Histogram
errorpdnd = sqrt(hc);
a = histfit(data,11,'poisson');

hold on
errorbar(ctrs,hc,errorpdnd,'o')
plot(ctrsx, sdnd*max(hc)/max(sdnd), '-g', 'LineWidth',0.02);           % Plot Scaled Standard Normal Distribution

hold off
 

echi2ba10p= ((hc-ba10p)./errorpdnd).^2;
echi2ba10n= ((hc-ba10n)./errorpdnd).^2;
chi2ba10n=sum(echi2ba10n)
chi2ba10p=sum(echi2ba10p)

