% New plotting function for multiple knockouts
function multi_knockout_plotter_single_variable(timeM, solM, solMonocyteK, solNeutrophilK, solMacrophageK, solNKK, p)
    % Load human viral load data for reference
    load('Human_viral_load_data.mat');
    
    % Viral Load
    fig = figure;
    hold on;
    plot(timeM, 10.^(solM(1, :)), 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, 10.^(solMonocyteK(1, :)), '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, 10.^(solNeutrophilK(1, :)), '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, 10.^(solMacrophageK(1, :)), '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, 10.^(solNKK(1, :)), '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    set(gca, 'yscale', 'log');
    title('Viral Load');
    ylabel('copies/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    xlim([0 20]);
    saveas(fig, 'Fig_Multi_Knockout_ViralLoad.fig');
    saveas(fig, 'Fig_Multi_Knockout_ViralLoad.png');

    % Uninfected Cells
    fig = figure;
    hold on;
    plot(timeM, (solM(2, :) + solM(4, :)) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, (solMonocyteK(2, :) + solMonocyteK(4, :)) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, (solNeutrophilK(2, :) + solNeutrophilK(4, :)) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, (solMacrophageK(2, :) + solMacrophageK(4, :)) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, (solNKK(2, :) + solNKK(4, :)) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    set(gca, 'yscale', 'log');
    title('Uninfected Cells');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_UninfectedCells.fig');
    saveas(fig, 'Fig_Multi_Knockout_UninfectedCells.png');

    % Infected Cells
    fig = figure;
    hold on;
    plot(timeM, (solM(3, :)) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, (solMonocyteK(3, :) + solMonocyteK(4, :)) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, (solNeutrophilK(3, :) + solNeutrophilK(4, :)) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, (solMacrophageK(3, :) + solMacrophageK(4, :)) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, (solNKK(3, :)) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    set(gca, 'yscale', 'log');
    title('Infected Cells');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_UninfectedCells.fig');
    saveas(fig, 'Fig_Multi_Knockout_UninfectedCells.png');

    % Dead Cells
    fig = figure;
    hold on;
    plot(timeM, solM(5, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(5, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(5, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(5, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(5, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    set(gca, 'yscale', 'log');
    title('Dead Cells');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_DeadCells.fig');
    saveas(fig, 'Fig_Multi_Knockout_DeadCells.png');

    % Alveolar Macs
    fig = figure;
    hold on;
    plot(timeM, solM(6, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(6, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(6, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(6, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(6, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    title('Alveolar Macs');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_AlveolarMacs.fig');
    saveas(fig, 'Fig_Multi_Knockout_AlveolarMacs.png');

    % Inflammatory Macs
    fig = figure;
    hold on;
    plot(timeM, solM(7, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(7, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(7, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(7, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(7, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    set(gca, 'yscale', 'log');
    title('Inflammatory Macs');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_InflammatoryMacs.fig');
    saveas(fig, 'Fig_Multi_Knockout_InflammatoryMacs.png');

    % Monocytes
    fig = figure;
    hold on;
    plot(timeM, solM(8, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(8, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(8, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(8, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(8, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    set(gca, 'yscale', 'log');
    title('Monocytes');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_Monocytes.fig');
    saveas(fig, 'Fig_Multi_Knockout_Monocytes.png');

    % Neutrophils
    fig = figure;
    hold on;
    plot(timeM, solM(9, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(9, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(9, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(9, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(9, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    set(gca, 'yscale', 'log');
    title('Neutrophils');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_Neutrophils.fig');
    saveas(fig, 'Fig_Multi_Knockout_Neutrophils.png');

    % CD8+ T Cells
    fig = figure;
    hold on;
    plot(timeM, solM(10, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(10, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(10, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(10, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(10, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('cells/ml');
    title('CD8^+ T Cells');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_CD8TCells.fig');
    saveas(fig, 'Fig_Multi_Knockout_CD8TCells.png');

     % Unbound IL-6
    fig = figure;
    hold on;
    plot(timeM, solM(11, :), 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(11, :), '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(11, :), '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(11, :), '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(11, :), '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Unbound IL-6');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_UnboundIL6.fig');
    saveas(fig, 'Fig_Multi_Knockout_UnboundIL6.png');

    % Bound IL-6
    fig = figure;
    hold on;
    plot(timeM, solM(12, :), 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(12, :), '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(12, :), '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(12, :), '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(12, :), '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Bound IL-6');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_BoundIL6.fig');
    saveas(fig, 'Fig_Multi_Knockout_BoundIL6.png');

    % Unbound GM-CSF
    fig = figure;
    hold on;
    plot(timeM, solM(13, :), 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(13, :), '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(13, :), '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(13, :), '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(13, :), '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Unbound GM-CSF');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_UnboundGMCSF.fig');
    saveas(fig, 'Fig_Multi_Knockout_UnboundGMCSF.png');

    % Bound GM-CSF
    fig = figure;
    hold on;
    plot(timeM, solM(14, :), 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(14, :), '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(14, :), '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(14, :), '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(14, :), '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Bound GM-CSF');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_BoundGMCSF.fig');
    saveas(fig, 'Fig_Multi_Knockout_BoundGMCSF.png');



    % Unbound G-CSF
    fig = figure;
    hold on;
    plot(timeM, solM(15, :), 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(15, :), '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(15, :), '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(15, :), '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(15, :), '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Unbound G-CSF');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_UnboundGCSF.fig');
    saveas(fig, 'Fig_Multi_Knockout_UnboundGCSF.png');

    % Bound G-CSF
    fig = figure;
    hold on;
    plot(timeM, solM(16, :), 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(16, :), '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(16, :), '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(16, :), '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(16, :), '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Bound G-CSF');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_BoundGCSF.fig');
    saveas(fig, 'Fig_Multi_Knockout_BoundGCSF.png');

    % Unbound Type I IFN
    fig = figure;
    hold on;
    plot(timeM, solM(17, :), 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(17, :), '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(17, :), '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(17, :), '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(17, :), '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Unbound Type I IFN');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_UnboundTypeIIFN.fig');
    saveas(fig, 'Fig_Multi_Knockout_UnboundTypeIIFN.png');

    % Bound Type I IFN
    fig = figure;
    hold on;
    plot(timeM, solM(18, :), 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(18, :), '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(18, :), '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(18, :), '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(18, :), '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Bound Type I IFN');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_BoundTypeIIFN.fig');
    saveas(fig, 'Fig_Multi_Knockout_BoundTypeIIFN.png');

    % NK Cells
    fig = figure;
    hold on;
    plot(timeM, solM(19, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(19, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(19, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(19, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(19, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('cells/ml');
    title('NK Cells');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_NKCells.fig');
    saveas(fig, 'Fig_Multi_Knockout_NKCells.png');

    % Infected Cells Killed by NK
    fig = figure;
    hold on;
    plot(timeM, solM(24, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(24, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(24, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(24, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(24, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('cells/ml');
    title('Infected Cells Killed by NK');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_InfectedCellsKilledByNK.fig');
    saveas(fig, 'Fig_Multi_Knockout_InfectedCellsKilledByNK.png');

    % Unbound IFN-Gamma
    fig = figure;
    hold on;
    plot(timeM, solM(20, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(20, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(20, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(20, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(20, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Unbound IFN-Gamma');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_UnboundIFNGamma.fig');
    saveas(fig, 'Fig_Multi_Knockout_UnboundIFNGamma.png');

    % Bound IFN-Gamma
    fig = figure;
    hold on;
    plot(timeM, solM(21, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(21, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(21, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(21, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(21, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Bound IFN-Gamma');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_BoundIFNGamma.fig');
    saveas(fig, 'Fig_Multi_Knockout_BoundIFNGamma.png');

    % Unbound TNF-ALpha
    fig = figure;
    hold on;
    plot(timeM, solM(22, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(22, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(22, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(22, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(22, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Unbound TNF-Alpha');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_UnboundTNF-Alpha.fig');
    saveas(fig, 'Fig_Multi_Knockout_UnboundTNF-Alpha.png');

    % Bound TNF-ALpha
    fig = figure;
    hold on;
    plot(timeM, solM(23, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Mild Case');
    plot(timeM, solMonocyteK(23, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'Monocyte Knockout');
    plot(timeM, solNeutrophilK(23, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'Neutrophil Knockout');
    plot(timeM, solMacrophageK(23, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'Macrophage Knockout');
    plot(timeM, solNKK(23, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'NK Cells Knockout');
    ylabel('pg/ml');
    title('Bound TNF-Alpha');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Multi_Knockout_BoundTNF-Alpha.fig');
    saveas(fig, 'Fig_Multi_Knockout_BoundTNF-Alpha.png');
    
    % Create legend with horizontal orientation
legendHandle = legend('show', 'Orientation', 'horizontal');

% Create a new figure for the legend
figureForLegend = figure;

% Copy the legend to the new figure
newLegend = copyobj(legendHandle, figureForLegend);

% Set the orientation of the new legend to horizontal
set(newLegend, 'Orientation', 'horizontal');

% Adjust the position of the legend in the new figure
set(newLegend, 'Units', 'normalized', 'Position', [0 0 1 1]);

% Save the legend as a .fig file
savefig(figureForLegend, 'Legend_Fig_Multi_Knockout.fig');

% Save the legend as a .png file
saveas(figureForLegend, 'Legend_Fig_Multi_Knockout.png');


end

