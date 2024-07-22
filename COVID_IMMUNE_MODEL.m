function [time,sol] = COVID_IMMUNE_MODEL(p,tspan)

opts = ddeset('RelTol',1e-6,'AbsTol',1e-6,'MaxStep',1e-2);
solstruc = ddesd(@ddefun,@(t,y) delayP(t,y,p),@history,tspan, opts);

time = solstruc.x;
sol = solstruc.y;

%------------------------------------------------------------------------
function dydt = ddefun(t,y,Z)
ylag1 = Z(:,1);
ylag2 = Z(:,2);
    
V = y(1);
S = y(2);
I = y(3);
R = y(4);
D = y(5);
MPhi_R = y(6);
MPhi_I = y(7);
M = y(8);
N = y(9);
T = y(10);

L_U = y(11);
L_B = y(12);
G_U = y(13);
G_B = y(14);
C_U = y(15);
C_B = y(16);
F_U = y(17);
F_B = y(18);

K = y(19);
Gamma_U = y(20);
Gamma_B = y(21);
alpha_U = y(22);
alpha_B = y(23);

C_BF=C_B/(p.A_C*N);
   
dV = p.phat*I-p.del_V_MPhi*MPhi_I*V-p.del_V_N*V*N-p.d_V_spec*V;
dS = p.lam_S*(1-(S+I+D+R)/p.Smax)*S-p.beta*S*V-p.rho*p.del_N/(1+(p.IC_50_N/N)^p.h_N)*S;%-p.rho*p.del_N/(1+(p.IC_50_N/M)^p.h_N)*S-p.rho*p.del_N/(1+(0.009/MPhi_I)^p.h_N)*S;
dI = (p.beta/2)*((p.eps_F_I/(p.eps_F_I+F_B))+(p.eps_Gamma_I/(p.eps_Gamma_I+Gamma_B)))*ylag1(2)*ylag1(1)-p.d_I*I-p.del_N/(1+(p.IC_50_N/N).^p.h_N)*I-p.del_I_MPhi*MPhi_I*I-p.del_I_T*T*I- (((p.del_I_K * I * K)/(K + p.eps_I_K))* (p.eps_K_L / (p.eps_K_L + L_B)));   
dR = p.lam_S*(1-(S+I+D+R)/p.Smax)*R+(p.beta/2)*((p.eps_F_I/(p.eps_F_I+F_B))+(p.eps_Gamma_I/(p.eps_Gamma_I+Gamma_B)))*ylag1(2)*ylag1(1)-p.rho*p.del_N/(1+(p.IC_50_N*2/N)^p.h_N)*R+p.lam_S*(1-(S+I+D+R)/p.Smax)*R;
dD = p.d_I*I+p.del_N*I/(1+(p.IC_50_N/N)^p.h_N)+p.del_N*p.rho*S/(1+(p.IC_50_N/N)^p.h_N)+p.del_I_MPhi*MPhi_I*I+p.del_I_T*T*I-p.d_D*D-p.del_D_MPhi*D*(MPhi_R+MPhi_I)+p.del_MPhi_D*D*(MPhi_I)+p.del_N*p.rho/(1+(p.IC_50_N/N)^p.h_N)*R +  (((p.del_I_K * I * K)/(K + p.eps_I_K))* (p.eps_K_L / (p.eps_K_L + L_B)))+ (p.del_MPhi*alpha_B*Gamma_B*MPhi_I)/(alpha_B*Gamma_B+p.eps_Gamma_alpha);%+p.rho*p.del_N/(1+(p.IC_50_N/M)^p.h_N)*S+p.rho*p.del_N/(1+(0.009/MPhi_I)^p.h_N)*S;%close+p.d_M*M+p.d_N*N+p.d_T*T;

dMPhi_R = -p.a_I_MPhi*MPhi_R*(I+D)-p.del_MPhi_D*D*MPhi_R+(1-MPhi_R/p.MPhi_max)*p.lam_MPhi*MPhi_I/(V+p.eps_V_MPhi);
dMPhi_I = p.a_I_MPhi*MPhi_R*(I+D)+p.p_MPhi_I_G*G_B^p.h_M_MPhi/(G_B^p.h_M_MPhi+p.eps_G_MPhi^p.h_M_MPhi)*M+p.p_MPhi_I_L*L_B/(L_B+p.eps_L_MPhi)*M*(p.eps_alpha_MPhi^(p.h_MPhi_alpha)/(p.eps_alpha_MPhi^(p.h_MPhi_alpha)+alpha_B^(p.h_MPhi_alpha)))-p.d_MPhi_I*MPhi_I-p.del_MPhi_D*MPhi_I*D-(1-MPhi_R/p.MPhi_max)*p.lam_MPhi*MPhi_I/(V+p.eps_V_MPhi)-(p.del_MPhi*alpha_B*Gamma_B*MPhi_I)/(alpha_B*Gamma_B+p.eps_Gamma_alpha);%-p.del_I_T*T*MPhi_I*100;%-p.del_MPhi_D*MPhi_I*T;    
dM = (p.M_prod_star+(p.psi_M_max-p.M_prod_star)*G_B^p.h_M/(G_B^p.h_M+p.eps_G_M^p.h_M))*p.MR+p.p_M_I*I*M/(I+p.eps_I_M)-p.p_MPhi_I_G*G_B^p.h_M_MPhi*M/(G_B^p.h_M_MPhi+p.eps_G_MPhi^p.h_M_MPhi)-p.p_MPhi_I_L*L_B/(L_B+p.eps_L_MPhi)*M*(p.eps_alpha_MPhi^(p.h_MPhi_alpha)/(p.eps_alpha_MPhi^(p.h_MPhi_alpha)+alpha_B^(p.h_MPhi_alpha)))-p.d_M*M;
dN = (p.N_prod_star+(p.psi_N_max-p.N_prod_star)*(C_BF-p.C_BF_star)/(C_BF-p.C_BF_star+p.eps_C_N))*p.NR+p.p_N_L*L_B/(L_B+p.eps_L_N)-p.d_N*N;
dT = p.p_T_I*ylag2(3)/(1+L_B/p.eps_L_T)+p.p_T_Gamma*Gamma_B/(Gamma_B+p.eps_Gamma_T)*T-p.d_T*T - (((p.del_T_K * T * K)/(K + p.eps_T_K))* (p.eps_K_L / (p.eps_K_L + L_B)));

