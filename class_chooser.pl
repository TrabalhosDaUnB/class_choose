:- dynamic positive/1.
:- dynamic negative/1.
:- dynamic clearBase/1.
:- dynamic clearBase1/1.
clearBase(X):- clearBase1(X), fail.
clearBase(X).

clearBase1(X):- retract(X).
clearBase1(X).

%------------------classes------------------------------
eh_classe(cavaleiro) :- atributos(forca, destreza).
eh_classe(guerreiro) :- atributos(forca, vitalidade).
eh_classe(arqueiro) :- atributos(inteligencia, destreza).
eh_classe(mago) :- atributos(inteligencia, vitalidade).

%build_cavaleiro------------------------------------------
eh_build(defensor) :- eh_classe(cavaleiro), build(defesa).
eh_build(da_velocidade) :- eh_classe(cavaleiro), build(agilidade).
eh_build(paladino) :- eh_classe(cavaleiro), build(talento).

%build_guerreiro-----------------------------------------
eh_build(protetor) :- eh_classe(guerreiro), build(defesa).
eh_build(destruidor) :- eh_classe(guerreiro), build(agilidade).
eh_build(berseker) :- eh_classe(guerreiro), build(talento).

%build_arqueiro---------------------------------------------
eh_build(assassino) :- eh_classe(arqueiro), build(defesa).
eh_build(veloz) :- eh_classe(arqueiro), build(agilidade).
eh_build(arcano) :- eh_classe(arqueiro), build(talento).

%build_mago------------------------------------------------
eh_build(patrono) :- eh_classe(mago), build(defesa).
eh_build(elemental) :- eh_classe(mago), build(agilidade).
eh_build(anciao) :- eh_classe(mago), build(talento).

%armas_cavaleiro----------------------------------------
eh_equipamento(espada_e_escudo, armadura_pesada) :- eh_classe(cavaleiro), eh_build(defensor), arma(defensor).
eh_equipamento(espada_de_duas_maos, armadura_pesada) :- eh_classe(cavaleiro), eh_build(defensor), arma(atacante).
eh_equipamento(espada_e_katana, armadura_leve) :- eh_classe(cavaleiro), eh_build(da_velocidade), arma(defensor).
eh_equipamento(espada_de_duas_maos, armadura_leve) :- eh_classe(cavaleiro), eh_build(da_velocidade), arma(atacante).
eh_equipamento(espada_e_cristal_do_poder, armadura_pesada) :- eh_classe(cavaleiro), eh_build(paladino), arma(defensor).
eh_equipamento(espada_e_adaga_mistica, armadura_leve) :- eh_classe(cavaleiro), eh_build(paladino), arma(defensor).

%armas guerreiro-----------------------------------------
eh_equipamento(machado_e_escudo, armadura_pesada) :- eh_classe(guerreiro), eh_build(protetor), arma(defensor).
eh_equipamento(machado_de_duas_maos, armadura_pesada) :- eh_classe(guerreiro), eh_build(protetor), arma(atacante).
eh_equipamento(machado_e_escudo, armadura_leve) :- eh_classe(guerreiro), eh_build(destruidor), arma(defensor).
eh_equipamento(machado_de_duas_maos, armadura_pesada) :- eh_classe(guerreiro), eh_build(destruidor), arma(atacante).
eh_equipamento(machado_e_martelo_de_guerra, armadura_pesada) :- eh_classe(guerreiro), eh_build(berseker), arma(defensor).
eh_equipamento(grande_machado_de_duas_maos, sem_armadura) :- eh_classe(guerreiro), eh_build(berseker), arma(atacante).

%armas arqueiro------------------------------------------
eh_equipamento(arco_leve_e_adaga, traje_de_couro) :- eh_classe(arqueiro), eh_build(assassino), arma(defensor).
eh_equipamento(besta, traje_de_couro) :- eh_classe(arqueiro), eh_build(assassino), arma(atacante).
eh_equipamento(arco_reforcado, traje_de_couro) :- eh_classe(arqueiro), eh_build(veloz), arma(defensor).
eh_equipamento(arco_duplo, traje_de_seda) :- eh_classe(arqueiro), eh_build(veloz), arma(atacante).
eh_equipamento(arco_de_cristal, cota_de_malha) :- eh_classe(arqueiro), eh_build(arcano), arma(defensor).
eh_equipamento(besta_de_cristal, cota_de_malha) :- eh_classe(arqueiro), eh_build(arcano), arma(atacante).

