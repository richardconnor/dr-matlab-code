classdef PcaProjection < IProjection
    %creates a projection using PCA
    
    properties
        projName
        coeffArray
    end
    
    methods
        function obj = PcaProjection(witnessData,projectDims)
            obj.projName = "PcaProjection";
            ar = pca(witnessData);
            obj.coeffArray = ar(:,1:projectDims);
        end
        
        function res = project(obj,A)
            % project datum A
            res = A * obj.coeffArray;
        end
        
    end
    
end

