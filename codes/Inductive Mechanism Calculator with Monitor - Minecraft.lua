monitor = peripheral.wrap("right") -- Define o monitor do lado direito
monitor.clear() -- Limpa o monitor
monitor.setTextScale(1.5) -- Aumenta um pouco a fonte da letra	
monitor.setCursorBlink(true) -- Habilita o curso na tela

-- Base da quantidade de materiais
cobblestone = 80
stick = 25
tnt = 12
enderpearls = 10

function packConvert(x) -- Conversor da quantindade de itens, em packs
  local packs = math.floor(x / 64)
  local itens = x % 64
  local msg = packs .. " packs + " .. itens
  return msg
end

function quantItens(quant) -- Calcula a quantidade de itens
  local quantCobblestone = cobblestone * quant
  local quantStick = stick * quant
  local quantTnt = tnt * quant
  local quantEnder = enderpearls * quant

  local x = packConvert(quantCobblestone) .. " de Cobblestone.\n"
  local y = packConvert(quantStick) .. " de Stick.\n"
  local z = packConvert(quantTnt) .. " de TNT.\n"
  local w = packConvert(quantEnder) .. " de Ender Pearls.\n"

  print("\nLista de materiais:\n" ,x, y, z, w) -- mostra listagem no terminal

  -- mostrar listagem no monitor
  monitor.clear()
  monitor.setCursorPos(2,2)
  monitor.write("Lista de materiais:")
  monitor.setCursorPos(3,3)
  monitor.write(x)
  monitor.setCursorPos(3,4)
  monitor.write(y)
  monitor.setCursorPos(3,5)
  monitor.write(z)
  monitor.setCursorPos(3,6)
  monitor.write(w)
  monitor.setCursorPos(2,7)
end

-- Programa
shell.run("clear") -- limpa o terminal

print("CALCULADORA PARA FABRICAÇÃO DE INDUCTIVE MECHANISM\n")
print("Digite a quantidade de Inductive Mechanism:")
inputTerm = read() -- da entrada na quantidade de itens

if (inputTerm == "s") then --Finaliza o programa para manutenção
  a = inputTerm
  return
end

quant = tonumber(inputTerm)
quantItens(quant)

print("Pressione qualquer tecla para realizar um novo calculo.")
key = read()

if (key ~= nil) then -- reinicia o programa
  shell.run("startup")
end