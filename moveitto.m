%this function will travel to the commanded x,y position put in.


function [] = moveitto(gox,goy)

%bring global variables into function
global time;
global a;
global currentx currenty;
global currentdirx currentdiry;
global backlashx backlashy;
global stepX dirX stepY dirY enPin;

%determine screen distance to move (does not factor in backlash) in x and y directions
disx=gox-currentx;
disy=goy-currenty;

%mark direction of new movement
%this is needed for backlash consideration
if disx<=0
    directionx=0;
else
    directionx=1;
end

if disy<=0
    directiony=0;
else
    directiony=1;
end

%%%%%%%%%%%system to add or subtract backlash%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%did direction change in the x? and was there was movement in the x?  if yes backlash needs
%is added or subtracted in
if directionx~=currentdirx && disx~=0
    
    if directionx==0 %directionx change and is now negative
         disx=disx-backlashx; %backlash must be subtracted
    end
    
    if directionx==1 %directionx change and is now positive
         disx=disx+backlashx; %backlash must be added
    end   
    
    currentdirx=directionx; %for next time function is called currentdirx is set
    
end

%did direction change in the y? and was there was movement in the y?  if yes backlash needs
%is added or subtracted in
if directiony~=currentdiry && disy~=0
    if directiony==0 %directiony change and is now negative
         disy=disy-backlashy; %backlash must be subtracted
    end
    
    if directiony==1 %directiony change and is now positive
         disy=disy+backlashy; %backlash must be added
    end   
   
     currentdiry=directiony; %for next time function is called currentdiry is set
    
end


%position input to step commands are positive when read into arduino
disx=abs(disx);
disy=abs(disy);


if disx>disy   %deterime which one is large movement
    ratio=disx/disy;  %deterime ratio greater than or equal to 1
    largesize=disx;  %major movement set
    bigdir=dirY;     %pins determined to control major and minor movement
    smalldir=dirX;   
    bigstep=stepY;    
    smallstep=stepX;
    bigdirectionvalue=directionx;  %direction set
    smalldirectionvalue=directiony;
else
    ratio=disy/disx; %deterime ratio greater than or equal to 1
    largesize=disy;  %major movement set
    bigdir=dirX;   %pins determined to control major and minor movement
    smalldir=dirY;
    bigstep=stepX;
    smallstep=stepY;
    bigdirectionvalue=directiony;   %direction set
    smalldirectionvalue=directionx;
end  
    
count=1 ;  

if disx+disy>0   %if both are 0 then no movement occurs, This can accidently happen when applying rounding.

writeDigitalPin(a,bigdir,bigdirectionvalue); %writes direction
writeDigitalPin(a,smalldir,smalldirectionvalue); %writes direction


for i=1:largesize
    
    writeDigitalPin(a,bigstep,1); %each loop writes one major steps;
       
     if i==round(ratio*count) && ratio~=1/0   %if it is due, a minor step is written,  ratio~=1/0 means minor step is never written if minor step=0
    writeDigitalPin(a,smallstep,1);
     end
    
    %pause(time/1000);
    writeDigitalPin(a,bigstep,0);
    
    if i==round(ratio*count)&& ratio~=1/0   %if it is due a minor step is written
    writeDigitalPin(a,smallstep,0); 
    count=count+1; %sets number of counts from small movement, used to determine if minor step is due
    end
        
        
end
end
currentx=gox;
currenty=goy;

end
    