dL_U = p.p_L_I*I/(I+p.eta_L_I)+p.p_L_MPhi*MPhi_I/(MPhi_I+p.eta_L_MPhi)+p.p_L_M*M/(M+p.eta_L_M)-p.k_lin_L*L_U-p.k_B_L*((N+T+M)*p.A_L-L_B)*L_U+p.k_U_L*L_B;
dL_B = -p.k_int_L*L_B+p.k_B_L*((N+T+M)*p.A_L-L_B)*L_U-p.k_U_L*L_B;
dG_U = p.p_G_MPhi_I*MPhi_I/(MPhi_I+p.eta_G_MPhi)+p.p_G_M*M/(M+p.eta_G_M)-p.k_lin_G*G_U-p.k_B_G*(M*p.A_G-G_B)*G_U+p.k_U_G*G_B;
dG_B = -p.k_int_G*G_B+p.k_B_G*(M*p.A_G-G_B)*G_U-p.k_U_G*G_B;
dC_U = p.p_C_M*M/(M+p.eta_C_M)-p.k_lin_C*C_U-p.k_B_C*(N*p.A_C-C_B)*C_U^p.stoch_C+p.k_U_C*C_B;
dC_B = -p.k_int_C*C_B+p.k_B_C*(N*p.A_C-C_B)*C_U^p.stoch_C-p.k_U_C*C_B;
dF_U = p.p_F_I*I/(I+p.eta_F_I)+p.p_F_MPhi*MPhi_I/(MPhi_I+p.eta_F_MPhi)+p.p_F_M*M/(M+p.eta_F_M)-p.k_lin_F*F_U-p.k_B_F*((T+I)*p.A_F-F_B)*F_U+p.k_U_F*F_B;
dF_B = -p.k_int_F*F_B+p.k_B_F*((T+I)*p.A_F-F_B)*F_U-p.k_U_F*F_B;

dK =  (p.K_prod_star * p.KR)- (p.d_K * K) + ((p.p_K_A * alpha_B * K) / (alpha_B + p.eps_K_A)); 
dGamma_U = p.p_Gamma_T*T/(T+p.eta_Gamma_T)+p.p_Gamma_K*K/(K+p.eta_Gamma_K)-p.k_lin_Gamma*Gamma_U-p.k_B_Gamma*((I+T+MPhi_I)*p.A_Gamma-Gamma_B)*Gamma_U+p.k_U_Gamma*Gamma_B;
dGamma_B = -p.k_int_Gamma*Gamma_B+p.k_B_Gamma*((N+T+MPhi_I)*p.A_Gamma-Gamma_B)*Gamma_U-p.k_U_Gamma*Gamma_B;
dalpha_U = p.p_alpha_T*T/(T+p.eta_alpha_T)+p.p_alpha_MPhi*MPhi_I/(MPhi_I+p.eta_alpha_MPhi)+p.p_alpha_M*M/(M+p.eta_alpha_M)+p.p_alpha_K*K/(K+p.eta_alpha_K)-p.k_lin_alpha*alpha_U-p.k_B_alpha*((K+M+MPhi_I)*p.A_alpha-alpha_B)*alpha_U+p.k_U_alpha*alpha_B;
dalpha_B = -p.k_int_alpha*alpha_B+p.k_B_alpha*((K+M+MPhi_I)*p.A_alpha-alpha_B)*alpha_U-p.k_U_alpha*alpha_B;

dK_I_L = ((p.del_I_K * I * K)/(K + p.eps_I_K))* (p.eps_K_L / (p.eps_K_L + L_B));

dydt = [dV;dS;dI;dR;dD;dMPhi_R;dMPhi_I;dM;dN;dT;dL_U;dL_B;dG_U;dG_B;dC_U;dC_B;dF_U;dF_B;dK;dGamma_U;dGamma_B;dalpha_U;dalpha_B;dK_I_L];

end
%------------------------------------------------------------------------=
function s = history(t)
  s = [p.V0;p.S0;p.I0;p.R0;p.D0;p.MPhi_R_0;p.MPhi_I_0;p.M0;p.N0;p.T0;p.L_U_0;p.L_B_0;p.G_U_0;p.G_B_0;p.C_U_0;p.C_B_0;p.F_U_0;p.F_B_0;p.K0;p.Gamma_U_0;p.Gamma_B_0;p.alpha_U_0;p.alpha_B_0;p.I0];
end
function d = delayP(t,y,p)
%This function sets up the delay vectors necessary for the DDE solver.
d = [t-p.tau_I,t-p.tau_T];     
end
%-------------------------------------------------------------------------
end
