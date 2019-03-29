% Part3 expo fitler n=1


clc

data = f;                                       % Create Data
alpha = 0.7877;
sigma = 0.1674;
A = 154.4;
ndfcn = @(alpha,x) A.*alpha.^2.*x.*exp((-alpha).*(x));    % Standard Normal Distribution


[hc,edges] = histcounts(data, 5);                                  % Histogram
ctrs = edges(1:length(edges)-1) + mean(diff(edges))/2;              % Calculate Centres
ctrsx = linspace(min(ctrs), max(ctrs));                             % High-Resolution Vector
ednd = ndfcn(alpha,ctrsx);
ednd2 = ndfcn(alpha,ctrs);                                      % Calculate Standard Normal Distribution
figure(1)
bar(ctrs, hc)                                                       % Plot Histogram
errorpdnd = sqrt(hc);

hold on
errorbar(ctrs,hc,errorpdnd,'o')
plot(ctrsx, ednd, '-g', 'LineWidth',0.02);           % Plot Scaled Standard Normal Distribution

hold off


 echi2e= ((hc-ednd2)./errorpdnd).^2;
 chi2e=sum(echi2e)
