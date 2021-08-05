%Define Sphere and omniwheels@ origin
radius1 = 2.5;
radius2 = 1;
[x,y,z] = sphere(50);
[X,Y,Z] = cylinder(radius2);
HoleX = [];
HoleY = [];
HoleZ = [];
%--------------------------------------------
%Define figure with its limits and sphere
f = figure;
hold on;
s=surf(radius1*x,radius1*y,radius1*z);%, 'edgecolor','none');


xlim([-6 6])
ylim([-6 6])
zlim([-6 6])
%--------------------------------------------
%Choice of axis of rotation, starts with rot around y-axis
dx = [1 0 0];
dy = [0 1 0];
dz = [0 0 1];
dir = dy;
%--------------------------------------------
%Define rotation parameters
rotPrecision = 1;
rotAmount = 1;
speed = .025;
degRot = 9000;
%--------------------------------------------
%The path that sphere needs to follow
%Op No. 3
dir = dx;
for(i=0:rotPrecision:degRot)
    rotate(s,dir,rotAmount);
    drawnow;
    pause(speed);
end
