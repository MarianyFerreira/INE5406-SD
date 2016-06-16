%Funcao cria arquivo pcm com os valores do vetor dado
%xe -> Vetor de entrada;
%address -> endereco de escrita.
function write_pcm_file(xe,address)

s = size(xe);

fid = fopen(address, 'wb');
fwrite(fid, xe, 'short');
fclose(fid);