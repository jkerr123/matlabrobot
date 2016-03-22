function SSD = getSSD( leftWindow, rightWindow )
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here

    leftWindowConv = int16(leftWindow);
    rightWindowConv = int16(rightWindow);
    
    leftSum = sum(leftWindowConv(:));
    rightSum = sum(rightWindowConv(:));
    
    SSD16 = (leftSum - rightSum) .^2;
    
    SSD = uint8(SSD16);

end
