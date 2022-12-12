Feature: Listar times da NBA
(A) -> Como usuário gostaria de ao entrar no aplicativo visualizar todos os times da NBA.
(B) -> Ao clicar em cada time quero observar os detalhes do time em específico.

Cenário(A): Listagem dos times da Nba
Dado que o cliente clicou para abrir o aplicativo
Quando a tela carregar
Então o sistema deverá listar todos os times da NBA.

Cenário(B): Detalhes do Time
Dado que o cliente clicou em um time específico da nossa listagem.
Quando abrir a nova tela.
Então o sistema deverá exibir os detalhes sobre o time.