shell.run("rm startup")
print("Arquivo \"startup\" deletado.")

print("Digite a chave do pastebin:")
inputTerm = read()

shell.run("pastebin get ",inputTerm," startup")

print("Reiniciando computador ...")
shell.run("reboot")