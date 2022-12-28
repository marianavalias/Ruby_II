def dar_boas_vindas #função
  puts "Bem vindo ao jogo da forca"
  puts "Qual é o seu nome?"
  nome = gets.strip #tirar enter ou espaço em branco no começo e no final
  puts "\n\n\n\n\n\n"
  puts "Começaremos o jogo para você, #{nome}"
  nome
end

def sorteia_palavra_secreta
  puts "Escolhendo uma palavra..."
  palavra_secreta = "programador"
  puts "Escolhida uma palavra com #{palavra_secreta.size} letras... boa sorte!"
  palavra_secreta
end

def nao_quer_jogar?
  puts "Deseja jogar novamente? (S/N)"
  quero_jogar = gets.strip
  nao_quero_jogar = quero_jogar.upcase == "N" #transforma em maisculo 
end

def pede_um_chute(chutes, erros)
  puts "\n\n\n\n"
  puts "Erros até agora: #{erros}"
  puts "Chutes até agora: #{chutes}"
  puts "Entre com a letra ou palavra"
  chute = gets.strip
  puts "Será que acertou? Você chutou #{chute}"
  chute
end

def joga(nome)
  palavra_secreta = sorteia_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    chute = pede_um_chute chutes, erros
    #se inclui chute atual 
    if chutes.include? chute
      puts "Você já chutou #{chute}"
      next #proxima interação do laço
    end
    chutes << chute #array 

    chutou_uma_letra = chute.size == 1 #para chutar uma letra 
    if chutou_uma_letra  
      letra_procurada = chute[0]
      total_encontrado = palavra_secreta.count letra_procurada #pergunta para o Giba sobre o count
      if total_encontrado == 0
        puts "Letra encontrada"
        erros += 1
    else
      puts "Letra não encontrada #{total_encontrado} vezes."
    end 
  else
      acertou = chute == palavra_secreta #Acertando a palavra secreta 
      if acertou
        puts "Parabéns! Acertou!" 
        pontos_ate_agora += 100 #ganho
        break
      else
        puts "Que pena... Errou" #errando ela
        pontos_ate_agora -= 30 #perca
        erros += 1
      end 
    end


  end
  puts "Você ganhou #{pontos_ate_agora} pontos."
end

nome = dar_boas_vindas

#laço principal do jogo
loop do
    joga nome
    break if nao_quer_jogar? #break quebra, pergunta para o giba 
end



