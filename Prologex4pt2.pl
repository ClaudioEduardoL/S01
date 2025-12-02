% Regra: disciplina_raiz(D)
% Verdadeira se D não tem nenhum pré-requisito.
disciplina_raiz(D) :-
    disciplina(D, _, _),
    \+ prerequisito(D, _).

% Regra: disciplina_folha(D)
% Verdadeira se D não é pré-requisito de nenhuma outra disciplina.
disciplina_folha(D) :-
    disciplina(D, _, _),
    \+ prerequisito(_, D).

% Query:
% Encontre disciplinas raiz que NÃO pertencem à área aplicacoes.
% ?- disciplina_raiz(D), disciplina(D, _, Area), Area \= aplicacoes.
