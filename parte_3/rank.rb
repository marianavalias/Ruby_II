def salva_rank(nome, pontos_totais)
  conteudo = "#{nome}\n#{pontos_totais}"
  File.write "rank.txt", conteudo #escreva no arquivo
end
  
def le_rank
  conteudo = File.read "rank.txt"
  conteudo.split "\n"
end