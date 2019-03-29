% Part3 expo fitler n =0
clc

data = z;                                       % Create Data
alpha = 0.9677;
sigma = 0.224;
A = 110.3;
ndfcn = @(alpha,x) A.*alpha.*exp((-alpha).*(x));    % Standard Normal Distribution


[hc,edges] = histcounts(data, 5);                                  % Histogram
ctrs = edges(1:length(edges)-1) + mean(diff(edges))/2;              % Calculate Centres
ctrsx = linspace(min(ctrs), max(ctrs));                             % High-Resolution Vector
ednd = ndfcn(alpha,ctrsx);
ednd2 = ndfcn(alpha,ctrs) ;                                    % Calculate Standard Normal Distribution
figure(1)
bar(ctrs, hc)                                                       % Plot Histogram
errorpdnd = sqrt(hc);

hold on
errorbar(ctrs,hc,errorpdnd,'o')
plot(ctrsx, ednd, '-g', 'LineWidth',0.02);           % Plot Scaled Standard Normal Distribution

hold off


 echi2e= ((hc-ednd2)./errorpdnd).^2;
 chi2e=sum(echi2e)

