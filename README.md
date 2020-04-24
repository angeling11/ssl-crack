# SSL Crack

Reveal password and message for the RSA encrypted SSL.



## Syntax

./ssl-crack.sh key in_file wordlist [out_file]

Flag | Description
---- | ----
key | private.key
in_file | Encrypted File
wordlist | Wordlist
out_file | Optional output file



## Troubleshooting

- If a wordlist doesn't work make sure that you're using a UNIX end line format, just LF character (`\n`, `0A` or 10 in decimal), CR and LF (`\r` + `\n`, `0D` + `0A`) doesn't work.

- Make sure it's an executable file: `chmod +x ssl-crack.sh`


## Author

natryvat



## Disclaimer

Just for academic purposes, I am not responsible for improper usage.

