% function embed(carrierPath,ER,stegoPath)
% this is your embedding algorithm
%   input:
%           carrierPath: the path of the carrier image.
%           ER: embedding rate
%           stegoPath: the save path of the stego image
%   output:
%           None

carry = imread(carrierPath);

% embedding code

imwrite(carry,stegoPath);

end
