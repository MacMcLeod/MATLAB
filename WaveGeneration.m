%create a sine wave
t = 0:.1:10;
y = sin(t);
subplot(2,2,1)
plot(t,y);
title('A sine wave')
y = zeros(10,length(t));
for k = 1:2:19
   y = y + sin(k*t)/k;
end
subplot(2,2,2)
plot(t,y);
%contains all odd harmonics
title('A square wave to the 19th harmonic')
y = zeros(10,length(t));
for k = 1:2:19
   y = y + sin(k*t)/(k*k);
end
subplot(2,2,3)
plot(t,y);
%contains all odd harmonics, with 4n-1 harmonics negated, 
title('A triangular wave to the 19th harmonic')
y = zeros(10,length(t));
for k = 1:1:20
   y = y + sin(k*t)/k;
end
subplot(2,2,4)
plot(t,y);
%contains all integer harmonics
title('A sawtooth wave to the 20th harmonic')