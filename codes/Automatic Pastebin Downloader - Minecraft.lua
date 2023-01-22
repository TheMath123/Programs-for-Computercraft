shell.run("rm startup")
print("File \"startup\" deleted.")
 
print("Enter the key of pastebin:")
inputTerm = read()
 
shell.run("pastebin get ",inputTerm," startup")
 
print("Restarting computer ...")
shell.run("reboot")
