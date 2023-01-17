def le_nome #definindo 
  nome = gets #devolve o resultado para string e atribui variavel (local) nome
  puts "Lido #{nome}"
  nome #return/devolve 
end 

def pede_nome
  puts "Digite seu nome"
  nome_lido = le_nome #invocando função e atribui o resultado ao nome_lido 
  puts "Pedido!"
  nome_lido
end

def inicio
  nome = pede_nome
  puts "Bem vindo #{nome}"

  puts "Quero conhecer mais alguém"
  nome2 = pede_nome
  puts "Olá #{nome2}"
end

#vale lembrar que a variavel nome só existe dentro da execução e quando acabar, ela segue o fluxo e deixa de "existir"
#nome (local) e nome_lido tem o mesmo valor (memoria), nome da variavél (referencia)

#Ruby faz essa mesma pilha de execuxão para desmostrar aonde está o erro 