% Domínio de alunos (evita gerar "alunos" inexistentes)
aluno(A) :- concluiu(A, _).

% Regra: especialista_comp(Aluno)
% Verdadeira se o aluno concluiu duas disciplinas diferentes da área computacao.
especialista_comp(Aluno) :-
    concluiu(Aluno, D1),
    concluiu(Aluno, D2),
    D1 \= D2,
    disciplina(D1, _, computacao),
    disciplina(D2, _, computacao).

% Regra: deficiencia_mat(Aluno)
% Verdadeira se o aluno NÃO concluiu nenhuma disciplina da área matematica.
deficiencia_mat(Aluno) :-
    aluno(Aluno),
    \+ (concluiu(Aluno, D), disciplina(D, _, matematica)).

% Query:
% ?- especialista_comp(Aluno), deficiencia_mat(Aluno).
