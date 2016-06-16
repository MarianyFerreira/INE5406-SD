%Funcao cria arquivo com os valores do vetor dado
%xe -> Vetor de entrada;
%n_b -> numero de bits de cada;
%address -> endereco de escrita.
function write_Cfile(xe,n_b,address)

s = size(xe);

for i = 1 : s(2)
    if (xe(1,i) >= 0)
        xe(1,i) = xe(1,i);
    else
        xe(1,i) = xe(1,i) + 2^n_b;
    end
end

fid = fopen(address, 'wt');
for i = 1 : s(2)
    for b = (n_b-4):-4:4 
        if (2^b > xe(1,i))
            fprintf(fid, '0');
        end
    end
    fprintf(fid, '%X\n', xe(1,i));
end
fclose(fid);