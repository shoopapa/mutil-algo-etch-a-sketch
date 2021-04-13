function xy = superSort(unsrotedxy,detail, chunk) 
  
    unsrotedxy = unsrotedxy( 1:detail:length(unsrotedxy(:,1)) , : );
    m = mod( length(unsrotedxy(:,1)),chunk);
    l =length(unsrotedxy(:,1));
    xyLeft = unsrotedxy( 1:l-m , :);
    

    newxy = [0 0];
    for i = 1:chunk:length(unsrotedxy(:,1))- chunk +1

        distFromI = newxy(i,:);
        workingdist = 1e100;
        lastj = 1;
        newxy = [newxy; ones(chunk,2) ];
    
        for j = 1:chunk:length(xyLeft(:,1))
            compareThisRow = xyLeft(j,:);
            currentdist = clacDist( distFromI, compareThisRow );
            if  currentdist < workingdist
                workingdist = currentdist;
                lastj = j;
                keepchunk=xyLeft( j:j+chunk-1, : );
                smallxy=newxy(1:i,:);
                newxy = [smallxy; keepchunk];
            end
        end
        
        xyLeft(lastj:lastj+chunk-1,:) = [];
    end
    newxy(1,:) = [];
    xy = newxy;
end

function d = clacDist(r1,r2) 
    d = sqrt( (r2(1) - r1(1))^2 + (r2(2) - r1(2))^2 );
end
