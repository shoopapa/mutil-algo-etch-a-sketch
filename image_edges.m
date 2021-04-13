
function xy = image_edges(img) 

    grayedpic = rgb2gray(img);

    edges_prewitt = edge(grayedpic, 'Canny',[.01 .25]);

    [vertlim ,horizlim ]=size(edges_prewitt);

    [x,y] = makeOutline(edges_prewitt,vertlim,horizlim);
    
    y = round(y);
    x = round(x);

    xy = cat(1,x,y)';%concatenate  the  lists


    xy = sortrows(xy,[2]);
    xy = unique(xy,'rows');
    detail = 3;
    xy = superSort(xy,detail,1);
 
end



function [x,y] = makeOutline(pic, vertlim, horizlim) 

    x = [];
    y = [];
    
    inc = 1;
    
  
    for i= 1:inc:vertlim
        
        for j=1:inc:horizlim

            keepPoint = outlineLogic(i,j,pic);
        
            if keepPoint 
              x(end+1)=j;
              y(end+1)=vertlim-i;%add the y location of the dark pixel
            end

        end
              
    end
    
end

function [keepPoint] = outlineLogic(i,j,pic)
    px = pic(i,j);
    if (px == 1 )
       keepPoint = true;
    else
        keepPoint = false;
    end
    
end




function []= draw_anim(xymat)
    figure
    h=animatedline;
    axis ([0  875 0 640])%Your x values  should  be  between 0 and  875.  You y values  shouldbe  between 0 and  640
      for i=1: length(xymat)
          h.addpoints(h,xymat(i,1),xymat(i,2))
      end
end