%after manually creating waves to discover how they are built, I learned
%MATLAB has built in functions.
t = 0:.1:10;
w = sin(t);
x = square(t);
y = sawtooth(t);
%this generates a triangular wave
z = sawtooth(t, 0.5);


%After playing around with waveform manipulation, I found some interesting
%looking waveforms.
subplot(2,2,1);
plot(t,w+x);
%This displays a sine wave with an offset of a square wave
subplot(2,2,2);
plot(t,w-x);
%The value of the sine wave is subtracted from the horizontal sections of
%the square wave.
%The sine wave cannot alter the vertical portions of the square wave
subplot(2,2,3);
plot(t,x-y);
%The sawtooth wave is subtracted from the square wave, but has an opposite
%sine, therefore it adds to the amplitude
subplot(2,2,4);
plot(t,x-z);
%The triangular wave is subtracted from the square wave. The triangular
%wave sign change is offset from that of the square wave, which is how a
%zero amplitude is achieved.
