% 
% Author: Jonathan Martinez
% Date: November 2016
% Description: 
% -    A Matlab implmentation of the Advanced Encryption Standard (AES)
%     cryptographic protocol.
% -    The program initializes global parameters such as the SBOX and
%     the INV_SBOX for use in the encryption and decryption mechanisms.
% -    The Communications Systems Toolbox is used to achieve Galois Field
%     arithmetic for a GF(2^8) field using x^8 + x^4 + x^3 + x + 1 as the
%     primitive polynomial.
% -    The key schedule algorithm provides a key expansion mechanism that
%     is shared for encryption and decryption.
%
% Copyright 2016, Jonathan Martinez, E:jem14m@my.fsu.edu

clc
clear all
close all
% Global Variable Declarations
preallocations;

% Initial input plaintext and key
plaintext = '0123456789ABCDEF';
% plaintext = input('Type in an input message (16 characters or less):\n','s');
plaintext = zerofill(plaintext);
key = 'MachinIntllignce';
% key = input('Type in a secret key/password (16 characters or less):\n','s');
key = zerofill(key);

% Key Schedule
round_keys = key_schedule(double(key));
% Message Encryption
ciphertext = aes_encryption(plaintext,round_keys);
% Message Decryption
plaintext_recov = aes_decryption(ciphertext, round_keys);

