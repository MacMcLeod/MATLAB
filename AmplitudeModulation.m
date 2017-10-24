clc; close all; clear all;
j = sqrt(-1);
order = 10; %order of filter

%Creates time vector
Fs = 1000;
Ts = 1/Fs;
t = 0:Ts:1;
%Sets sampling rate and frequency vector
nfft = 1024;
f = (0:(nfft-1)/2).*Fs./nfft;

% Creates a carrier wave, c(t)
fc = 50;
om = 2.*pi.*fc;
c = sin(om.*t); %a sine wave at fc
C = fft(c,nfft)./nfft;
%Plots
subplot(421);
plot(t,c); grid on;
title('Carrier Wave - TD');
xlabel('Time (sec)'); ylabel('Amplitude');
subplot(422);
plot(f,abs(C(1:nfft/2))); grid on;
title('Carrier Wave - FD');
xlabel('Frequency (Hz)'); ylabel('Magnitude');

%Creates a message signal, m(t)
fm = 20;
m = sin(2.*pi.*fm.*t);
M = fft(m,nfft)./nfft;
%Plots
subplot(423);
plot(t,m); grid on;
title('Message - TD');
xlabel('Time (sec)'); ylabel('Amplitude');
subplot(424);
plot(f,abs(M(1:nfft/2))); grid on;
title('Message - FD');
xlabel('Frequency (Hz)'); ylabel('Magnitude');

%Performs amplitude modulation
alpha = 1; % Between (0,1]
am = (1 + alpha.*m) .* c;
AM = fft(am,nfft)./nfft ;% x(t) = (1+alpha*m(t))*c(t)
%Plots
subplot(425);
plot(t,am); grid on;
title('AM Wave - TD');
xlabel('Time (sec)'); ylabel('Amplitude');
subplot(426);
plot(f,abs(AM(1:nfft/2))); grid on;
title('AM Wave - FD');
xlabel('Frequency (Hz)'); ylabel('Magnitude');

%Adds bandpass filter for SSB
fcuts = [fc-25 fc-10];
mag = [1 0];
dev = [0.05 0.01];
[M,Wn,beta,typ] = kaiserord(fcuts,mag,dev,Fs);  % window parameters
ssb = fir1(M,Wn,typ,kaiser(M+1,beta),'noscale'); % filter design
SSB = fft(ssb,nfft);
%colvolve the signals
s = filter(ssb,1,am);
S = fft(s,nfft);

%Plots
subplot(427);
plot(t,s); grid on;
title('Filtered Signal Time Domain');
ylabel('Amplitude'); xlabel('Time (sec)');
subplot(428);
plot(f,abs(S(1:nfft/2))); grid on;
title('Filtered Signal Frequency Domain');
ylabel('Magnitude'); xlabel('Frequency (Hz)');