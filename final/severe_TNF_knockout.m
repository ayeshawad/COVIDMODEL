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
%p_tnf_knockout.p_alpha_MPhi = 0;
%p_tnf_knockout.p_alpha_M = 0;
%p_tnf_knockout.p_alpha_K = 0;
[timeTNFK, solTNFK] = COVID_IMMUNE_MODEL(p_tnf_knockout, tspan);

% Interpolate solutions for consistent time points
time_deval = linspace(tspan(1), tspan(2), 1e3);
solS_deval = interp1(timeS, solS', time_deval);
solTNFK_deval = interp1(timeTNFK, solTNFK', time_deval);

% Call the cytokine knockout plotter
severe_TNF_knockout_plotter(time_deval, solS_deval', solTNFK_deval', p);
