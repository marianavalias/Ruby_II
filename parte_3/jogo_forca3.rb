require_relative 'ui' #chamando conteudo que é definido em outro arquivo, relative pois esta no mesmo diretorio e não precisa colocar .rb, pois o proprio ruby definira isso
# se fosse só require 'ui', procuraria apenas nas bibliotecas ruby 

def salva_rank(nome, pontos_totais)
  conteudo = "#{nome}\n#{pontos_totais}"
  File.write "rank.txt", conteudo #escreva no arquivo
end

def le_rank
  conteudo = file.read "rank.txt"
  conteudo.split "\n"
end

def sorteia_palavra_secreta
  avisa_escolhendo_palavra 
  texto = File.read("dicionario.txt") #ler arquivo de texto, colocando na menoria e quebrando ele 
  todas_as_palavras = texto.split "\n" #quebrar no \n
  numero_escolhido = rand(todas_as_palavras.size) #numero aleatorio
  palavra_secreta = todas_as_palavras[numero_escolhido].downcase #minuscula 
  avisa_palavra_escolhida palavra_secreta
end

def sorteia_palavra_secreta_sem_consumir_muita_memoria
  avisa_escolhendo_palavra 
  arquivo = File.new("dicionario.txt")
  quantidade_de_palavras = arquivo.gets.to_i #uma linha, ler quantidade
  numero_escolhido = rand(quantidade_de_palavras) 
  for linha in 1..(numero_escolhido-1)
    arquivo.gets
  end
  palavra_secreta = arquivo.gets.strip.downcase
  arquivo.close #fechar arquivo 
  avisa_palavra_escolhida palavra_secreta
end

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
  pontos_ate_agora
end

def jogo_da_forca
  nome = dar_boas_vindas
  pontos_totais = 0 

  avisa_campeao_atual le_rank

  #laço principal do jogo
    loop do
      pontos_totais += joga nome
      avisa_pontos_totais pontos_totais
      salva_rank nome, pontos_totais
    break if nao_quer_jogar? #break quebra, pergunta para o giba 
  end
end





