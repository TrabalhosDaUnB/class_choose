:- dynamic eh_classe/1.
:- dynamic atributos/2.
:- dynamic eh_build/1.
:- dynamic build/1.
:- dynamic eh_equipamento/1.
:- dynamic arma/1.
:- dynamic dia/1.
:- dynamic mes/1.
:- dynamic cor/1.
:- dynamic nome/1.

clearBase(X):- clearBase1(X), fail.
clearBase(X).

clearBase1(X):- retract(X).
clearBase1(X).

limpa_base :-
    clearBase(eh_classe(_)),
    clearBase(atributos(_,_)),
    clearBase(eh_build(_)),
    clearBase(build(_)),
    clearBase(eh_equipamento(_)),
    clearBase(arma(_)),
    clearBase(dia(_)),
    clearBase(mes(_)),
    clearBase(cor(_)),
    clearBase(nome(_)).

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
eh_equipamento(espada_e_adaga_mistica, armadura_leve) :- eh_classe(cavaleiro), eh_build(paladino), arma(atacante).

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


iniciar :-
    write("============Seletor_de_Classe==========="), nl, nl,
    write("1. Vamos iniciar!"), nl,
    write("2. Me tire daqui!"), nl,
    read(X),
    write("========================================"), nl, nl,
    opcao(X),
    X==2, !.

opcao(1) :- pergunta_1.
opcao(2) :- !.

pergunta_1 :-
    write("============Seletor_de_Classe==========="), nl, nl,
    write("Voce estava viajando pelas terras de Javalovisk e encontrou um Dragon NullPointerException. Então você:"), nl,
    write("1. Com muito odio explode a terra de Javalovisk com o poder da mente"), nl,
    write("2. Com as proprias maos destroi o Dragon NullPointerException"), nl,
    write("3. Se acalma e telepaticamente entra em contato com o mago StackOverflow que te encontra a solucao"), nl,
    write("4. Voce utiliza uma habilidade especial e reduz o Dragon a cinzas"), nl,
    read(X),
    write("========================================"), nl, nl,
    opc_pergunta_1(X).

opc_pergunta_1(1) :- pergunta_2(inteligencia).
opc_pergunta_1(2) :- pergunta_2(forca).
opc_pergunta_1(3) :- pergunta_2(inteligencia).
opc_pergunta_1(4) :- pergunta_2(forca).

pergunta_2(X) :-
    write("============Seletor_de_Classe==========="), nl, nl,
    write("Voce encontrou o livro do mage ByShaQui e ao tentar fazer um feitico voce evocou o gnomo BahIhDu e ele invade seu computador! O que voce faz?"), nl,
    write("1. Converso com ele até me acostumar com sua presenca"), nl,
    write("2. Uso minhas habilidades especiais de sobrinho formatador de pc da familia e detono o gnomo"), nl,
    write("3. Meu pc é sinistro um gnomo a mais outro a menos não faz diferenca."), nl,
    write("4. Nao aconteceria pois voce sabe que o livro de ByShaQui eh escuro e cheio de horrores!"), nl,
    read(Y),
    write("========================================"), nl, nl,
    opc_pergunta_2(X,Y).

opc_pergunta_2(X,1) :- assert(atributos(X,vitalidade)), nl, pergunta_build.
opc_pergunta_2(X,2) :- assert(atributos(X,destreza)), nl, pergunta_build.
opc_pergunta_2(X,3) :- assert(atributos(X,vitalidade)), nl, pergunta_build.
opc_pergunta_2(X,4) :- assert(atributos(X,destreza)), nl, pergunta_build.


pergunta_build :-
    write("=======Seletor_de_Especializacao========"), nl, nl,
    write("Vosso amor se encontra em perigo no mundo da VidaSocial. O que voce como um dos integrantes da Orda da Sociedade Oculta de SofWar faz?"), nl,
    write("1. Seu amor nunca esta em perigo pois voce esta com ele."), nl,
    write("2. Sem que seu amor perceba voce destroi tal perigo."), nl,
    write("3. Voce se reune com a Orda da Sociedade de SofWar e lidera um ataque contra o perigo."), nl,
    read(X),
    write("========================================"), nl, nl,
    opc_build(X).

