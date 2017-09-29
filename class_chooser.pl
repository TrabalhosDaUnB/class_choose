%definicao das classes dos chars
%a definicao foi feita em cima de 4 atributos forca, inteligencia, destreza e vitalidade
%sendo que inteligencia e forca se anulam


%forca combinado a destreza
qual_eh_a_classe(for, dex, cavaleiro).
qual_eh_a_classe(for, vit, guerreiro).
qual_eh_a_classe(int, dex, arqueiro).
qual_eh_a_classe(int, vit, mago).
qual_eh_a_classe(vit, dex, assassino).
qual_eh_a_classe(for, int, inexistente).

