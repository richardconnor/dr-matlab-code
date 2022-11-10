classdef LmdsProjection < IProjection
    %creates a projection using the MDS method...
    % just started this, haven't finished at all it won't work...
    properties
        projName
        landmarks
        deltaMu
        lHash
        metric
    end
    
    methods
        function obj = LmdsProjection(witnessData,projectDims,metric )
            obj.projName = "LmdsProjection";
            
            obj.landmarks = witnessData;
            obj.metric = metric;
            
            distances = squareform(pdist( witnessData,metric ));
            
            cmdProjection = cmdscale(distances,projectDims);
            obj.lHash = pinv( cmdProjection );
            
            distanceSq = distances.^2;
            
            n = (sum( distanceSq))';
            obj.deltaMu = n ./ size(witnessData,1);
            
        end
        
        function res = project(obj,A)
            
            %get the squares of the distance from A to landmark points, and
            % subtract the mean of the landmark point-to-point distances
            qToLDists = obj.metric( A, obj.landmarks ) ;
            x1 = ( qToLDists ).^2 - obj.deltaMu;
            
            % apply the inverse transform and adjust
            res = -(obj.lHash * x1) ./ 2;
            res = res';
        end

        function res = projectWithDistances(obj,qToLDists)
            
            %get the squares of the distance from A to landmark points, and
            % subtract the mean of the landmark point-to-point distances
%             qToLDists = obj.metric( A, obj.landmarks ) ;
            x1 = ( qToLDists ).^2 - obj.deltaMu;
            
            % apply the inverse transform and adjust
            res = -(obj.lHash * x1) ./ 2;
            res = res';
        end
        
    end
end

