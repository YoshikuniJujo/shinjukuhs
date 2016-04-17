xxcrypt_org n ed mc = mc ^ ed `mod` n
xxcrypt = xxcrypt_org 138689
encrypt = xxcrypt 13
decrypt = xxcrypt 95497
