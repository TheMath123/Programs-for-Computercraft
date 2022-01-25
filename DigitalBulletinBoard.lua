monitor = peripheral.wrap("right") -- Define o monitor do lado direito
monitor.clear() -- Limpa o monitor
monitor.setCursorBlink(true) -- Habilita o curso na tela

 
-- Programa
indexNote = 1 -- flag do index de notas
note = {} -- notas armazenadas

monitor.setCursorPos(0,0)
monitor.write('=== AVISOS ===')

a = false -- manter o loop funcionando

while ( a ~= true ) do
    shell.run("clear") -- limpa o terminal
    
    print("QUADRO DE AVISOS\nDigite a mensagem para anexar ao quadro:")
    inputTerm = read() -- da entrada na quantidade de itens

    monitor.setCursorPos(1,indexNote)
    monitor.write(inputTerm)
    note[indexNode] = inputTerm
    
    indexNote= incr(indexNote)
end
