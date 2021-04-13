%This is the main code that runs and controls functions.  With this code
%the arduino stepper commands are controlled to move in x y positions
%stored in position matrix, mat: columns of x and y positions

%important if this code is stopped prematurly global variable "a" must be
%cleared.  You can type "clear all" into command window.  If this is not done
%the stepper motors will remain powered on drawing current.

%make sure you 'com' is set to the correct port.  You can determine the
%proper port by going into the arduino app and seeing what port is opened.
%This changes when using different computers and different boards.

function basecode(mat, com)

    global a; % create an arduino object
    com
    a = arduino(com, 'Uno');  %this is an internal program in matlab that creates a follower program in the Arduino that is controlled by the leader matlab program.   The first time this runs it will take a little longer as it will downlad the follower program into the arduino.

    %Set and configure pins for arduino
    global stepX dirX stepY dirY enPin;

    stepX = 'D2';
    dirX  = 'D5';
    stepY = 'D3';
    dirY  = 'D6';
    enPin = 'D8';

    configurePin(a,'D2','DigitalOutput')
    configurePin(a,'D5','DigitalOutput')
    configurePin(a,'D3','DigitalOutput')
    configurePin(a,'D6','DigitalOutput')
    configurePin(a,'D8','DigitalOutput')

    % Set initial position, lower left hand corner
    %note full range is approximately rangex=875 full rangey=610
    %repeatively going out of range causes the cables to slip in the
    %etch-a-sketch and will wear it out more quickly
    global currentx currenty;
    currentx=0;
    currenty=0;

    %establishes where backlash starts: 0 is negative, 1 is positive
    %note initial value only influences minor position of x,y start axis
    global currentdirx currentdiry;
    currentdirx=1;
    currentdiry=1;

    %set initial backlash; number of steps after changeing direciton in order for
    %visible movement to occur. This is a positive value
    global backlashx backlashy;
    backlashx=11;
    backlashy=8;

    global time;
    time=0; %This value of time pauses bewteen movements. note because of arduino and matlab communication this can only increase the speed to a certain degree. 0 is full speed.

    %runs through each travel point using fuction moveitto.  This function
    %relies on the global variables that are setup in this program and therefore cannot be run
    %without the basecode.

    for i=1:length(mat)
       moveitto(mat(i,1),mat(i,2));
    end
    clear all
end