wget https://akirayuki.it/rdp.sh
chmod +x rdp.sh
./rdp.sh



THEN 
./ngrok authtoken {TOKEN} (puoi avere il token free registrandoti al sito)
./ngrok tcp 5901 -log=stdout
