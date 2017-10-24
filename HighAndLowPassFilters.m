clc; close all; clear all;
j = sqrt(-1);

Fs = 1000; % Sampling rate (Hz)
Ts = 1/Fs; % Time spacing between samples
duration = 900; % Number of points in our time domain signal
nfft = 1024; % Make sure this is greater than duration
t = (0:(duration-1)).*Ts; % Create a time vector of length duration and spacing of Ts
f = (0:(nfft/2-1)).*Fs./nfft; % Frequency Vector

%Generates noise as input signal
noise = randn(1,duration); %n(t)
noise = noise ./ max(noise); %Amplitude scaling
NOISE = fft(noise,nfft);

%Plots
subplot(521);
plot(t,noise); grid on;
title('Noise Time Domain');
ylabel('Amplitude'); xlabel('Time (sec)');
subplot(522);
plot(f,abs(NOISE(1:nfft/2))); grid on;
title('Noise Frequency Domain');
ylabel('Magnitude'); xlabel('Frequency (Hz)');

% Creates a Low Pass Filter
filter_order = 10;% The order of a filter is how complex it is
% Where you want the lowpass filter to start rolling off
cutoff_freq = 250; % Hz (must be less than Fs/2)
% Matlab's fir1() function wants the cutoff between 0 and 1, 1 being your sampling rate.
cutoff = cutoff_freq / (Fs/2); 
% Creates an FIR filter (digital filter) of a certain order and cutoff
lpf = fir1(filter_order,cutoff);
% Find the filter's frequency response
LPF = fft(lpf,nfft);

% Apply the LPF to the signal
% Time domain: the signal and LPF impulse response are convolved
% Freq domain: the signal FFT and LPF freq responses are multiplied
% Matlab has a built-in filter() function that convolves two signals and
% returns the result that is the same length as them
% Alternatively, you could do: 
% z = conv(lpf,noise)
% but you have to make sure you trim the result's length
l = filter(lpf,1,noise);
L = fft(l,nfft);

%Plots
subplot(523);
stem(lpf); grid on;
title('Low Pass Filter Impulse Response');
ylabel('Amplitude'); xlabel('Samples');
subplot(524);
plot(f,abs(LPF(1:nfft/2))); grid on;
title('Low Pass Filter Frequency Resonse');
ylabel('Magnitude'); xlabel('Frequency (Hz)');
subplot(525);
plot(t,l); grid on;
title('Filtered Signal Time Domain');
ylabel('Amplitude'); xlabel('Time (sec)');
subplot(526);
plot(f,abs(L(1:nfft/2))); grid on;
title('Filtered Signal Frequency Domain');
ylabel('Magnitude'); xlabel('Frequency (Hz)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Where you want the lowpass filter to start rolling off
cutoff_freq = 450; % Hz (must be less than Fs/2)
% Matlab's fir1() function wants the cutoff between 0 and 1, 1 being your sampling rate.
cutoff = cutoff_freq / (Fs/2); 
% Creates an FIR filter (digital filter) of a certain order and cutoff
hpf = fir1(filter_order,cutoff,'high');
% Find the filter's frequency response
HPF = fft(hpf,nfft);

h = filter(hpf,1,noise);
H = fft(h,nfft);

%plots
subplot(527);
stem(hpf); grid on;
title('High Pass Filter Impulse Response');
ylabel('Amplitude'); xlabel('Samples');
subplot(528);
plot(f,abs(HPF(1:nfft/2))); grid on;
title('High Pass Filter Frequency Resonse');
ylabel('Magnitude'); xlabel('Frequency (Hz)');
subplot(529);
plot(t,h); grid on;
title('Filtered Signal Time Domain');
ylabel('Amplitude'); xlabel('Time (sec)');
subplot(5,2,10);
plot(f,abs(H(1:nfft/2))); grid on;
title('Filtered Signal Frequency Domain');
ylabel('Magnitude'); xlabel('Frequency (Hz)');
