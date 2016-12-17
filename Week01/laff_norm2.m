function [ alpha ] = laff_norm2( x )

% alpha = norm2 ( x ) calculate the length (norm2) of vector x
%   Vectors x can be a column and/or row vector.  In other
%   words, x can be a n x 1 or 1 x n array.  However, one size must 
%   equal 1 and the other size equal n.  

if ~isvector( x )
    alpha = 'FAILED';
    return
end

alpha = sqrt( laff_dot( x, x) );

return
end
