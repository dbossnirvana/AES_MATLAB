# AES_MATLAB
AES implementation in MATLAB

Author: Jonathan Martinez

Date: November 2016


Description:

-    A Matlab implmentation of the Advanced Encryption Standard (AES)
    cryptographic protocol.
-    The program initializes global parameters such as the SBOX and
    the INV_SBOX for use in the encryption and decryption mechanisms.
-    The Communications Systems Toolbox is used to achieve Galois Field
    arithmetic for a GF(2^8) field using x^8 + x^4 + x^3 + x + 1 as the
    primitive polynomial.
-    The key schedule algorithm provides a key expansion mechanism that
    is shared for encryption and decryption.
To Use:
-    Run aes_master.m
-   Copyright 2016, Jonathan Martinez
