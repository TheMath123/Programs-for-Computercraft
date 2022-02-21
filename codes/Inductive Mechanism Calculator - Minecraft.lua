-- base da quantidade de materiais
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

  return print("\nLista de materiais:\n",x, y, z, w)
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

if (key ~= nil) then
  shell.run("startup")
end