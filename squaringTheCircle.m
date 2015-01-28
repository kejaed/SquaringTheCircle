% close and clear up everything
clear all;
close all;
clc;

% get ready to record a movie
writerObj = VideoWriter('circleSquare2.avi');
open(writerObj);

% open our figure window
figure;

% tell the figure window to display consecutive plots, not replace
hold on;

% set up the camera for perspective projections, this is the whole
% reason that this works
camproj('perspective');

% set the camera viewing angle to manual, this means that other commands
% wont mess with it
camva('manual');

% scale is a parameter used to change the shape of each parabola
scale = .3 ;

% top parabola
x=-10:0.1:10;
y=scale*x.^2;
z=ones(1,length(x)).*10;
plot3(x,y,z,'r','LineWidth' ,2)

% bottom
x=-10:0.1:10;
y=scale*x.^2;
z=ones(1,length(x)).*-10;
plot3(x,y,z,'g','LineWidth' ,2)

% left
z=-10:0.1:10;
y=scale*z.^2;
x=ones(1,length(z)).*10;
plot3(x,y,z,'b','LineWidth' ,2)

% right
z=-10:0.1:10;
y=scale*z.^2;
x=ones(1,length(z)).*-10;
plot3(x,y,z,'k','LineWidth' ,2)


hold off

% set up our axes sizes
maxAxis = scale*100 ;
axis([-10 10 0 maxAxis -10 10 ])

% get rid of the axes from the figure
set(gca, 'visible', 'off') ; 
 
% set the initial camera position
campos( [ 0 800 0])

% set our viewing angle (field of view of the camera)
camva(20)

% save 100 frames of the initial 'square'
for i = 1:100
    frame = getframe;
    writeVideo(writerObj,frame);
end

% pause 5 seconds for live figure, has nothing to do with the video
pause(5)

% spin from looking at pointy side to the round side
step = 5;

for i=1:step:180
    camorbit(step,0,'camera')
    drawnow
    pause(.1)
    
    % save the frame to video
    frame = getframe;
    writeVideo(writerObj,frame);
    
    
end

% once we've spun around, we have to now walk towards the circle to just
% the right spot.
camposStep = [0 50 0 ] ;
nowCampos = campos;

while nowCampos(2) < -85
    while(nowCampos(2)+camposStep(2) > -85)
        camposStep = camposStep / 2;
    end
    campos(campos+camposStep);
    drawnow
    frame = getframe;
    writeVideo(writerObj,frame);
    pause(.1)
    nowCampos = campos ;
end

close(writerObj);


