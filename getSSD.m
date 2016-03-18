function SSD = getSSD( leftWindow, rightWindow )
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here
SSD = sum( (leftWindow(:) - rightWindow(:)).^2 );
end
