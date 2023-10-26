syms t tau;

% set heaviside at origin
oldparam = sympref('HeavisideAtOrigin',1);

% define function
f = exp(-t)*heaviside(t);
g = heaviside(t+2)-heaviside(t);

% plot f and g
fig=figure
ax=axes;
ez1=ezplot(f, [-5, 10])
hold on
ez2=ezplot(g, [-5, 10])
hold on

% convolution
f = subs(f, t, tau);
g = subs(g, t, t-tau);
fg = int(f*g, tau, -inf, inf);

ez3=ezplot(fg, [-5, 10])
ylim([0 1.5])
legend('f(t)','g(t)','f(t)*g(t)')
% set(ez1,'color',[1 0 0])
title(ax,['Plot of g(t),f(t), and f(t)*g(t)'])