opc_build(1) :- assert(build(defesa)), pergunta_equip.
opc_build(2) :- assert(build(agilidade)), pergunta_equip.
opc_build(3) :- assert(build(talento)), pergunta_equip.

pergunta_equip :-
    write("==========Seletor_de_Equipamento========"), nl, nl,
    write("Antes de finalizar sua selecao e permitir seu ingresso na Sociedade Oculta de SofWar voce precisa fazer mais uma escolha:"), nl,
    write("1. agua, gelo e terra"), nl,
    write("2. fogo, vento e ferro"), nl,
    read(X),
    write("========================================"), nl, nl,
    opc_equip(X).

opc_equip(1) :- assert(arma(defensor)), pergunta_dia.
opc_equip(2) :- assert(arma(atacante)), pergunta_dia.

pergunta_dia :-
    write("=========Seletor_de_Historia============"), nl, nl,
    write("Por gentileza escolha um dia de 1 a 31"), nl,
    read(X),
    write("========================================"), nl, nl,
    opc_dia(X).

opc_dia(1) :- assert(dia(as_Respostas_do_Universo)), pergunta_mes.
opc_dia(2) :- assert(dia(o_Diploma_Escondido)), pergunta_mes.
opc_dia(3) :- assert(dia(a_Formatura_Esperada)), pergunta_mes.
opc_dia(4) :- assert(dia(o_Tesouro_do_Dragao)), pergunta_mes.
opc_dia(5) :- assert(dia(o_Cristal_da_Sabedoria)), pergunta_mes.
opc_dia(6) :- assert(dia(a_Princesa_Perdida)), pergunta_mes.
opc_dia(7) :- assert(dia(o_Principe_Perdido)), pergunta_mes.
opc_dia(8) :- assert(dia(a_Coroa_de_Javalovisk)), pergunta_mes.
opc_dia(9) :- assert(dia(a_Arma_Dourada_de_Seh)), pergunta_mes.
opc_dia(10) :- assert(dia(o_Navio_Naufragado_de_Rubi)), pergunta_mes.
opc_dia(11) :- assert(dia(o_Calice_de_Gelo)), pergunta_mes.
opc_dia(12) :- assert(dia(a_Armada_Proibida)), pergunta_mes.
opc_dia(13) :- assert(dia(o_Poder_de_Javalovisk)), pergunta_mes.
opc_dia(14) :- assert(dia(o_Esqueleto_do_Tita)), pergunta_mes.
opc_dia(15) :- assert(dia(a_Armadura_do_Mago_Guerreiro)), pergunta_mes.
opc_dia(16) :- assert(dia(o_Traje_do_Sabio_Guerreiro)), pergunta_mes.
opc_dia(17) :- assert(dia(o_Cajado_de_Merlin)), pergunta_mes.
opc_dia(18) :- assert(dia(o_Arco_Proibido)), pergunta_mes.
opc_dia(19) :- assert(dia(a_Espada_Inicial)), pergunta_mes.
opc_dia(20) :- assert(dia(a_Varinha_de_Cedro_Negro)), pergunta_mes.
opc_dia(21) :- assert(dia(a_Caixa_de_Pandora)), pergunta_mes.
opc_dia(22) :- assert(dia(a_Tavola_Triangular)), pergunta_mes.
opc_dia(23) :- assert(dia(a_Fonte_da_Vida)), pergunta_mes.
opc_dia(24) :- assert(dia(a_Fonte_da_Sabedoria)), pergunta_mes.
opc_dia(25) :- assert(dia(as_Armaduras_Sagradas)), pergunta_mes.
opc_dia(26) :- assert(dia(a_Fonte_da_Juventude)), pergunta_mes.
opc_dia(27) :- assert(dia(o_Talisma_do_Tempo)), pergunta_mes.
opc_dia(28) :- assert(dia(o_Orbe_da_Destreza)), pergunta_mes.
opc_dia(29) :- assert(dia(o_Berrante_dos_Gigantes)), pergunta_mes.
opc_dia(30) :- assert(dia(a_Katana_do_Destino)), pergunta_mes.
opc_dia(31) :- assert(dia(o_Machado_Anciao_de_Assis)), pergunta_mes.


pergunta_mes :-
    write("==========Seletor_de_Historia============"), nl, nl,
    write("Por gentileza escolha um mes de 1 a 12"), nl,
    read(X),
    write("========================================"), nl, nl,
    opc_mes(X).

