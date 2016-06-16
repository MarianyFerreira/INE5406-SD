close all; clc; clear all;
fid= fopen('../Sweep_1sec.pcm', 'r');

bit = 16;
original = fread (fid,1 , 'short');
cont=0;
cont2=0;
while (feof(fid) == 0)
   if(original == 2^(bit-1) -1)
       disp(cont);
       cont2 = cont+cont2;
       cont = 0;
   else
       cont=cont+1;
   end
   original = fread (fid,1 , 'short');
end

fclose(fid);
