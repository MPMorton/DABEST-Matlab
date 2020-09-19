function p = validateFscatJitInputs(varargin)
% Checks the inputs for FscatJit2 and FscatJit2_mergeGroups. Defines
% defaults for inputs that are not given. 
if nargin == 1 
    if ~isfloat(varargin{1})
        varargin = {'isPaired',varargin{1}};
    end
end
defaultlims = [];
defaultbar = 'off';
validbars = {'off','on'};
defaultpair = 'N';
validpair = {'N','Y'};
defaultcircle = 170;
defaultplot = 'scatJit';
validplots = {'scatJit','violin','both'};
defaultcolors = lines(100);
checkpair = @(x) any(validatestring(x,validpair));
checklims = @(x) (numel(x) == 2) && isnumeric(x);
checkbar = @(x) any(validatestring(x,validbars));
checkplot = @(x) any(validatestring(x,validplots));
checkcirclesize = @(x) isscalar(x) && isreal(x) && x>0;

defaultbins = 10;
checkbins = @(x) isscalar(x) && isreal(x) && x>0 && ~mod(x,1);
p = inputParser;
addOptional(p,'lims',defaultlims,checklims)
addOptional(p,'isPaired',defaultpair,checkpair)
addOptional(p,'circleSize',defaultcircle,checkcirclesize)
addOptional(p,'barstate',defaultbar,checkbar)
addOptional(p,'nbins',defaultbins,checkbins)
addOptional(p,'plotType',defaultplot,checkplot)
addOptional(p,'colors',defaultcolors,@checkcolors)

parse(p,varargin{:});

if numel(fieldnames(p.Unmatched))
    disp('Could not identify the following inputs: ')
    disp(p.Unmatched)
    error('Could not identify all inputs')
end




end
function isvalid = checkcolors(colors)
sizecolors = size(colors);
isvalid = isa(colors,'double') && length(sizecolors)==2 && sizecolors(2) ==3;
end