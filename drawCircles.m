function [h,count] = drawCircles(img, centers, radii,pos,count)
    % Input: img - Original image; [centers, radii] - centers and radii of peaks detected
    close all;
    figure('visible','off'), imshow(img),hold on;
    for i = 1 : size(centers, 1)
        rad = radii(i);
        xCenter = centers(i, 2);
        yCenter = centers(i, 1);
        theta = linspace(0, 2 * pi, 360);
        xx = xCenter + rad * cos(theta);
        yy = yCenter + rad * sin(theta);
        mem = find(ismember(horzcat(int16(yCenter + 1.5 * rad),int16(xCenter)),pos,'rows'));
        if length(mem) > 0
           count = 1;
        end
        plot(xx, yy,'g', 'LineWidth', 2);
    end
    hold off;
    axis tight;
    imm = getframe(gcf);
    h = frame2im(imm);
end