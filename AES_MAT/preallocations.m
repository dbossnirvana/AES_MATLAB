
% Constants and Global Parameters

% Turn off all warnings
warning('off','all')

% sbox lookup table. Indexing is (input+1)
sbox_vector = csvread('sbox.csv');
sbox_table = transpose(reshape(sbox_vector(1:256), [16,16]));

% inv_sbox lookup table. Indexing is (input+1)
inv_sbox_vector = csvread('inv_sbox.csv');
inv_sbox_table = reshape(inv_sbox_vector(1:256), [16,16]);
setGlobal(sbox_table, inv_sbox_table)

%Constants
global m prim_poly fixM fixM_d; 
m = 8; % GF(2^m)
prim_poly = 283;

%Constant matrix for MixColumn Layer
fixM = [02 03 01 01;
        01 02 03 01;
        01 01 02 03;
        03 01 01 02];
%Constant matrix for Inv MixColumn Layer
fixM_d = [14 11 13 09;
          09 14 11 13;
          13 09 14 11;
          11 13 09 14];

