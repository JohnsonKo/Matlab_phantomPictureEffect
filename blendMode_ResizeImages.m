function [A, B] = blendMode_ResizeImages(A, B, a, b, offsetW, offsetH)
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
%% After the resize process, the two images will have the same dimensions.

%% Check Input
if nargin < 4
    error('blendMode_ResizeImages:argChk', 'Need at least 4 input arguments.');
end

if nargin < 5
    offsetW = 0;
    offsetH = 0;
end

if nargin < 6
    offsetH = 0;
end

%% Implementation
a1 = a(1);
a2 = a(2);
b1 = b(1);
b2 = b(2);

% cut matrix beetwen sH : eH; sW : eW
sH = 1;
eH = 1;
sW = 1;
eW = 1;

% crop image B
if (offsetH > 0)
    sH = b1 + 1;
    eH = b1;
else
    sH = 1;
    eH = min(abs(offsetH), b1);
end

if (offsetW > 0)
    sW = b2 + 1;
    eW = b2;
else
    sW = 1;
    eW = min(abs(offsetW), b2);
end

B(sH : eH, :, :) = [];
B(:, sW : eW, :) = [];


sH = 1;
eH = 1;
sW = 1;
eW = 1;
if (offsetH + b1 > a1)
    sH = b1 - (offsetH + b1 - a1) + 1;
    eH = size(B, 1);
    if (sH > 0)
        B(sH : eH, :, :) = [];
    else
        B(1 : end, :, :) = [];
    end
end

if (offsetW + b2 > a2)
    sW = b2 - (offsetW + b2 - a2) + 1;
    eW = size(B, 2);
    if (sW > 0)
        B(:, sW : eW, :) = [];
    else
        B(:, 1 : end, :) = [];
    end
end

% crop image A
sH = 1;
eH = 1;
sW = 1;
eW = 1;
if (offsetH > 0)
    sH = offsetH + size(B, 1);
    A(sH : end, :, :) = [];
    A(1 : min(offsetH - 1, end), :, :) = [];
else
    sH = size(B, 1) + 1;
    A(sH : end, :, :) = [];
end

if (offsetW > 0)
    sW = offsetW + size(B, 2);
    A(:, sW : end, :) = [];
    A(:, 1 : min(offsetW - 1, end), :) = [];
else
    sW = size(B, 2) + 1;
    A(:, sW : end, :) = [];
end



% if (b1 > a1)
%     B(a1 + 1 : end, :, :) = [];
% else
%     if (b1 < a1)
% %         offsetH
%         if (offsetW > 0)
%             if (offsetH <= a1)
%                 if (offsetH > 0)
%                     sH = offsetH;
%                     eH = offsetH + b1 - 1;
%                     if eH > a1
%                         B(b1 - (eH - a1) + 1 : end, :, :) = [];
%                         eH = a1;
%                     end
% 
%                     sW = offsetW;
%                     eW = offsetW + b2 - 1;
%                     if eW > a2
%                         B(:, b2 - (eW - a2) + 1 : end, :) = [];
%                         eW = a2;
%                     end
%                     A = A(sH : eH, sW : eW, :);
%                 else
%                     if (abs(offsetH) <= b1)
%                         B(1 : abs(offsetH) - 1, :, :) = [];
%                         A(size(B, 1) + 1 : end, :, :) = [];
%                         
%                         sW = offsetW;
%                         eW = offsetW + b2 - 1;
%                         if eW > a2
%                             B(:, b2 - (eW - a2) + 1 : end, :) = [];
%                             eW = a2;
%                         end
%                         A = A(:, sW : eW, :);
%                     else
%                         A = [];
%                         B = [];
%                     end
%                 end
%             else
%                 A = [];
%                 B = [];
%             end
%         else
%             if (abs(offsetW) <= b2)
%                 if (offsetH > 0)
%                     sH = offsetH;
%                     eH = offsetH + b1 - 1;
%                     if eH > a1
%                         B(b1 - (eH - a1) + 1 : end, :, :) = [];
%                         eH = a1;
%                     end
% 
%                     sW = 1;
%                     eW = b2 + offsetW;
%                     B(:, b2 + offsetW + 1: end, :) = [];
%                     A = A(sH : eH, sW : eW, :);
%                 else
%                     
% %                     sH = 1;
% %                     eH = b1 - abs(offsetH) - 1;
% %                     if eH > a1
% %                         B(b1 - (eH - a1) + 1 : end, :, :) = [];
% %                         eH = a1;
% %                     end
% %                     
% %                     B(eH : end, : , :) = [];
% % 
% %                     sW = 1;
% %                     eW = abs(offsetW) - 1;
% %                     B(:, sW : eW, :) = [];
% % %                     sW = 1;
% % %                     eW = b2 + offsetW;
% % %                     B(:, b2 + offsetW + 1: end, :) = [];
% % %                     A = A(sH : eH, sW : eW, :);
% %                     imshow(B)
%                     
%                     
% %                     if (abs(offsetH) <= b1)
% %                         B(1 : abs(offsetH) - 1, :, :) = [];
% %                         A(size(B, 1) + 1 : end, :, :) = [];
% %                         
% %                         sW = offsetW;
% %                         eW = offsetW + b2 - 1;
% %                         if eW > a2
% %                             B(:, b2 - (eW - a2) + 1 : end, :) = [];
% %                             eW = a2;
% %                         end
% %                         A = A(:, sW : eW, :);
% %                     else
% %                         A = [];
% %                         B = [];
% %                     end
%                     
%                                         
%                 end
%             else
%                 A = [];
%                 B = [];
%             end
%         end
% 
% %         A(b1 + 1 : end, : , :) = [];
%     end
% end
% 
% if (b2 > a2)
%     B(:, a2 + 1 : end, :) = [];
% else
%     if (b2 < a2)
%         A(:, b2 + 1 : end, :) = [];
%     end
% end
    
end