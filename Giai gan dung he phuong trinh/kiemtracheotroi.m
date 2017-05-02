function check = kiemtracheotroi(A)
check = 1;
for i=1:length(A)
    s = 0;
    for j=1:length(A)
        if i~=j
            s = s + abs(A(i,j));
        end
    end
    if A(i,i) < s
        check = 0;
        break
    end
end
