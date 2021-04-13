%---------TO DO---------
%Figure out how to shade a 5x5 square then it will be easier to figure out
%how to jump the for loop by 5 pixels


function xy = shade(img)
    grayedpic = rgb2gray(img);  %convert  it to  grayscale
    %imshow(grayedpic);              %this  shows  you  the  grayscale  picture.

    doublepic = double(grayedpic);  %typecast  the  uint8  array to an  array of  doubles
    [vertlim ,horizlim ]=size(doublepic);%find  the  vertical & horizontal  dims of the  pic

    x=[];
    y=[];
    n=1;

    %---------find the dark boxes---------
    pixsize = 24;
    for i=1:pixsize: vertlim-pixsize
        for j=1:pixsize: horizlim-pixsize      
            pxchunk = doublepic(i:i+pixsize, j:j+pixsize);
            pxaverage = mean(mean(pxchunk)); 
            if  pxaverage < 15
                      
                x(n)=j;                                  %add the top left x location  of the  dark  5px x 5px box
                y(n)=vertlim -i;                         %add the top left y location  of the  dark  5px x 5px box

                x(n+1)=j+pixsize;                              %add the top right x location  of the  dark  5px x 5px box
                y(n+1)=vertlim -i;                       %add the top right y location  of the  dark  5px x 5px box

                x(n+2)=j;                                %add the bottom left x location  of the  dark  5px x 5px box
                y(n+2)=vertlim - (i+pixsize/5);                   %add the bottom left y location  of the  dark  5px x 5px box

                x(n+3)=j+pixsize;                              %add the bottom right x location  of the  dark  5px x 5px box
                y(n+3)=vertlim - (i+pixsize/5); 
                
                x(n+4)=j;                                  %add the top left x location  of the  dark  5px x 5px box
                y(n+4)=vertlim - (i+2*pixsize/5);                         %add the top left y location  of the  dark  5px x 5px box

                x(n+5)=j+pixsize;                              %add the top right x location  of the  dark  5px x 5px box
                y(n+5)=vertlim - (i+2*pixsize/5);                       %add the top right y location  of the  dark  5px x 5px box

                x(n+6)=j;                                %add the bottom left x location  of the  dark  5px x 5px box
                y(n+6)=vertlim -(i+3*pixsize/5);                   %add the bottom left y location  of the  dark  5px x 5px box

                x(n+7)=j+pixsize;                              %add the bottom right x location  of the  dark  5px x 5px box
                y(n+7)=vertlim -(i+3*pixsize/5);
                
                x(n+8)=j;                                  %add the top left x location  of the  dark  5px x 5px box
                y(n+8)=vertlim - (i+4*pixsize/5);                         %add the top left y location  of the  dark  5px x 5px box

                x(n+9)=j+pixsize;                              %add the top right x location  of the  dark  5px x 5px box
                y(n+9)=vertlim - (i+4*pixsize/5);                       %add the top right y location  of the  dark  5px x 5px box

                x(n+10)=j;                                %add the bottom left x location  of the  dark  5px x 5px box
                y(n+10)=vertlim -(i+pixsize);                   %add the bottom left y location  of the  dark  5px x 5px box

                x(n+11)=j+pixsize;                              %add the bottom right x location  of the  dark  5px x 5px box
                y(n+11)=vertlim -(i+pixsize);
                
                n=n+12;
         
            elseif  pxaverage < 60*2
               
                x(n)=j;                                  %add the top left x location  of the  dark  5px x 5px box
                y(n)=vertlim -i;                         %add the top left y location  of the  dark  5px x 5px box

                x(n+1)=j+pixsize;                              %add the top right x location  of the  dark  5px x 5px box
                y(n+1)=vertlim -i;                       %add the top right y location  of the  dark  5px x 5px box

                x(n+2)=j;                                %add the bottom left x location  of the  dark  5px x 5px box
                y(n+2)=vertlim - (i+pixsize/3);                   %add the bottom left y location  of the  dark  5px x 5px box

                x(n+3)=j+pixsize;                              %add the bottom right x location  of the  dark  5px x 5px box
                y(n+3)=vertlim - (i+pixsize/3); 
                
                x(n+4)=j;                                  %add the top left x location  of the  dark  5px x 5px box
                y(n+4)=vertlim - (i+2*pixsize/3);                         %add the top left y location  of the  dark  5px x 5px box

                x(n+5)=j+pixsize;                              %add the top right x location  of the  dark  5px x 5px box
                y(n+5)=vertlim - (i+2*pixsize/3);                       %add the top right y location  of the  dark  5px x 5px box

                x(n+6)=j;                                %add the bottom left x location  of the  dark  5px x 5px box
                y(n+6)=vertlim -(i+pixsize);                   %add the bottom left y location  of the  dark  5px x 5px box

                x(n+7)=j+pixsize;                              %add the bottom right x location  of the  dark  5px x 5px box
                y(n+7)=vertlim -(i+pixsize);
                
                n=n+8;
         
            elseif pxaverage < 60*3
                
           
                x(n)=j;                                  %add the top left x location  of the  dark  5px x 5px box
                y(n)=vertlim -i;                         %add the top left y location  of the  dark  5px x 5px box

                x(n+1)=j+pixsize;                              %add the top right x location  of the  dark  5px x 5px box
                y(n+1)=vertlim -i;                       %add the top right y location  of the  dark  5px x 5px box

                x(n+2)=j;                                %add the bottom left x location  of the  dark  5px x 5px box
                y(n+2)=vertlim -(i+pixsize);                   %add the bottom left y location  of the  dark  5px x 5px box

                x(n+3)=j+pixsize;                              %add the bottom right x location  of the  dark  5px x 5px box
                y(n+3)=vertlim -(i+pixsize); 
                
                n=n+4;
            end
        
        end
        

    end

    


    %---------shade the dark boxes---------


    xytemp = cat(1,x,y);            %concatenate  the  lists
    xy=transpose(xytemp);           %transpose  them so each x-y pair is a row
    for i = 1:length(xy(:,1))-1
        if xy(i,:) == xy(i+1,:)
            xy(i,:)= [];
        end
    end
    for i = 1:length(xy(:,1))-1
        if xy(i,:) == xy(i+1,:)
            xy(i,:)= [];
        end
    end
      for i = 1:length(xy(:,1))-1
        if xy(i,:) == xy(i+1,:)
            xy(i,:)= [];
        end
    end
    xy = superSort(xy,1,4);
end