%armas mago----------------------------------------------
eh_equipamento(cajado_de_cedro,manto_pesado) :- eh_classe(mago), eh_build(patrono), arma(defensor).
eh_equipamento(varinha_de_carvalho, manto_pesado) :- eh_classe(mago), eh_build(patrono), arma(atacante).
eh_equipamento(cajado_de_pedra, manto_de_mil_folhas) :- eh_classe(mago), eh_build(elemental), arma(defensor).
eh_equipamento(varinha_de_ferro, manto_de_mil_folhas) :- eh_classe(mago), eh_build(elemental), arma(atacante).
eh_equipamento(cajado_de_cristal, manto_de_luz) :- eh_classe(mago), eh_build(anciao), arma(defensor).
eh_equipamento(cajado_de_cristal, manto_de_sombra) :- eh_classe(mago), eh_build(anciao), arma(atacante).


iniciar :- repeat,clearBase(positive()),
    write("============Seletor_de_Classe==========="), nl,
    write("1. Vamos iniciar!"), nl,
    write("2. Me tire daqui!"), nl,
    read(X),
    write("========================================"), nl,
    opcao(X),
    X==2, !.

opcao(2) :- !.
opcao(1) :- pergunta_1.

pergunta_1 :-
    write("============Seletor_de_Classe==========="), nl,
    write("Voce estava viajando pelas terras de Javalovisk e encontrou um Dragon NullPointerException. Então você:"), nl,
    write("1. Com muito odio explode a terra de Javalovisk com o poder da mente"), nl,
    write("2. Com as proprias maos destroi o Dragon NullPointerException"), nl,
    write("3. Se acalma e telepaticamente entra em contato com o mago StackOverflow que te encontra a solucao"), nl,
    write("4. Voce utiliza uma habilidade especial e reduz o Dragon a cinzas"), nl,
    write("========================================"), nl,
    read(X),
    opc_pergunta_1(X).

opc_pergunta_1(1) :- pergunta_2(inteligencia).
opc_pergunta_1(2) :- pergunta_2(forca).
opc_pergunta_1(3) :- pergunta_2(inteligencia).
opc_pergunta_1(4) :- pergunta_2(forca).

pergunta_2(X) :-
    write("============Seletor_de_Classe==========="), nl,
    write("Voce encontrou o livro do mage ByShaQui e ao tentar fazer um feitico voce evocou o gnomo BahIhDu e ele invade seu computador! O que voce faz?"), nl,
    write("1. Converso com ele até me acostumar com sua presenca"), nl,
    write("2. Uso minhas habilidades especiais de sobrinho formatador de pc da familia e detono o gnomo"), nl,
    write("3. Meu pc é sinistro um gnomo a mais outro a menos não faz diferenca."), nl,
    write("4. Nao aconteceria pois voce sabe que o livro de ByShaQui eh escuro e cheio de horrores!"), nl,
    write("========================================"), nl,
    read(Y),
    opc_pergunta_2(X,Y).

opc_pergunta_2(X,1) :- assert(atributos(X,vitalidade)), nl, pergunta_build.
opc_pergunta_2(X,2) :- assert(atributos(X,destreza)), nl, pergunta_build.
opc_pergunta_2(X,3) :- assert(atributos(X,vitalidade)), nl, pergunta_build.
opc_pergunta_2(X,4) :- assert(atributos(X,destreza)), nl, pergunta_build.

pergunta_build :-
    write("========Seletor_de_Especializacao========"), nl,
    write("Vosso amor se encontra em perigo no mundo da VidaSocial. O que voce como um dos integrantes da Orda da Sociedade Oculta de SofWar faz?"), nl,
    write("1. Seu amor nunca esta em perigo pois voce esta com ele."), nl,
    write("2. Sem que seu amor perceba o perigo ele eh destruido."), nl,
    write("3. Voce se reune com a Orda da Sociedade de SofWar e lidera um ataque contra o perigo."), nl,
    read(X),
    opc_build(X).

opc_build(1) :- assert(build(defesa)), pergunta_equip, nl.
opc_build(2) :- assert(build(agilidade)), pergunta_equip, nl.
opc_build(3) :- assert(build(talento)), pergunta_equip, nl.

pergunta_equip :-
    write("==========Seletor_de_Equipamento========="), nl,
    write("Antes de finalizar sua selecao e permitir seu ingresso na Sociedade Oculta de SofWar voce precisa fazer mais uma escolha:"), nl,
    write("1. agua, gelo e terra"), nl,
    write("2. fogo, vento e ferro"), nl,
    read(X),
    opc_equip(X).

opc_equip(1) :- assert(arma(defensor)), nl, eh_classe(X), eh_build(Y), eh_equipamento(W,Z), write("Parabens voce eh um incrivel "), write(X), write(" "), write(Y), write(" e utiliza os equipamentos "), write(W), write(" e ") , write(Z), nl.
opc_equip(2) :- assert(arma(atacante)), nl, eh_classe(X), eh_build(Y), eh_equipamento(W,Z), write("Parabens voce eh um incrivel "), write(X), write(" "), write(Y), write(" e utiliza os equipamentos "), write(W), write(" e ") , write(Z), nl.
