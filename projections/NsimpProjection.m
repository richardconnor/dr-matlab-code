classdef NsimpProjection < IProjection
    %creates an nSimplex projection using the method defined in ...
    
    properties
        projName
        nSimplex
        projectDims
    end
    
    methods
        function obj = NsimpProjection(witnessData, projectDims, metric)
            %metric here is now a matlab metric!
            
            obj.projName = "NsimpProjection";
            obj.projectDims = projectDims;
            
%             sData = zeros(projectDims, size(witnessData,2));
%             %use random elements of sampleData, make sure there is no
%             %overlap
%             randIds = getRandomIds(projectDims,size(witnessData,1),6);
%             for i = 1 : projectDims
%                 next = witnessData(randIds(i),:);
%                 sData(i,:) = next;
%             end
            
            obj.nSimplex = NSimplex_RC(witnessData(1:projectDims,:), metric);
        end
        
        function res = project(obj,A)
            % project datum A
            res = obj.nSimplex.project(A);
        end

        function res = projectWithDistances(obj,qToLDists)
            res = obj.nSimplex.getApexFromDists((qToLDists(1:obj.projectDims,:))');
        end
    end
    
end

