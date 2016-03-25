function corVal = SUPPORT_CMP(searchWindow, supportWindow, method)

% check which comparison algorithm to use
if strcmp(method, 'SSD')    
    corVal = sum(sum(searchWindow(:)) - (sum(supportWindow(:)))).^2;
elseif strcmp(method, 'SAD')
    corVal = (sum(searchWindow(:)) - (sum(supportWindow(:))));
end    
    
end

