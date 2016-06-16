%Funcao cria arquivo com os valores do vetor dado
%xe -> Vetor de entrada;
%n_b -> numero de bits de cada;
%address -> endereco de escrita.
function write_file(xe,n_b,address)

s = size(xe);

%% Da um offset de 2^n_b para valores negativos
for i = 1 : s(2)
    if (xe(1,i) >= 0)
        xe(1,i) = xe(1,i);
    else
        xe(1,i) = xe(1,i) + 2^n_b;
    end
end

%%Cria Arquivo no formato mif
fid = fopen(address, 'wt');

fprintf(fid, '-- ARQUIVO PARA INICIALIZACAO DE MEMORIA - POR FABRICIO SAGGIN\n');
fprintf(fid, '-- Memory Initialization File (.mif)\n\n');
fprintf(fid, 'WIDTH=%d;\n', n_b);
fprintf(fid, 'DEPTH=%d;\n\n', s(2));
fprintf(fid, 'ADDRESS_RADIX=HEX;\n');
fprintf(fid, 'DATA_RADIX=HEX;\n\n');
fprintf(fid, 'CONTENT BEGIN\n\n');

for i = 1 : s(2)
    fprintf(fid, '\t%03X\t:\t%04X;\n', i-1, xe(1,i));
end

% fprintf(fid, '\t[%03X..255]\t:\t%04X;\n',s(2), 0);
fprintf(fid, 'END;');

fclose(fid);