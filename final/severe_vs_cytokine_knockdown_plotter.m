function severe_vs_cytokine_knockdown_plotter(timeS,solS,timeL,solL,timeA, solA, timeG, solG, timeAG, solAG)
%timeS is initial severe case
%timeA is tnf-alpha knockdown
%timeL is IL6 knockdown
%timeG is IFN-gamma knockdown
load('Human_viral_load_data.mat')
p.lag_s5 = 2;
p.lag_s6 = 2.79;
p.lag_s18 = 1.32;
p.lag_g1 = 1.27;
p.lag_g2 = 0.92;
p.lag_g5 = 1.32;
p.lag_g6 = 2.76;
p.lag_g7 = 2;
% Model curves -----------------------------------------------------------

%Viral Load
fig = figure;
hold on 
%l1 = plot(timeM, 10.^(solM(1,:)),'Color',[32 52 79]/255,'LineWidth',3);
l3 = plot(p.lag_s5+time_s5,10.^(viral_load_s5),'o','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(p.lag_s6+time_s6,10.^(viral_load_s6),'o','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(p.lag_s18+time_s18,10.^(viral_load_s18),'o','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(p.lag_g1+time_g1,10.^(viral_load_g1),'o','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(p.lag_g2+time_g2,10.^(viral_load_g2),'o','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(p.lag_g5+time_g5,10.^(viral_load_g5),'o','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(p.lag_g6+time_g6,10.^(viral_load_g6),'o','Color',[0.5 0.5 0.5],'LineWidth',1)
plot(p.lag_g7+time_g7,10.^(viral_load_g7),'o','Color',[0.5 0.5 0.5],'LineWidth',1)
%plot normal severe...red
l3 = plot(timeS, 10.^(solS(1,:)),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, 10.^(solL(1,:)),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, 10.^(solA(1,:)),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, 10.^(solG(1,:)),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%plot both IFN-gamma and TNF-alpha knockdown...black
%plot(timeAG, 10.^(solAG(1,:)),'--','Color',[0,0,0],'LineWidth',3);
set(gca,'yscale','log')
title('Viral load')
ylabel('copies/ml')
%legend([l1 l2 l3], {'V(t) (mild)','Data','V(t) (severe)'})
set(gca,'Fontsize',24)
xlabel('Time (days)')
xlim([0 20])
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_ViralLoad.fig');
saveas(gcf,'CytokineKnockdown_ViralLoad.png');


%Uninfected cells
fig = figure;
hold on 
%l4 = plot(timeM, (solM(2,:) +solM(4,:)) * 1e9,'Color',[32 52 79]/255,'LineWidth',3);
%l5 = plot(timeS, (solS(2,:) +solS(4,:)) * 1e9,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, (solS(2,:) +solS(4,:)) * 1e9,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, (solL(2,:) +solL(4,:)) * 1e9,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, (solA(2,:) +solA(4,:)) * 1e9,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, (solG(2,:) +solG(4,:)) * 1e9,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%plot both IFN-gamma and TNF-alpha knockdown...black
%plot(timeAG, (solAG(2,:) +solAG(4,:)) * 1e9,'Color',[0,0,0],'LineWidth',3);
set(gca,'yscale','log')
ylabel('cells/ml')
title('Uninfected cells')
%legend([l1 l2 l3 l4 l5], {'V(t) (mild)','Data','V(t) (severe)','S(t)+R(t) (mild)','S(t)+R(t) (severe)'})
set(gca,'Fontsize',24)
%set(gca,'yTick',[1e5 1e6 1e7 1e8])
xlabel('Time (days)')
xlim([0 20])
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_UninfectedCells.fig');
saveas(gcf,'CytokineKnockdown_UninfectedCells.png');

 
%dead cells
fig = figure;
hold on 
%plot(timeM, solM(3,:)*1e9,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(3,:)*1e9,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(3,:)*1e9,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(3,:)*1e9,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(3,:)*1e9,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(3,:)*1e9,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA knockdown..black
%plot(timeAG, solAG(3,:)*1e9,'Color',[0,0,0],'LineWidth',3);
ylabel('cells/ml')
title('Infected cells')
set(gca,'yscale','log')
set(gca,'Fontsize',24)
xlabel('Time (days)')
set(gca,'yTick',[1e5 1e6 1e7 1e8])
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_InfectedCells.fig');
saveas(gcf,'CytokineKnockdown_InfectedCells.png');


fig = figure
hold on 
%plot(timeM, solM(5,:)*1e9,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(5,:)*1e9,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(5,:)*1e9,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(5,:)*1e9,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(5,:)*1e9,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(5,:)*1e9,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(5,:)*1e9,'Color',[0,0,0],'LineWidth',3);
set(gca,'yscale','log')
ylabel('cells/ml')
title('Dead cells')
%legend('I(t) (mild)','I(t) (severe)','D(t) (mild)','D(t) (severe)')
set(gca,'Fontsize',24)
xlabel('Time (days)')
set(gca,'yTick',[1E4 1e5 1e6 1e7 1e8])
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_DeadCells.fig');
saveas(gcf,'CytokineKnockdown_DeadCells.png');


%macs cells
fig = figure;
hold on 
%plot(timeM, solM(6,:)*1e9,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(6,:)*1e9,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(6,:)*1e9,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(6,:)*1e9,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(6,:)*1e9,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(6,:)*1e9,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNGFA
%plot(timeAG, solAG(6,:)*1e9,'Color',[0,0,0],'LineWidth',3);
ylabel('cells/ml')
title('Alveolar macs')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_AlveolarMacs.fig');
saveas(gcf,'CytokineKnockdown_AlveolarMacs.png');


figure
hold on
%plot(timeM, solM(7,:)*1e9,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(7,:)*1e9,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(7,:)*1e9,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(7,:)*1e9,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(7,:)*1e9,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(7,:)*1e9,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(7,:)*1e9,'Color',[0,0,0],'LineWidth',3);
set(gca,'yscale','log')
ylabel('cells/ml')
title('Inflammatory macs')
%legend('M_{\Phi R}(t) (mild)','M_{\Phi R}(t) (severe)','M_{\Phi I}(t) (mild)','M_{\Phi I}(t) (severe)')
set(gca,'Fontsize',24)
set(gca,'yTick',[1E1 1e2 1e3 1e4 1e5])
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_InflamMacs.fig');
saveas(gcf,'CytokineKnockdown_InflamMacs.png');


%monocytes cells
fig = figure;
hold on 
%plot(timeM, solM(8,:)*1e9,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(8,:)*1e9,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(8,:)*1e9,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(8,:)*1e9,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(8,:)*1e9,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(8,:)*1e9,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(8,:)*1e9,'Color',[0,0,0],'LineWidth',3);
ylabel('cells/ml')
title('Monocytes')
set(gca,'yscale','log')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_Monocytes.fig');
saveas(gcf,'CytokineKnockdown_Monocytes.png');


figure
hold on 
%plot(timeM, solM(9,:)*1e9,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(9,:)*1e9,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(9,:)*1e9,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(9,:)*1e9,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(9,:)*1e9,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(9,:)*1e9,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(9,:)*1e9,'Color',[0,0,0],'LineWidth',3);
set(gca,'yscale','log')
title('Neutrophils')
set(gca,'Fontsize',24)
ylabel('cells/ml');
xlabel('Time (days)');
set(gca, 'FontSize', 24);
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_Neutrophils.fig');
saveas(gcf,'CytokineKnockdown_Neutrophils.png');




%T cells
fig = figure;
hold on 
%yyaxis left
%plot(timeM, solM(10,:)*1e9,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(10,:)*1e9,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(10,:)*1e9,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(10,:)*1e9,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(10,:)*1e9,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(10,:)*1e9,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(10,:)*1e9,'Color',[0,0,0],'LineWidth',3);
ylabel('cells/ml')
title('CD8^+ T cells')
%yyaxis right
%plot(timeM,1./(1+solM(12,:)./p.eps_L_T),'Color',[230,97,1]/255,'LineWidth',2)
%plot(timeS,1./(1+solS(12,:)./p.eps_L_T),'Color',[230,97,13]/255,'LineWidth',2)
%ylabel('IL-6 anti-inflam effect, 1/(1+L_B/\epsilon_{L,T})')
%legend('T(t) (mild)','T(t) (severe)')%,'IL-6 anti-inflam curve (mild)','IL-6 anti-inflam curve (severe)')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_Tcells.fig');
saveas(gcf,'CytokineKnockdown_Tcells.png');


%IL-6
fig = figure;
hold on 
%plot(timeM, solM(11,:),'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(11,:),'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(11,:),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(11,:),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(11,:),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(11,:),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(11,:),'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Unbound IL-6')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_UnboundIL6.fig');
saveas(gcf,'CytokineKnockdown_UnboundIL6.png');


figure
hold on 
%plot(timeM, solM(12,:),'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(12,:),'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(12,:),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(12,:),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(12,:),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(12,:),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(12,:),'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Bound IL-6')
%legend('L_U(t) (mild)','L_U(t) (severe)','L_B(t) (mild)','L_B(t) (severe)')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_BoundIL6.fig');
saveas(gcf,'CytokineKnockdown_BoundIL6.png');



% GM-CSF 
fig = figure;
hold on 
%plot(timeM, solM(13,:),'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(13,:),'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(13,:),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(13,:),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(13,:),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(13,:),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(13,:),'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Unbound GM-CSF')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_UnboundGMCSF.fig');
saveas(gcf,'CytokineKnockdown_UnboundGMCSF.png');



figure
hold on
%plot(timeM, solM(14,:),'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(14,:),'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(14,:),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(14,:),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(14,:),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(14,:),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(14,:),'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Bound GM-CSF')
%legend('G_U(t) (mild)','G_U(t) (severe)','G_B(t) (mild)','G_B(t) (severe)')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_BoundGMCSF.fig');
saveas(gcf,'CytokineKnockdown_BoundGMCSF.png');



% G-CSF cells
fig = figure;
hold on 
%plot(timeM, solM(15,:)*1000,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(15,:)*1000,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(15,:)*1000,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(15,:)*1000,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(15,:)*1000,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(15,:)*1000,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(15,:)*1000,'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Unbound G-CSF')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_UnboundGCSF.fig');
saveas(gcf,'CytokineKnockdown_UnboundGCSF.png');


figure
hold on
%plot(timeM, solM(16,:)*1000,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(16,:)*1000,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(16,:)*1000,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(16,:)*1000,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(16,:)*1000,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(16,:)*1000,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(16,:)*1000,'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Bound G-CSF')
%legend('C_U(t) (mild)','C_U(t) (severe)','C_B(t) (mild)','C_B(t) (severe)')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_BoundGCSF.fig');
saveas(gcf,'CytokineKnockdown_BoundGCSF.png');



% IFN cells
fig = figure;
hold on 
%plot(timeM, solM(17,:),'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(17,:),'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(17,:),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(17,:),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(17,:),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(17,:),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(17,:),'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Unbound IFN ')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_UnboundIFN.fig');
saveas(gcf,'CytokineKnockdown_UnboundIFN.png');



figure
hold on
%plot(timeM, solM(18,:),'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(18,:),'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(18,:),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(18,:),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(18,:),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(18,:),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(18,:),'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Bound IFN ')
%legend('F_U(t) (mild)','F_U(t) (severe)','F_B(t) (mild)','F_B(t) (severe)')
%legend('Mild disease','Severe disease')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_BoundIFN.fig');
saveas(gcf,'CytokineKnockdown_BoundIFN.png');


%NK cells
figure
hold on 
%plot(timeM, solM(19,:)*1e9,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(19,:)*1e9,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(19,:)*1e9,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(19,:)*1e9,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(19,:)*1e9,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(19,:)*1e9,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(19,:)*1e9,'Color',[0,0,0],'LineWidth',3);
ylabel('cells/ml')
title('NK cells')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_NK.fig');
saveas(gcf,'CytokineKnockdown_NK.png');


figure
hold on
%plot(timeM, solM(24,:)*1e9,'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(24,:)*1e9,'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(24,:)*1e9,'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(24,:)*1e9,'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(24,:)*1e9,'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(24,:)*1e9,'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(24,:)*1e9,'Color',[0,0,0],'LineWidth',3);
ylabel('cells/mL')
title('Infected Cells Killed by NK')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_IKilledByNK.fig');
saveas(gcf,'CytokineKnockdown_IKilledbyNK.png');


% IFN-Gamma 
fig = figure;
hold on 
%plot(timeM, solM(20,:),'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(20,:),'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(20,:),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(20,:),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(20,:),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(20,:),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(20,:),'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Unbound IFN-Gamma ')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_UnboundIFNG.fig');
saveas(gcf,'CytokineKnockdown_UnboundIFNG.png');


figure
hold on
%plot(timeM, solM(21,:),'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(21,:),'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(21,:),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(21,:),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(21,:),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(21,:),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(21,:),'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Bound IFN-Gamma ')
%legend('Gamma_U(t) (mild)','Gamma_U(t) (severe)','Gamma_B(t) (mild)','Gamma_B(t) (severe)')
%legend('Mild disease','Severe disease')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_BoundIFNG.fig');
saveas(gcf,'CytokineKnockdown_BoundIFNG.png');


% TNF Alpha 
fig = figure;
hold on 
%plot(timeM, solM(22,:),'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(22,:),'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(22,:),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(22,:),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(22,:),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(22,:),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA 
%plot(timeAG, solAG(22,:),'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Unbound TNF-Alpha ')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_UnboundTNF.fig');
saveas(gcf,'CytokineKnockdown_UnboundTNF.png');


figure
hold on
%plot(timeM, solM(23,:),'Color',[32 52 79]/255,'LineWidth',3);
%plot(timeS, solS(23,:),'--','Color',[233 150 156]/255,'LineWidth',3);
%plot normal severe...red
plot(timeS, solS(23,:),'Color',[233 150 156]/255,'LineWidth',3);
% plot IL-6 knockdown...blue
plot(timeL, solL(23,:),'--','Color',[32 52 79]/255,'LineWidth',3);
%plot TNF-alpha knockdown...dark green
plot(timeA, solA(23,:),'--','Color',[0.4660 0.6740 0.1880],'LineWidth',3);
%plot IFN-gamma knockdown... dark purple
plot(timeG, solG(23,:),'--','Color',[0.4940 0.1840 0.5560],'LineWidth',3);
%IFNG and TNFA
%plot(timeAG, solAG(23,:),'Color',[0,0,0],'LineWidth',3);
ylabel('pg/ml')
title('Bound TNF-Alpha ')
%legend('alpha_U(t) (mild)','alpha_U(t) (severe)','alpha_B(t) (mild)','alpha_B(t) (severe)')
%legend('Mild disease','Severe disease')
set(gca,'Fontsize',24)
xlabel('Time (days)')
legend({'Severe Case', 'IL-6 Knockdown', 'TNF-alpha Knockdown', 'IFN-gamma Knockdown'}, 'Location', 'best');
saveas(gcf,'CytokineKnockdown_BoundTNFAlpha.fig');
saveas(gcf,'CytokineKnockdown_BoundTNFAlpha.png');


%{
% Save Resistant cells data to a .mat file
rMild = solM(4,:);
rSevere = solS(4,:);
save('resistantMild.mat', 'timeM', 'rMild');
save('resistantSevere.mat', 'timeS', 'rSevere');

% Combine the data into a matrix
dataMatrix1 = [timeM', rMild'];
dataMatrix2 = [timeS', rSevere'];

% Save the matrix to a .csv file
csvwrite('resistantMild.csv', dataMatrix1);
csvwrite('resistantSevere.csv', dataMatrix2);

%Save Susceptible Cells
sMild = solM(2,:);
sSevere = solS(2,:);
save('susceptibleMild.mat', 'timeM', 'sMild');
save('susceptibleSevere.mat', 'timeS', 'sSevere');

% Combine the data into a matrix
dataMatrix3 = [timeM', sMild'];
dataMatrix4 = [timeS', sSevere'];

% Save the matrix to a .csv file
csvwrite('susceptibleMild.csv', dataMatrix3);
csvwrite('susceptibleSevere.csv', dataMatrix4);

%Save neutrophils
nMild = solM(9,:);
nSevere = solS(9,:);
save('neutrophilsMild.mat', 'timeM', 'nMild');
save('neutrophilsSevere.mat', 'timeS', 'nSevere');

% Combine the data into a matrix
dataMatrix5 = [timeM', sMild'];
dataMatrix6 = [timeS', sSevere'];

% Save the matrix to a .csv file
csvwrite('neutrophilsMild.csv', dataMatrix5);
csvwrite('neutrophilsSevere.csv', dataMatrix6);

save('MildData', 'timeM', 'solM');
save('SevereData', 'timeS', 'solS');

%}
end
