clc;
clear
%Weight of objects in pounds
	m2=0.317;
	m3=0.161;
	m5=10.0;

%Lengths in inches
	L2=14.25;
	L3=1.008;
	L4=23/16;

%Diameters in inches
	D2=5/16;
	D3=2.362;
	D4=5/16;
	D5=[5.0 5.5 6.0 6.5 7.0 7.5 8.0 8.5 9.0 9.5 10 10.5 11.0 11.5 12];

%Coeff of Static Friction
	Mu24=.8;

%Wanted Angular Acceleration
	a=pi/4;

%Constants
	g=9.81;

%Convert everything to the better units
	%lbs to kgs
	m2=m2*0.453592;
	m3=m3*0.453592;
	m5=m5*0.453592;

	%in to m
	L2=L2*0.0245;
	L3=L3*0.0245;
	L4=L4*0.0245;

	D2=D2*0.0245;
	D3=D3*0.0245;
	D4=D4*0.0245;
	D5=D5.*0.0245;

for n=1:length(D5)
    
%Weight on Shaft
	m235=m2+m3+m5;

%Normal Force of shaft on bearings assuming sphere is directly above system
	Fn=m235*g;

%Force from the motor >= Force to overcome
	Fm=Fn*Mu24;

%Torque1 (T1) is the minumum torque required to rotate the shaft, uses Torque = Force x Radius
	T1=Fm*D2/2;

%Moment of Inertias for everything that must be moved. Icyl = .5mR^2, Isph = (2/5)mR^2
	I2=.5*m2*(D2/2)*(D2/2);
	I3=.5*m3*(D3/2)*(D3/2);
	I5=(2/5)*m5*(D5(n)/2)*(D5(n)/2);
	Itotal = I2 + I3 + I5;

%Torque2 (T2) is the torque required to get the required angular acceleration assuming no friction, uses Torque = Moment of Inertia x Angular Acceleration
	T2=Itotal*a;

%The total torque required to get the angular acceration needed
	T(n)=(T1+T2);
end
f = figure(1);
plot(D5./0.0245,T*1000);
title('Sphere Diameter vs. Motor Torque (Stall Torque: 355mNm)');
xlabel('Sphere Diameter (in)');
ylabel('Torque Required (mNm)');
xlim([5 12]);