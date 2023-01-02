require_relative 'ui' #chamando conteudo que é definido em outro arquivo, relative pois esta no mesmo diretorio e não precisa colocar .rb, pois o proprio ruby definira isso
# se fosse só require 'ui', procuraria apenas nas bibliotecas ruby 

def palavra_mascarada(chutes, palavra_secreta)
  mascara = ""
  for letra in palavra_secreta.chars
    if chutes.include? letra
      mascara << letra
    else 
      mascara << "_"
    end
  end
  mascara
end

def pede_um_chute_valido(chutes, erros, mascara)
  cabecalho_de_tentativa chutes, erros, mascara
  loop do #executa o codigo 
    chute = pede_um_chute
   #se inclui chute atual 
      if chutes.include? chute
        avisa_chute_efetuado chute #função com parametro 
      else #se for valido 
        return chute
      end
  end
end 


def joga(nome) #logica de negocio isolada
  palavra_secreta = sorteia_palavra_secreta

  erros = 0
  chutes = []
  pontos_ate_agora = 0

  while erros < 5
    mascara = palavra_mascarada chutes, palavra_secreta
    chute = pede_um_chute_valido chutes, erros, mascara
    chutes << chute #array 

    chutou_uma_letra = chute.size == 1 #para chutar uma letra 
    if chutou_uma_letra  
      letra_procurada = chute[0]
      total_encontrado = palavra_secreta.count letra_procurada #pergunta para o Giba sobre o count
      if total_encontrado == 0
        avisa_letra_nao_encontrada 
        erros += 1
    else
      avisa_letra_encontrada total_encontrado
    end 
  else
      acertou = chute == palavra_secreta #Acertando a palavra secreta 
      if acertou
        avisa_acertou_palavra 
        pontos_ate_agora += 100 #ganho
        break
      else
        avisa_errou_palavra 
        pontos_ate_agora -= 30 #perca
        erros += 1
      end 
    end


  end
  avisa_pontos pontos_ate_agora
end

def jogo_da_forca
  nome = dar_boas_vindas

  #laço principal do jogo
    loop do
      joga nome
    break if nao_quer_jogar? #break quebra, pergunta para o giba 
  end
end





