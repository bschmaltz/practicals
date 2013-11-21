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



%part H: reconstruct data from Hotelling transform



%Part I:
%Printing the difference between the original and reconstructed matrix
%shows slight difference between the two.



%Part J:

