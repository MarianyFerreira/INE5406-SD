clc; clear all; close all;

fid=fopen('/home/usrp/felipedennis/USRP_MCanaisMDDCS/USRPN210_USANDO_MEM_EXT/Saidas/saida1024_samp2e6.pcm', 'r');
%fid=fopen('/home/usrp/felipedennis/USRP_MCanaisMDDCS/USRPN210_USANDO_MEM_EXT/Saida_ext128.pcm', 'r');
original=fread(fid,5000,'int16');
fclose(fid);

fid2=fopen('/home/usrp/felipedennis/USRP_MCanaisMDDCS/USRPN210_USANDO_MEM_EXT/Saidas/saida1024_samp2e6_ant.pcm', 'r');
original2=fread(fid2,5000,'int16');
fclose(fid2);
% tam=length(original);
% original = original*32767/2;
% 
% original2 = int16(original);
% original2 = zeros(length(orginal),1);

