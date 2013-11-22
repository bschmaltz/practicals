%part A: get data
data = load('TIMS_data.mat');
data = data.data;

%part B: reshape data
datar = reshape(data, 7644, 50)';

%part C: find mean vector
mean_vector = mean(datar')';

%part D: compute covariance matrix
cov_matrix = cov(double(datar'));

%part E-F: find and sort eigenvalues and eigen vectors in descending order
[V D] = eig(cov_matrix);
eVal = zeros(1,size(D,1));
for i=1:size(D,1)
    eVal(i)=D(i,i);
end
eVal = sort(eVal,'descend');
D_Used = zeros(1,size(D,1));
eVec = zeros(size(V,1),size(V,2));
for i=1:size(D,1)
    for j=1:size(D,1)
        if(eVal(i)==D(j,j) & D_Used(j)==0)
            eVec(:,i) = V(:,j);
            D_Used(j)=1;
            break;
        end
    end
end

%part G: Find the repseentation of data in principal component space
mean_zero_data=bsxfun(@minus, mean_vector, double(datar));
y=eVec'*mean_zero_data;

%part H: reconstruct data from Hotelling transform
reconstructed=bsxfun(@plus, eVec*y, mean_vector);


%Part I:
%Printing the difference between the original and reconstructed matrix
%shows slight difference between the two.

%Part J:
first=reshape(y(1,:), 91, 84);
fifth=reshape(y(5,:), 91, 84);
tenth=reshape(y(10,:), 91, 84);
fifteenth=reshape(y(15,:), 91, 84);
twentieth=reshape(y(20, :), 91, 84);
fiftieth=reshape(y(50, :), 91, 84);
imagesc(first);
title('1st')
figure;
imagesc(fifth);
title('5th')
figure;
imagesc(tenth);
title('10th')
figure;
imagesc(fifteenth);
title('15th')
figure;
imagesc(twentieth);
title('20th')
figure;
imagesc(fiftieth);
title('50th')

%Part K:
%The components show different levels of varience between. This means that
%the 1st component would show the areas with the most significant
%relationship between the different data dimensions, and the 50th component
%would show the least significant.