classdef RandomProjection < IProjection
    %creates a random projection using the method defined in ...
    
    properties
        projName
        pDimsSqrt
        randArray
        linearAdjust
    end
    
    methods
        function obj = RandomProjection(origDims,projectDims)
            obj.projName = "RandomProjection";
            obj.pDimsSqrt = sqrt( projectDims );
            obj.linearAdjust = [1,0];
            ar = zeros(origDims,projectDims);
            r3 = sqrt(3);
            sx = 1/6;
            for i = 1 : origDims
                for j = 1 : projectDims
                    v = rand();
                    if v < sx
                        ar(i,j) = r3;
                    else
                        if v < 2 * sx
                            ar(i,j) = -r3;
                        end
                    end
                end
            end
            obj.randArray = ar;
        end
        
        function res = project(obj,A)
            % project datum A
            res = (A * obj.randArray) ./ obj.pDimsSqrt;
        end
    end
end

