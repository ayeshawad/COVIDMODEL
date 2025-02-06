function severe_cytokine_knockout_plotter(timeS, solS, solTNFK, solIFNK, solIL6K, solTNFIFNK, p)
    % Viral Load
    fig = figure;
    hold on;
    plot(timeS, 10.^(solS(1, :)), 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, 10.^(solTNFK(1, :)), '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, 10.^(solIFNK(1, :)), '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, 10.^(solIL6K(1, :)), '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, 10.^(solTNFIFNK(1, :)), '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Viral Load');
    ylabel('copies/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    xlim([0 20]);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_ViralLoad.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_ViralLoad.png');

    % Uninfected Cells
    fig = figure;
    hold on;
    plot(timeS, (solS(2, :) + solS(4, :)) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, (solTNFK(2, :) + solTNFK(4, :))* 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, (solIFNK(2, :) + solIFNK(4, :)) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, (solIL6K(2, :)+ solIL6K(4, :)) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, (solTNFIFNK(2, :)+ solTNFIFNK(4, :)) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Uninfected Cells');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UninfectedCells.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UninfectedCells.png');

    % Infected Cells
    fig = figure;
    hold on;
    plot(timeS, solS(3, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(3, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(3, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(3, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(3, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Infected Cells');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_InfectedCells.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_InfectedCells.png');

    %Dead Cells
    fig = figure;
    hold on;
    plot(timeS, solS(5, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(5, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(5, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(5, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(5, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Dead Cells');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_DeadCells.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_DeadCells.png');

    %Alveolar Macs
    fig = figure;
    hold on;
    plot(timeS, solS(6, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(6, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(6, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(6, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(6, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Alveolar Macrophages');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_AlveolarMacs.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_AlveolarMacs.png');

    %Inflammatory Macs
    fig = figure;
    hold on;
    plot(timeS, solS(7, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(7, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(7, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(7, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(7, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Inflammatory Macrophages');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_InflammatoryMacs.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_InflammatoryMacs.png');

    %Monocytes
    fig = figure;
    hold on;
    plot(timeS, solS(8, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(8, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(8, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(8, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(8, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Monocytes');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_Monocytes.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_Monocytes.png');

    %Neutrophils
    fig = figure;
    hold on;
    plot(timeS, solS(9, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(9, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(9, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(9, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(9, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Neutrophils');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_Neutrophils.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_Neutrophils.png');

    %CD8+ Tcells
    fig = figure;
    hold on;
    plot(timeS, solS(10, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(10, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(10, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(10, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(10, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('CD8+ T Cells');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_Tcells.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_Tcells.png');

    %Unbound IL-6
    fig = figure;
    hold on;
    plot(timeS, solS(11, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(11, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(11, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(11, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(11, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Unbound IL-6');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundIL6.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundIL6.png');

    %Bound IL6
    fig = figure;
    hold on;
    plot(timeS, solS(12, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(12, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(12, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(12, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(12, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Bound IL-6');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundIL6.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundIL6.png');
    
    %Unbound GM-CSF
    fig = figure;
    hold on;
    plot(timeS, solS(13, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(13, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(13, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(13, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(13, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Unbound GM-CSF');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundGMCSF.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundGMCSF.png');

    %Bound GM-CSF
    fig = figure;
    hold on;
    plot(timeS, solS(14, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(14, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(14, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(14, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(14, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Infected Cells');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundGMCSF.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundGMCSF.png');

    %Unbound G-CSF
    fig = figure;
    hold on;
    plot(timeS, solS(15, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(15, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(15, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(15, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(15, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Unbound G-CSF');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundGCSF.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundGCSF.png');

    %Bound G-CSF
    fig = figure;
    hold on;
    plot(timeS, solS(16, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(16, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(16, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(16, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(16, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Bound G-CSF');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundGCSF.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundGCSF.png');

    %Unbound Type I IFN
    fig = figure;
    hold on;
    plot(timeS, solS(17, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(17, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(17, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(17, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(17, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Unbound Type I IFN');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundTypeI.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundTypeI.png');

    %Bound Type I IFN
    fig = figure;
    hold on;
    plot(timeS, solS(18, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(18, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(18, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(18, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(18, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Bound Type I IFN');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundTypeI.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundTypeI.png');

    %NK cells
    fig = figure;
    hold on;
    plot(timeS, solS(19, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(19, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(19, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(19, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(3, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('NK cells');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_SevereCytokine_Knockout_NKCells.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_NKCells.png');

    %Infected cells killed by NK
    fig = figure;
    hold on;
    plot(timeS, solS(24, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(24, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(24, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(24, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(24, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Infected Cells killed by NK');
    ylabel('cells/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_InfectedCellsKilledByNK.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_InfectedCellsKilledByNK.png');

    %Unbound IFN-gamma
    fig = figure;
    hold on;
    plot(timeS, solS(20, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(20, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(20, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(20, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(20, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Unbound IFN-gamma');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundIFNGamma.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundIFNGamma.png');

    %Bound IFN-gamma
    fig = figure;
    hold on;
    plot(timeS, solS(21, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(21, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(21, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(21, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(21, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Bound IFN-Gamma');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundIFNGamma.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundIFNGamma.png');

    %Unbound TNF-alpha
    fig = figure;
    hold on;
    plot(timeS, solS(22, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(22, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(22, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(22, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(22, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Unbound TNF-alpha');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundTNFAlpha.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_UnboundTNFAlpha.png');

    %Bound TNF-alpha
    fig = figure;
    hold on;
    plot(timeS, solS(23, :) * 1e9, 'Color', [32 52 79]/255, 'LineWidth', 3, 'DisplayName', 'Severe Case');
    plot(timeS, solTNFK(23, :) * 1e9, '--', 'Color', [255 0 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha Knockout');
    plot(timeS, solIFNK(23, :) * 1e9, '--', 'Color', [0 0 255]/255, 'LineWidth', 3, 'DisplayName', 'IFN-\gamma Knockout');
    plot(timeS, solIL6K(23, :) * 1e9, '--', 'Color', [0 100 0]/255, 'LineWidth', 3, 'DisplayName', 'IL-6 Knockout');
    plot(timeS, solTNFIFNK(23, :) * 1e9, '--', 'Color', [255 165 0]/255, 'LineWidth', 3, 'DisplayName', 'TNF-\alpha + IFN-\gamma Knockout');
    set(gca, 'yscale', 'log');
    title('Bound TNF-alpha');
    ylabel('pg/ml');
    xlabel('Time (days)');
    legend;
    set(gca, 'FontSize', 24);
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundTNFAlpha.fig');
    saveas(fig, 'Fig_Severe_Cytokine_Knockout_BoundTNFAlpha.png');

end
