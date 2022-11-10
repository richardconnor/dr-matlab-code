classdef MdsProjection < IProjection
    %creates a projection using the MDS method...
    % just started this, haven't finished at all it won't work...
    properties
        projName
        H
        b
        c
    end
    
    methods
        function obj = MdsProjection(witnessData,projectDims)
            obj.projName = "MdsProjection";
            
            %first, we create the (Kruskal stress1 variant) of MDS
            mdsWitnessProj = mdscale(pdist(witnessData),projectDims);
            %then, we map it back to the original coordinate space, as best
            %we can; this gives us the transform for doing it
            [~, ~, transform ] = procrustes(witnessData,mdsWitnessProj);
            
            % so given this correction, the pseudoinverse can be
            % calculated, and then this can be applied to a different space
            obj.H = pinv( transform.T );
            obj.b = transform.b;
            obj.c = transform.c(1,:);
        end
        
        function res = project(obj,A)
            % project datum A using the calcualated inverse transform
            res = (1 / obj.b) * (( A - obj.c ) * obj.H);
        end
    end
end

