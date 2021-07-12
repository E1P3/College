close all
clear 

% Read in the picture
original = double(imread('greece.tif'));

% Read in the magic forcing function
load forcing;

% Read in the corrupted picture which contains holes
load badpicture;

% Read in an indicator picture which is 1 where the
% pixels are missing in badicture
mask = double(imread('badpixels.tif'));

% Please initialise your variables here (see the instructions for the specific variable names)
% Initialise your iterations here ....
restored = badpic; % initialise the restored pictures to be the badpicture to start with
restored2 = badpic;
restored20 = badpic;
restored20_2 = badpic;

total_iterations = 2000;
 
err = zeros(0,total_iterations);
err2 = zeros(0,total_iterations);

[missing_pel_row, missing_pel_col] = find(mask == 1);
num_missing_pixels = length(missing_pel_row);

difference = zeros(1,num_missing_pixels);

E = zeros(1, num_missing_pixels);

% This displays the original picture in Figure 1
figure(1);
image(original);
title('Original');
colormap(gray(256));

% Display the corrupted picture in Figure 2
% .....

figure(2);
image(badpic);
title('Corrupted');
colormap(gray(256));

for iteration = 1 : total_iterations,  
    for pel = 1 : num_missing_pixels,
        row = missing_pel_row(pel);
        col = missing_pel_col(pel);
        E(pel) = restored((row-1), col) + restored((row + 1), col) + restored(row , (col - 1)) + restored(row , (col + 1))  - 4*restored(row, col);
        restored(row,col) = restored(row,col) + (E(pel)/4);
        
        difference(pel) = original(row, col) - restored(row,col);
    end 
    
    err(iteration) = std(difference(:));
    
    if iteration == 20
        restored20 = restored; 
    end
    
end;

% Display the restored image in Figure 3 (This does NOT use the forcing function)
figure(3);
image(restored);
title('Restored Picture');
colormap(gray(256));

% Now repeat the restoration, again starting from the badpicture, but now use the forcing function in your update
for iteration = 1 : total_iterations,
    for pel = 1 : num_missing_pixels,
        row = missing_pel_row(pel);
        col = missing_pel_col(pel);
        E(pel) = restored2((row-1), col) + restored2((row + 1), col) + restored2(row , (col - 1)) + restored2(row , (col + 1)) - 4*restored2(row, col) - f(row, col);
        restored2(row,col) = restored2(row,col) + (E(pel)/4);
        
        difference(pel) = original(row, col) - restored2(row,col);
    end 
    
    err2(iteration) = std(difference(:));
    
    if iteration == 20
        restored20 = restored2; 
    end
    
end;

% Display your restored image with forcing function as Figure 4
figure(4);
image(restored2);
title('Restored Picture (with f)');
colormap(gray(256));
% And plot your two error vectors versus iteration

figure(5);
plot((1 : total_iterations), err, 'r-', (1 : total_iterations), err2, 'b-', 'linewidth', 3);
legend('No forcing function', 'With forcing function');
xlabel('Iteration', 'fontsize', 20);
ylabel('Std Error', 'fontsize', 20);


