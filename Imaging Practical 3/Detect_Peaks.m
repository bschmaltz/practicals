function Hough_Peaks = Detect_Peaks (Hough_Accum, R_range)
    xy_margin = 15;
    R_margin = 15; % Don't know why a minimum difference is important
    Npeaks = 15;
    
    Hough_Peaks = [];
    
    thres = max(Hough_Accum(:)) * 0.5;
    [h w d] = size(Hough_Accum);
    
    for i = 1:d
        layer = Hough_Accum(:,:,i)
        [~, ind] = findpeaks(layer(:), 'MINPEAKHEIGHT', thres, 'NPEAKS', Npeaks);
        [x y] = ind2sub([h w], ind);
        
        r = R_range(i) * ones(length(x),1);
        Hough_Peaks = [ Hough_Peaks;
                        x y r ];
    end
end

