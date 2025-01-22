% Simulating full model
format long

% Load parameters and perform homeostasis calculations
p = load_parameters();
p = Homeostasis_calculations(p);

% Validate parameters
estimated_params = [p.p_L_M  p.L_B_star  p.MPhi_I_star  p.p_L_MPhi  p.eta_G_MPhi  p.p_G_MPhi_I  p.T_prod_star p.T_M_prod_star p.p_G_M  p.M_prod_star p.N_prod_star p.eta_F_MPhi p.alpha_U_star p.alpha_B_star p.alpha_B_0 p.K_prod_star];
if isempty(find(estimated_params<0))==0
    disp('Negative parameter');
elif isempty(find(estimated_params>1e9))==0
    disp('Extremely large parameter');
end

% Define the time span for the simulation
tspan = [0 30];

% Simulate the mild case
[timeM, solM] = COVID_IMMUNE_MODEL(p, tspan);

% Prepare parameters for the monocyte knockout scenario
p_monocyte_knockout = p;
%p_monocyte_knockout.M0 = 0; % Set initial monocyte count to zero for knockout
%p_monocyte_knockout.MR = 0;
p_monocyte_knockout.p_M_I= 0; 
p_monocyte_knockout.p_MPhi_I_G=0;
p_monocyte_knockout.p_MPhi_I_L = 0;


% Simulate the monocyte knockout case
[timeMonocyteK, solMonocyteK] = COVID_IMMUNE_MODEL(p_monocyte_knockout, tspan);

% Prepare parameters for the neutrophil knockout scenario
p_neutrophil_knockout = p;
%p_neutrophil_knockout.N0 = 0; % Set initial neutrophil count to zero for knockout
%p_neutrophil_knockout.NR = 0; % Set reservoir neutrophil count to zero for knockout
p_nk_knockout.p_N_L = 0; %Neutrophil recruitment rate by IL6 is set to 0

% Simulate the neutrophil knockout case
[timeNeutrophilK, solNeutrophilK] = COVID_IMMUNE_MODEL(p_neutrophil_knockout, tspan);

% Prepare parameters for the inflammatory macrophage knockout scenario
p_macrophage_knockout = p;
%p_macrophage_knockout.MPhi_I_0 = 0; % Set initial macrophage count to zero for knockout
p_macrophage_knockout.a_I_MPhi = 0;  
p_macrophage_knockout.p_MPhi_I_G = 0;
p_macrophage_knockout.p_MPhi_I_L = 0;

% Simulate the macrophage knockout case
[timeMacrophageK, solMacrophageK] = COVID_IMMUNE_MODEL(p_macrophage_knockout, tspan);

% Prepare parameters for the NK cells knockout scenario
p_nk_knockout = p;
%p_nk_knockout.K0 = 0; % Set initial NK cells count to zero for knockout
%p_nk_knockout.KR = 0; % Set reservoir NK cells count to zero for knockout
p_nk_knockout.p_K_A = 0; %NK recruitmeny by NK set to zero


% Simulate the NK cells knockout case
[timeNKK, solNKK] = COVID_IMMUNE_MODEL(p_nk_knockout, tspan);

% Interpolate solutions for consistent time points
time_deval = linspace(tspan(1), tspan(2), 1e3);
solM_deval = interp1(timeM, solM', time_deval);
solMonocyteK_deval = interp1(timeMonocyteK, solMonocyteK', time_deval);
solNeutrophilK_deval = interp1(timeNeutrophilK, solNeutrophilK', time_deval);
solMacrophageK_deval = interp1(timeMacrophageK, solMacrophageK', time_deval);
solNKK_deval = interp1(timeNKK, solNKK', time_deval);

% Plotting function for multiple knockouts
multi_knockout_plotter_single_variable(time_deval, solM_deval', solMonocyteK_deval', solNeutrophilK_deval', solMacrophageK_deval', solNKK_deval', p);
