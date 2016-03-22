function SSD = getSSD( leftWindow, rightWindow )
%GETSUPPORTWINDOW Summary of this function goes here
%   Detailed explanation goes here

leftAns = 0;
rightAns = 0;

for x= 1:3
    for y=1:3
        if leftWindow(x,y) ~= -1
            leftAns = leftWindow(x,y) + leftAns;
        end
    end
end

for x= 1:3
    for y=1:3
        if rightWindow(x,y) ~= -1
            rightAns = rightWindow(x,y) + rightAns;
        end
    end
end

SSDDouble = sum( (leftAns - rightAns).^2 );

SSD = uint8(SSDDouble);
end