opc_mes(1) :- assert(mes(a_Aldeia_das_Montanhas)), pergunta_cor.
opc_mes(2) :- assert(mes(a_Aldeia_da_Borda_do_Vulcao)), pergunta_cor.
opc_mes(3) :- assert(mes(as_Ilhas_de_Pedra)), pergunta_cor.
opc_mes(4) :- assert(mes(a_Vila_Flutuante_de_Jasmin)), pergunta_cor.
opc_mes(5) :- assert(mes(a_Costa_do_Dragao_Voador)), pergunta_cor.
opc_mes(6) :- assert(mes(a_Cidade_da_Nevoa)), pergunta_cor.
opc_mes(7) :- assert(mes(a_Floresta_Oculta_do_Rio_de_Rubi)), pergunta_cor.
opc_mes(8) :- assert(mes(o_Castelo_das_Mil_Torres)), pergunta_cor.
opc_mes(9) :- assert(mes(a_Capital_do_Ferro_Vermelho)), pergunta_cor.
opc_mes(10) :- assert(mes(o_Nascer_do_Tita)), pergunta_cor.
opc_mes(11) :- assert(mes(o_Castelo_da_Sabedoria)), pergunta_cor.
opc_mes(12) :- assert(mes(a_Fortaleza_de_Esmeralda)), pergunta_cor.

pergunta_cor :-
    write("=========Seletor_de_Historia============"), nl, nl,
    write("Por gentileza escolha uma destas cores"), nl,
    write("1. branco"), nl,
    write("2. preto"), nl,
    write("3. vermelho"), nl,
    write("4. azul"), nl,
    write("5. amarelo"), nl,
    write("6. verde"), nl,
    read(X),
    write("========================================"), nl, nl,
    opc_cor(X).

opc_cor(1) :- assert(cor(a_Rainha_Corrompida)), pergunta_nome.
opc_cor(2) :- assert(cor(a_Assassina_de_Javalovisk)), pergunta_nome.
opc_cor(3) :- assert(cor(o_Traidor_dos_Mares_de_Cristal)), pergunta_nome.
opc_cor(4) :- assert(cor(o_Cavaleiro_sem_Honra)), pergunta_nome.
opc_cor(5) :- assert(cor(o_Rei_dos_Gigantes)), pergunta_nome.
opc_cor(6) :- assert(cor(o_Gnomo_Corrompido)), pergunta_nome.

pergunta_nome :-
    write("=========Seletor_de_Historia============"), nl, nl,
    write("Por fim forneca seu nickname entre aspas duplas:"), nl,
    read(X),
    write("========================================"), nl, nl,
    opc_nome(X).

    opc_nome(X) :- assert(nome(X)), conta_historia_tela.


conta_historia_tela :- eh_classe(Classe), eh_build(Build), eh_equipamento(EquipA, EquipB), dia(Dia), mes(Mes), cor(Cor), nome(Nome),nl,nl,
    write("\n\nEsta eh a breve historia da vida de "), write(Nome), write(" o "), write(Classe), write(" "), write(Build), write(": \n\n"),
    write(Nome), write(" vivia em um pacato local chamado "), write(Mes), write(".\nViveu como uma pessoa comum durante uma boa parte de sua vida. Entretanto em um certo dia\n"),
    write(Mes), write(" recebeu um poderoso ataque e acabou em ruinas.\nTempos depois descobriu-se que o ataque veio d"), write(Cor), write(".\nDesde entao "),
    write(Nome), write(" passou a treinar buscando ingressar na Sociedade Oculta de SofWar!\n"), write("Sua missao inicial eh buscar "), write(Dia), write(" para trazer mais poder a SofWar e enfim destruir "),
    write(Cor), write(".\n"), write("Seus equipamentos sao: "), write(EquipA), write(" e "), write(EquipB), write("!\n\n\t\tBoa sorte!"), nl, nl, nl, reiniciar.

reiniciar :- limpa_base,
    write("===============Reiniciar?================"), nl, nl,
    write("1. Reiniciar selecao"), nl,
    write("2. Sair daqui!"), nl,
    read(X),
    write("========================================"), nl, nl,
    opc_reiniciar(X),
    X==2, !.

opc_reiniciar(1) :- iniciar.
opc_reiniciar(2) :- !.