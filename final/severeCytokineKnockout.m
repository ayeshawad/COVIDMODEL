

% Simulating Cytokine Knockout Scenarios
format long

% Load parameters and perform homeostasis calculations
p = load_parameters();
p = Homeostasis_calculations(p);

% Define the time span for the simulation
tspan = [0 30];

% Simulate the severe case (control)
% Parameters for severe dynamics
p.p_F_I = 0.002;
p.eta_F_MPhi = 1e-4*2;
p.p_M_I = 2*0.6;
p.eps_K_L = 2.102 * 10^-6;
p.p_Gamma_T = 30;

[timeS, solS] = COVID_IMMUNE_MODEL(p, tspan);

% Knockout TNF-alpha
p_tnf_knockout = p;
p_tnf_knockout.p_alpha_T = 0; % Set TNF-alpha production to zero
p_tnf_knockout.p_alpha_MPhi = 0;
p_tnf_knockout.p_alpha_M = 0;
p_tnf_knockout.p_alpha_K = 0;
[timeTNFK, solTNFK] = COVID_IMMUNE_MODEL(p_tnf_knockout, tspan);


% Knockout IFN-gamma
p_ifn_knockout = p;
p_ifn_knockout.p_Gamma_T = 0; % Set IFN-gamma production to zero
p_ifn_knockout.p_Gamma_K = 0;
[timeIFNK, solIFNK] = COVID_IMMUNE_MODEL(p_ifn_knockout, tspan);

% Knockout IL-6
p_il6_knockout = p;
p_il6_knockout.p_L_I = 0; % Set IL-6 production to zero
p_il6_knockout.p_L_MPhi =0;
p_il6_knockout.p_L_M =0;
[timeIL6K, solIL6K] = COVID_IMMUNE_MODEL(p_il6_knockout, tspan);

% Knockout both TNF-alpha and IFN-gamma
p_tnf_ifn_knockout = p;
p_tnf_ifn_knockout.p_alpha_T = 0; % Set TNF-alpha production to zero
p_tnf_ifn_knockout.p_Gamma_T = 0; % Set IFN-gamma production to zero
p_tnf_ifn_knockout.p_alpha_MPhi = 0;
p_tnf_ifn_knockout.p_alpha_M = 0;
p_tnf_ifn_knockout.p_alpha_K = 0;
p_ifn_knockout.p_Gamma_K = 0;

[timeTNFIFNK, solTNFIFNK] = COVID_IMMUNE_MODEL(p_tnf_ifn_knockout, tspan);


% Interpolate solutions for consistent time points
time_deval = linspace(tspan(1), tspan(2), 1e3);
solS_deval = interp1(timeS, solS', time_deval);
solTNFK_deval = interp1(timeTNFK, solTNFK', time_deval);
solIFNK_deval = interp1(timeIFNK, solIFNK', time_deval);
solIL6K_deval = interp1(timeIL6K, solIL6K', time_deval);
solTNFIFNK_deval = interp1(timeTNFIFNK, solTNFIFNK', time_deval);

% Call the cytokine knockout plotter
severe_cytokine_knockout_plotter(time_deval, solS_deval', solTNFK_deval', solIFNK_deval', solIL6K_deval', solTNFIFNK_deval', p);
%severe_cytokine_knockout_plotter(time_deval, solS_deval', solTNFK_deval', solIFNK_deval', solIL6K_deval', solTNFIFNK_deval', p);
