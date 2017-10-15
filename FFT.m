clc; close all; clear all;
j = sqrt(-1);
fc = 20; %frequency
sample = 1e3;   % Double F (Nyquist's Theorem) (Hz)
Ts = 1./sample; % time step size (sec)
t = 0:Ts:1; % create time vector from 0 to 1 seconds with step size of Ts
x = sin(2.*pi.*fc.*t); %equation of the sinusoid
y = square(t);
nfft = 2048; %power of 2

f = sample.*(0:nfft/2) ./ nfft; %frequency vector R: 0 - sample/2
% performs FFT, adjusts length
Y = fft(y,nfft) ./ nfft
Y = Y(1:(nfft/2+1))
X = fft(x,nfft) ./ nfft
X = X(1:(nfft/2+1)) 
% plot the time domain and frequency domain of each
figure();
subplot(221); plot(t,x); grid on;
xlabel('Time (s)'); ylabel('Amplitude');

subplot(222); plot(f,abs(X)); grid on;
xlabel('Frequency (Hz)'); ylabel('Magnitude');

subplot(223); plot(t,y); grid on;
xlabel('Time (s)'); ylabel('Amplitude');

subplot(224); plot(f,abs(Y)); grid on;
xlabel('Frequency (Hz)'); ylabel('Magnitude');