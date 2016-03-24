function corVal = SUPPORT_CMP(searchWindow, supportWindow, method)
 
if strcmp(method, 'SSD')    
    corVal = (sum(searchWindow(:)) - (sum(supportWindow(:)))).^2;
elseif strcmp(method, 'SAD')
    corVal = (sum(searchWindow(:)) - (sum(supportWindow(:))));
end    
    
end

