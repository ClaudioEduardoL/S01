% Regra: alto_impacto(D)
% Verdadeira se D tiver mais de 5 créditos e for pré-requisito de pelo menos 2 disciplinas diferentes.
alto_impacto(D) :-
    disciplina(D, Creditos, _),
    Creditos > 5,
    prerequisito(D1, D),
    prerequisito(D2, D),
    D1 \= D2.

% Query 2:
% Disciplinas da área matematica com 4 créditos e que não são pré-requisito de nenhuma outra.
% (use diretamente no console)
% ?- disciplina(D, 4, matematica), \+ prerequisito(_, D).
