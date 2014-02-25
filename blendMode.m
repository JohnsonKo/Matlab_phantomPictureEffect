function imResult = blendMode(A, B, mode, offsetW, offsetH)
%% Copyright (c) 2013, Davide
% All rights reserved.
% 
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are
% met:
% 
%     * Redistributions of source code must retain the above copyright
%       notice, this list of conditions and the following disclaimer.
%     * Redistributions in binary form must reproduce the above copyright
%       notice, this list of conditions and the following disclaimer in
%       the documentation and/or other materials provided with the distribution
% 
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
% POSSIBILITY OF SUCH DAMAGE.
%% Implement the blending of two images
% 
% Input:
%   A           -   first image
%   B           -   second image
%   mode        -   Several blending modes are aviable:
%       Normal
%       Lighten
%       Darken
%       Multiply
%       Divide
%       Average
%       Add
%       Subtract
%       Difference
%       Negation
%       Screen
%       Exclusion
%       Overlay
%       SoftLight
%       HardLight
%       ColorDodge
%       ColorBurn
%       LinearDodge
%       LinearBurn
%       LinearLight
%       VividLight
%       PinLight
%       HardMix
%       Reflect
%       Glow
%       Phoenix
% 
%   offsetW     -   move picture B horizontally in respect to the top-left
%                   corner of picture A. Default value = 1.
%   offsetH     -   move picture B vertically in respect to the top-left
%                   corner of picture A. Default value = 1.
% 
% Output:
%   imResult    -   Result of the blending
% 

%% Check input
if nargin < 2
    error('Need at least two inputs');
end

if nargin < 3
    mode = 'normal';
end

if nargin < 4
    offsetW = 1;
    offsetH = 1;
end

if nargin < 5
    offsetH = 0;
end
        
%% Implementation

% convert to double, easier implementation
if (strcmp(class(A), 'uint8'))
    A = im2double(A);
end
if (strcmp(class(B), 'uint8'))
    B = im2double(B);
end

switch (lower(mode))
    case {'normal'} 
        imResult = blendMode_Normal(A, B, offsetW, offsetH);
    case {'lighten'} 
        imResult = blendMode_Lighten(A, B, offsetW, offsetH);
    case {'darken'} 
        imResult = blendMode_Darken(A, B, offsetW, offsetH);
    case {'multiply'} 
        imResult = blendMode_Multiply(A, B, offsetW, offsetH);
    case {'divide'} 
        imResult = blendMode_Divide(A, B, offsetW, offsetH);
    case {'average'} 
        imResult = blendMode_Average(A, B, offsetW, offsetH);
    case {'add'} 
        imResult = blendMode_Add(A, B, offsetW, offsetH);
	case {'subtract'} 
        imResult = blendMode_Subtract(A, B, offsetW, offsetH);
    case {'difference'} 
        imResult = blendMode_Difference(A, B, offsetW, offsetH);
    case {'negation'} 
        imResult = blendMode_Negation(A, B, offsetW, offsetH);
    case {'screen'} 
        imResult = blendMode_Screen(A, B, offsetW, offsetH);
    case {'exclusion'} 
        imResult = blendMode_Exclusion(A, B, offsetW, offsetH);
    case {'overlay'} 
        imResult = blendMode_Overlay(A, B, offsetW, offsetH);
    case {'softlight'} 
        imResult = blendMode_SoftLight(A, B, offsetW, offsetH);
	case {'hardlight'} 
        imResult = blendMode_HardLight(A, B, offsetW, offsetH);
    case {'colordodge'} 
        imResult = blendMode_ColorDodge(A, B, offsetW, offsetH);
    case {'colorburn'} 
        imResult = blendMode_ColorBurn(A, B, offsetW, offsetH);
    case {'lineardodge'} 
        imResult = blendMode_LinearDodge(A, B, offsetW, offsetH);
    case {'linearburn'} 
        imResult = blendMode_LinearBurn(A, B, offsetW, offsetH);
    case {'linearlight'} 
        imResult = blendMode_LinearLight(A, B, offsetW, offsetH);
    case {'vividlight'} 
        imResult = blendMode_VividLight(A, B, offsetW, offsetH);
	case {'pinlight'} 
        imResult = blendMode_PinLight(A, B, offsetW, offsetH);
    case {'hardmix'} 
        imResult = blendMode_HardMix(A, B, offsetW, offsetH);
    case {'reflect'} 
        imResult = blendMode_Reflect(A, B, offsetW, offsetH);
    case {'glow'} 
        imResult = blendMode_Glow(A, B, offsetW, offsetH);
    case {'phoenix'} 
        imResult = blendMode_Phoenix(A, B, offsetW, offsetH);
end

end