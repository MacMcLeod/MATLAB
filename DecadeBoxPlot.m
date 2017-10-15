%These are voltage values across two legs of a wheatstone bridge, based off
%variable resistances (decade box)
Box = [10.0:-0.1:0.1];
Voltage = [1.6 1.134 1.129 1.126 1.119 1.113 1.108 1.102 1.096 1.091 1.086 1.08 1.075 1.069 1.062 1.056 1.05 1.044 1.037 1.031 1.025 1.018 1.016 1.007 0.999 0.992 0.985 0.978 0.97 0.963 0.956 0.948 0.941 0.932 0.924 0.917 0.908 0.9 0.893 0.885 0.876 0.864 0.857 0.846 0.836 0.827 0.817 0.808 0.797 0.788 0.777 0.767 0.758 0.747 0.736 0.725 0.721 0.709 0.696 0.683 0.672 0.662 0.648 0.64 0.628 0.616 0.603 0.587 0.573 0.556 0.541 0.526 0.533 0.498 0.483 0.467 0.45 0.434 0.417 0.399 0.382 0.364 0.327 0.308 0.288 0.268 0.247 0.226 0.204 0.182 0.159 0.135 0.111 0.086 0.044 0.016 0.0011 0.038 0.067 0.096];
plot (Box, Voltage)
title('Voltage vs. Resistance')
xlabel('Decade Box Resistance (k\Omega)') % x-axis label
ylabel('Voltage (V)')