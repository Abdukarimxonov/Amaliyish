n = [1.0 1.10 0.100];
d = [1 3.000 3.160 1.200];
f = tf(n, d);
z = zero(f);
p = pole(f);
k = dcgain(f);
b = bandwidth(f);
f_ss = ss(f);
f_ss.d = 1;   
k1 = dcgain(f_ss);
f_zp = zpk(f);
who
whos
figure;
pzmap(f)
grid on
title('Nol va qutblarning joylashuvi');
[wc, ksi, p_damp] = damp(f);
ltiview;
figure;
step(f)
title('O‘tkinchi xarakteristika');

w = logspace(-1, 2, 100);
r = freqresp(f, w);
r = r(:);
figure;
semilogx(w, abs(r))
grid on
xlabel('Chastota (rad/s)')
ylabel('Amplitude')
title('Chastotaviy xarakteristika')

[u, t] = gensig('square', 4, 20, 0.01);  % Kvadrat signal: 4s period, 5 ta impuls
figure;
lsim(f, u, t)
title('Kvadrat impulsga javob')
xlabel('Vaqt (s)')
ylabel('Chiqish signali')