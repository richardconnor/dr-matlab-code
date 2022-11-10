classdef (Abstract) IProjection
    %abstact projection class
    % instances will be nSimplex, PCA, RP and maybe others
    
    properties(Abstract)
        projName
    end
    
    methods(Abstract)
        res=project(A)
    end
    
    methods
        function showName(obj)
            disp(obj.projName)
        end
    end
    
end

