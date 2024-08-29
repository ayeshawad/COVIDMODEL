%simulating full model

format long

p = load_parameters();
p = Homeostasis_calculations(p);

%-----------------------------------------------------------------------
estimated_params = [p.p_L_M  p.L_B_star  p.MPhi_I_star  p.p_L_MPhi  p.eta_G_MPhi  p.p_G_MPhi_I  p.T_prod_star p.T_M_prod_star p.p_G_M  p.M_prod_star p.N_prod_star p.eta_F_MPhi p.K_prod_star];

if isempty(find(estimated_params<0))==0
    disp('Negative parameter')
elseif isempty(find(estimated_params>1e9))==0
    disp('Extremely large parameter')
end
%----------------------------------------------------------------------

%% SIMULATING MODEL WITH VIRUS
tspan = [0 30];

[timeM,solM] = COVID_IMMUNE_MODEL(p,tspan);

%Parameters for severe dynamics
p.p_F_I = 0.002;
p.eta_F_MPhi = 1e-4*2;
p.p_M_I = 2*0.6;
p.eps_K_L = 2.102 * 10^-6;
p.p_Gamma_T = 30;
  
[timeS,solS] = COVID_IMMUNE_MODEL(p,tspan);

time_deval = linspace(tspan(1),tspan(2),1e3);
solM_deval = interp1(timeM,solM',time_deval);
solS_deval = interp1(timeS,solS',time_deval);

mild_vs_severe_plotter_single_variable(time_deval,solM_deval',time_deval,solS_deval',p);
