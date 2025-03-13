% Load time data
timeData = load('Time.mat');
time = timeData.(char(fieldnames(timeData))); % Extract matrix dynamically

% Ensure time is a column vector
time = time(:); 

% Load solution matrices
solS = load('SevereDataOriginal.mat');
solL = load('SevereIL6Knockout.mat');
solA = load('SevereTNFAlphaKnockdown.mat');
solG = load('IFNGammaKnockdown.mat');
solAG = load('IFNGammaTNFAlphaKnockdown.mat');

% Extract matrices from loaded structures
solS = solS.(char(fieldnames(solS)));
solL = solL.(char(fieldnames(solL)));
solA = solA.(char(fieldnames(solA)));
solG = solG.(char(fieldnames(solG)));
solAG = solAG.(char(fieldnames(solAG)));

% Call the function with the computed derivatives
severe_vs_cytokine_knockdown_plotter(time, solS', time, solL', time, solA', time, solG', time, solAG');
