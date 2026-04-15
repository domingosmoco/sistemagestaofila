algoritmo "SistemaFilaAtendimento"
// Disciplina   : [Linguagem e Lógica de Programação] 
// Professor   : Antonio Carlos Nicolodi 

// ==============================================================
// SISTEMA DE FILA DE ATENDIMENTO
// Criado por: [Seu nome]
// O que faz: Simula uma fila de atendimento, tipo fila de banco.
//            As pessoas entram pela frente e saem pelo fundo.
//            Isso se chama FILA (ou FIFO: First In, First Out)
// ==============================================================

var
   // Aqui eu crio um vetor (tipo uma lista) com 10 espaços
   // Cada espaço vai guardar o número de um cliente
   fila: vetor[1..10] de inteiro

   // "inicio_da_fila" aponta para o PRIMEIRO da fila (quem vai ser atendido)
   // "fim_da_fila" aponta para o ÚLTIMO da fila (onde entra a próxima pessoa)
   inicio_da_fila: inteiro
   fim_da_fila: inteiro

   // Variáveis de apoio
   opcao: inteiro     // guarda o que o usuário escolheu no menu
   numero_cliente: inteiro  // número do cliente que vai entrar na fila
   i: inteiro         // usada para percorrer a fila na hora de mostrar

inicio
   // No começo, a fila está vazia
   // O início começa em 1 e o fim começa em 0
   // Quando início > fim, significa que a fila está vazia
   inicio_da_fila <- 1
   fim_da_fila <- 0

   // Esse "repita...até" fica repetindo enquanto o usuário não escolher sair
   repita

      // ---- MENU PRINCIPAL ----
      escreval("===================================")
      escreval("     SISTEMA DE FILA DE ATENDIMENTO")
      escreval("===================================")
      escreval("1 - Entrar na fila")
      escreval("2 - Atender próximo cliente")
      escreval("3 - Ver quem está na fila")
      escreval("0 - Sair do sistema")
      escreval("===================================")
      escreva("Escolha uma opção: ")
      leia(opcao)

      // Aqui o programa verifica o que o usuário escolheu
      escolha opcao

         // ---- OPÇÃO 1: ADICIONAR CLIENTE NA FILA ----
         caso 1
            // Verifico se ainda tem espaço na fila (máximo 10 pessoas)
            se fim_da_fila < 10 entao
               // Avança o marcador do fim para o próximo espaço vazio
               fim_da_fila <- fim_da_fila + 1

               // Pede o número do cliente para colocar na fila
               escreva("Digite o número do cliente: ")
               leia(numero_cliente)

               // Guarda o cliente no espaço do fim da fila
               fila[fim_da_fila] <- numero_cliente

               escreval("? Cliente ", numero_cliente, " entrou na fila!")
               escreval("  Posição na fila: ", fim_da_fila - inicio_da_fila + 1, "º")
            senao
               // Se o vetor já tem 10 pessoas, não cabe mais ninguém
               escreval("? Fila cheia! Não é possível adicionar mais clientes.")
            fimse

         // ---- OPÇÃO 2: ATENDER O PRIMEIRO DA FILA ----
         caso 2
            // Verifico se tem alguém na fila (início <= fim)
            se inicio_da_fila <= fim_da_fila entao
               // Pego o número do cliente que está no começo da fila
               escreval("? Atendendo o cliente número: ", fila[inicio_da_fila])

               // "Remove" o cliente avançando o marcador do início
               // (o dado ainda está no vetor, mas foi "ignorado")
               inicio_da_fila <- inicio_da_fila + 1
            senao
               // Se início > fim, a fila está completamente vazia
               escreval("? Não há ninguém na fila para atender!")
            fimse

         // ---- OPÇÃO 3: MOSTRAR TODOS NA FILA ----
         caso 3
            se inicio_da_fila <= fim_da_fila entao
               escreval("---- Clientes aguardando atendimento ----")

               // Percorro a fila do início até o fim
               // O "i" começa em inicio_da_fila e vai até fim_da_fila
               para i de inicio_da_fila ate fim_da_fila faca
                  escreval("  ? Cliente: ", fila[i])
               fimpara

               // Mostro quantas pessoas estão esperando
               escreval("-----------------------------------------")
               escreval("  Total na fila: ", fim_da_fila - inicio_da_fila + 1, " pessoa(s)")
            senao
               escreval("? A fila está vazia no momento.")
            fimse

         // ---- OPÇÃO 0: SAIR ----
         caso 0
            escreval("Encerrando o sistema... Até logo!")

         // ---- OPÇÃO INVÁLIDA ----
         outrocaso
            escreval("? Opção inválida! Por favor, escolha entre 0 e 3.")

      fimescolha

   ate opcao = 0  // O loop termina quando o usuário digitar 0

fimalgoritmo