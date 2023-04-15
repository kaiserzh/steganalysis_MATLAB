function [outVec] = F(inVec,mask,plus)
%function ---F1 and F-1 function
%   input:
%           inVec:a group of pixel value
%           mask: the mask used
%           flag: if flag is true, 1 in the mask is treat as 1, or as -1
%   output:

mlen = size(mask,2);
[row,col] =size(inVec);
outVec = zeros(row,col);
u=0;
for p=1:col
    if u==mlen
        u=0;
    end
    if mask(u+1)==1
        if plus == true % F1 function
            if mod(inVec(1,p),2)==0 % even number
                outVec(1,p)=inVec(1,p)+1;
            else % odd number
                outVec(1,p)=inVec(1,p)-1;
            end
        else % F-1 function
            if mod(inVec(1,p),2)==0
                outVec(1,p)=inVec(1,p)-1;
            else
                outVec(1,p)=inVec(1,p)+1;
            end
        end
    else
         outVec(1,p)=inVec(1,p);
    end
    u=u+1;
end
end

