function [mu_e, cov_e] = gaussian2d(X)
mu_e = sum(X)/length(X);
cov_e = cov(X);
end