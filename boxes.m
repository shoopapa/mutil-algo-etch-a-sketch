%John Hosgood - ME 340

function xy = boxes(img)

    grayedpic = rgb2gray(img); %convert to  grayscale
    doublepic = double(grayedpic);%typecast  the  uint8  array to an  array of  doubles
    [vertlim ,horizlim ]=size(doublepic);%find  the  vertical & horizontal  dims of the  pic
    x=[];y=[];
    
    pixsize = 8;
    n=1;
    for i=1:pixsize: vertlim-pixsize
        for j=1:pixsize: horizlim-pixsize
            pxchunk = doublepic(i:i+pixsize, j:j+pixsize);
            pxaverage = mean(mean(pxchunk));
            %the  inside  of this  for  loop is  where  you  will
            %choose  what  points  you  want  the etch -a-sketch
            %to  visit
            if  pxaverage < 65 %check  if the  current  pixel  is dark
                x(n)=j;%add the x location  of the  dark  pixel
                y(n)=vertlim -i;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j+pixsize;%add the x location  of the  dark  pixel
                y(n)=vertlim -i;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j+pixsize;%add the x location  of the  dark  pixel
                y(n)=vertlim -i-pixsize;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j;%add the x location  of the  dark  pixel
                y(n)=vertlim -i-pixsize;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j;%add the x location  of the  dark  pixel
                y(n)=vertlim -i;%add the y location  of the  dark  pixel
                n=n+1;%increment n

            end
        end
    end
     pixsize = 16;    
    for i=1:pixsize: vertlim-pixsize
        for j=1:pixsize: horizlim-pixsize
            pxchunk = doublepic(i:i+pixsize, j:j+pixsize);
            pxaverage = mean(mean(pxchunk));
            %the  inside  of this  for  loop is  where  you  will
            %choose  what  points  you  want  the etch -a-sketch
            %to  visit
            if  pxaverage < 65*2 %check  if the  current  pixel  is dark
                x(n)=j;%add the x location  of the  dark  pixel
                y(n)=vertlim -i;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j+pixsize;%add the x location  of the  dark  pixel
                y(n)=vertlim -i;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j+pixsize;%add the x location  of the  dark  pixel
                y(n)=vertlim -i-pixsize;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j;%add the x location  of the  dark  pixel
                y(n)=vertlim -i-pixsize;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j;%add the x location  of the  dark  pixel
                y(n)=vertlim -i;%add the y location  of the  dark  pixel
                n=n+1;%increment n

            end
        end
    end
    
    pixsize = 32;    
    for i=1:pixsize: vertlim-pixsize
        for j=1:pixsize: horizlim-pixsize
            pxchunk = doublepic(i:i+pixsize, j:j+pixsize);
            pxaverage = mean(mean(pxchunk));
            %the  inside  of this  for  loop is  where  you  will
            %choose  what  points  you  want  the etch -a-sketch
            %to  visit
            if  pxaverage < 65*3 %check  if the  current  pixel  is dark
                x(n)=j;%add the x location  of the  dark  pixel
                y(n)=vertlim -i;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j+pixsize;%add the x location  of the  dark  pixel
                y(n)=vertlim -i;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j+pixsize;%add the x location  of the  dark  pixel
                y(n)=vertlim -i-pixsize;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j;%add the x location  of the  dark  pixel
                y(n)=vertlim -i-pixsize;%add the y location  of the  dark  pixel
                n=n+1;%increment n

                x(n)=j;%add the x location  of the  dark  pixel
                y(n)=vertlim -i;%add the y location  of the  dark  pixel
                n=n+1;%increment n

            end
        end
    end
    
    xytemp = cat(1,x,y);  %Concatenate lists
    xy=transpose(xytemp);%transpose  them so each x-y pair is a row
  
   
    xy = superSort(xy,1,5);
end
