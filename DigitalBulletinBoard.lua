monitor = peripheral.wrap("right") -- Define o monitor do lado direito
monitor.clear() -- Limpa o monitor
monitor.setCursorBlink(true) -- Habilita o curso na tela

 
-- Programa
indexNote = 2 -- flag do index de notas
note = {} -- notas armazenadas

monitor.setCursorPos(3,1)
monitor.write('=== AVISOS ===')

a = false -- manter o loop funcionando

function addMsgToMonitor(msg)
    monitor.setCursorPos(1,indexNote)
    local lineIndex = indexNote - 1
    monitor.write(lineIndex .. " - " .. msg)
end

function clearLine(index)
    monitor.setCursorPos(1,index)
    monitor.clearLine()
end

case = {
  ['1'] = function () -- Adicionar um nova nota
    shell.run("clear") -- limpa o terminal

    print("QUADRO DE AVISOS\n")
    print('Digite a mensagem para anexar ao quadro:')
    inputTerm = read() -- da entrada na quantidade de itens

    note[indexNote] = inputTerm
    addMsgToMonitor(inputTerm)

    indexNote = indexNote + 1 -- incrementador
  end,

  ['2'] = function () -- Modificar nota
    shell.run("clear") -- limpa o terminal

    print("QUADRO DE AVISOS\n")
    print('Digite a linha que deseja modificar:')
    local line = read()
    local indexL = tonumber(line) + 1

    print('Digite a nova mensagem:')
    local msg = read()

    clearLine(indexL)
    monitor.setCursorPos(1,indexL)
    monitor.write(indexL+1 .. " - " .. msg)

    local iNote = indexL - 1
    note[iNote] = msg
  end,

  ['3'] = function () -- Remover nota
    shell.run("clear") -- limpa o terminal

    print("QUADRO DE AVISOS\n")
    print('Digite a linha que deseja EXCLUIR:')
    local line = read()
    local numLine = tonumber(line) + 1

    print('Deseja mesmo excluir está a linha',numLine,'.')
    print('[S]im / [N]ão')
    local confirm = read()

    if(confirm == 'S' or confirm == 's') then
        clearLine(numLine)
        print('Linha excluida!\nvoltando ao menu...')
    else
        print('Operação cancelada!\n voltando ao menu ...')
    end
  end,

  ['4'] = function ()
    shell.run("clear") -- limpa o terminal

    print("QUADRO DE AVISOS\n")
    print('Deseja mesmo resetar o quadro de avisos?')
    print('Isso vai APAGAR todas as notas criadas.')
    print('[S]im / [N]ão')
    local confirm = read()

    if(confirm == 'S' or confirm == 's') then
        print('Quadro resetado!')
        shell.run("reboot")
    else
        print('Operação cancelada!\n voltando ao menu ...')
    end
  end,

  ['default'] = function ()
      print('Opção invalida!')
  end,
}

while ( a ~= true ) do
    shell.run("clear") -- limpa o terminal

    print('QUADRO DE AVISOS')
    print('1 - Adicionar nova nota')
    print('2 - Modificar nota')
    print('3 - Remover nota')
    print('4 - Limpar quadro')
    print('Digite a opção que deseja (em número inteiro):')
    local choice = read()

    if case[choice] then
        case[choice]()
    else
        case["default"]()
    end   
end
