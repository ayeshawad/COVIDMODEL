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
p_monocyte_knockout.M0 = 0; % Set initial monocyte count to zero for knockout
%p_monocyte_knockout.MR = 0;


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
%\section{Main Results}
\label{sec:results}
\begin{figure}
\centering 
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/viralLoad.png}
    %\caption{Viral Load Count}
    \label{fig:Viral_Load_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/UninfectedCells.png}
    %\caption{Uninfected Cells Count}
    \label{fig:uninfected_cells_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/InfectedCells.png}
    %\caption{Infected Cells Count}
    \label{fig:Infected_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/DeadCells.png}
    %\caption{Dead Cells Count}
    \label{fig:dead_cells_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/RMacs.png}
    %\caption{Alveolar Macrophages Count}
    \label{fig:alveolar_macs_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/InflamMacs.png}
    %\caption{Inflammatory Macrophages Count}
    \label{fig:inflammatory_macs_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/tCells.png}
    %\caption{CD8+ T Cell Count}
    \label{fig:cd8_t_cells_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/neutrophils.png}
    %\caption{Neutrophils Count}
    \label{fig:Neutrophils_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/monocytes.png}
    %\caption{Monocytes Count}
    \label{fig:monocytes_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/NK.png}
    %\caption{Natural Killer Cells Count}
    \label{fig:nk_cells_Results}
\end{subfigure}
\hfill
        \begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/I_killedByNK.png}
    %\caption{Infected Killed By Natural Killer Cells Count}
    \label{fig:infected_killed_by_nk_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/BoundGCSF.png}
    %\caption{Bound G-CSF Concentration}
    \label{fig:bound_G_CSF_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/BoundType_I_IFN.png}
    %\caption{Bound IFN Concentration}
    \label{fig:bound_IFN_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/BoundTNFAlpha.png}
   % \caption{Bound TNF-${\alpha}$ Concentration}
    \label{fig:bound_tnf_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/BoundIFNGamma.png}
   % \caption{Bound IFN-${\gamma}$ Concentration}
    \label{fig:bound_ifn_gamma_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/overleaf/BoundIL6.png}
    %\caption{Bound IL6 Concentration}
    \label{fig:bound_IL6_Results}
\end{subfigure}
\hfill
\begin{subfigure}{0.2\textwidth}
    \includegraphics[width=\textwidth]{Figures/images/mild_severe.png}
    \label{fig:mild_severe_caption}
\end{subfigure}
\hfillp_nk_knockout.K0 = 0; % Set initial NK cells count to zero for knockout
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
