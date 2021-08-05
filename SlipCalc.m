clc;
clear;
%Angle of contact b/n wheel and sphere
angle  = 1:90;

%Weights in Lbs
mWheel = 0.161;
mSphere = 1:10;

%Radius of wheel (m)
Rw=0.03;

%Coefficient of friction between rubber and acryllic. Found on http://atc.sjf.stuba.sk/files/mechanika_vms_ADAMS/Contact_Table.pdf
Mu = 0.8;

%Angular Acceleration (rad/s^2)
A=pi/4;

%Change the weights to better units
mWheel = mWheel * 0.453592;
mSphere = mSphere .* 0.453592;

%Convert angles to radians
angle = deg2rad(angle);

%Normal Force Matrix, Reference by Fn(angle in deg, Weight in Lbs)
Fn = zeros(length(angle),length(mSphere));
%Loop through angles
for i = 1:length(angle)
    %Loop through sphere weights
    for j = 1:length(mSphere)
        Fn(i,j)=mSphere(j)*9.81*cos(pi/2-angle(i));
    end
end
%Graph Normal Force
%figure(1);
%plot(1:90,Fn(1:90,10));
%title('Normal Force');
%xlabel('Angle of omniwheel to sphere');
%ylabel('Normal force of sphere on omniwheel');

%Frictional Force
Ff=Fn.*Mu;

%Moment of Inertia of the wheel
I=.5*mWheel*Rw*Rw;

%Range of Torques calculated in TorqueCalc.m
Tmax=.175;
Tmin=.147;

Fmax=Tmax/Rw;
Fmin=Tmin/Rw;

%Graph Frictional Force
figure(1);
plot(1:90,Ff(1:90,1),1:90,Ff(1:90,2),1:90,Ff(1:90,3),1:90,Ff(1:90,4),1:90,Ff(1:90,5),1:90,Ff(1:90,6),1:90,Ff(1:90,7),1:90,Ff(1:90,8),1:90,Ff(1:90,9),1:90,Ff(1:90,10));
%plot(1:90,Ff(1:90,1),Ff(1:90,2),Ff(1:90,3),Ff(1:90,4),Ff(1:90,5),Ff(1:90,6),Ff(1:90,7),Ff(1:90,8),Ff(1:90,9),Ff(1:90,10));

refline(0,Fmax);
refline(0,Fmin);
title('Frictional Force > Torsional Force for No Slip');
xlabel('Angle of sphere to omniwheel (Deg)');
ylabel('Normal force of sphere on omniwheel (N)');
legend('Frictional Force 1Lbs','Frictional Force 2Lbs','Frictional Force 3Lbs','Frictional Force 4Lbs','Frictional Force 5Lbs','Frictional Force 6Lbs','Frictional Force 7Lbs','Frictional Force 8Lbs','Frictional Force 9Lbs','Frictional Force 10Lbs','Torsional Force');
%Slipping occurs when applied force > frictional force



