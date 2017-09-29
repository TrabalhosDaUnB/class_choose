%classes
eh_classe(cavaleiro) :- atributos(forca, destreza).
eh_classe(guerreiro) :- atributos(forca, vitalidade).
eh_classe(arqueiro) :- atributos(inteligencia, destreza).
eh_classe(mago) :- atributos(inteligencia, vitalidade).
eh_classe(assassino) :- atributos(destreza, destreza).


iniciar :- repeat,
    write("=======Seletor_de_Classe======="), nl,
    write("1. Vamos iniciar!"), nl,
    write("2. Me tire daqui!"), nl,
    read(X),
    opcao(X),
    X==2, !.

opcao(2) :- !.
opcao(1) :- pergunta_1.

pergunta_1 :-
    write("=======Seletor_de_Classe======="), nl,
    write("Voce estava viajando pelas terras de Javalovisk e encontrou um Dragon NullPointerException. Então você:"), nl,
    write("1. Com muito odio explode a terra de Javalovisk com o poder da mente"), nl,
    write("2. Com as proprias maos destroi o Dragon NullPointerException"), nl,
    write("3. Se acalma e telepaticamente entra em contato com o mago StackOverflow que te encontra a solucao"), nl,
    write("4. Voce utiliza uma habilidade especial e reduz o Dragon a cinzas"), nl,
    write("5. O Dragon nao apareceria para voce pois voce nao anda em Javalovisk."), nl,
    read(X),
    opc_pergunta_1(X).

opc_pergunta_1(1) :- pergunta_2(inteligencia).
opc_pergunta_1(2) :- pergunta_2(forca).
opc_pergunta_1(3) :- pergunta_2(inteligencia).
opc_pergunta_1(4) :- pergunta_2(forca).
opc_pergunta_1(5) :- pergunta_2(destreza).

pergunta_2(X) :-
    write("=======Seletor_de_Classe======="), nl,
    write("Voce encontrou o livro do mage ByShaQui e ao tentar fazer um feitico voce evocou o gnomo BahIhDu e ele invade seu computador! O que voce faz?"), nl,
    write("1. Converso com ele até me acostumar com sua presenca"), nl,
    write("2. Uso minhas habilidades especiais de sobrinho formatador de pc da familia e detono o gnomo"), nl,
    write("3. Meu pc é sinistro um gnomo a mais outro a menos não faz diferenca."), nl,
    write("4. Nao aconteceria pois voce sabe que o livro de ByShaQui eh escuro e cheio de horrores!"), nl,
    read(Y),
    opc_pergunta_2(X,Y).

opc_pergunta_2(X,1) :- assert(atributos(X,vitalidade)), eh_classe(Classe), nl, write("Parabéns voce eh um incrivel "), write(Classe),nl.
opc_pergunta_2(X,2) :- assert(atributos(X,destreza)), eh_classe(Classe), nl, write("Parabéns voce eh um incrivel "), write(Classe),nl.
opc_pergunta_2(X,3) :- assert(atributos(X,vitalidade)), eh_classe(Classe), nl, write("Parabéns voce eh um incrivel "), write(Classe),nl.
opc_pergunta_2(X,4) :- assert(atributos(X,destreza)), eh_classe(Classe), nl, write("Parabéns voce eh um incrivel "), write(Classe),nl.
