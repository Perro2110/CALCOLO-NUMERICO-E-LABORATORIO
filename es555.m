clc
clear all
a=0.2
b=5
n=3
f=@(x) (pi-log(3*x)+sin(2*x))
z(4)=(b-a)/2 * cos(1/8 * pi) + (b+a)/2
z(3)=(b-a)/2 * cos(3/8 * pi) + (b+a)/2
z(2)=(b-a)/2 * cos(5/8 * pi) + (b+a)/2
z(1)=(b-a)/2 * cos(7/8 * pi) + (b+a)/2

f(5)
