% Regra auxiliar:
% falta_concluir(Aluno, Disciplina) é verdadeira se Disciplina é pré-requisito de alguma matéria
% e o aluno ainda não concluiu Disciplina.
falta_concluir(Aluno, Disciplina) :-
    prerequisito(_, Disciplina),
    \+ concluiu(Aluno, Disciplina).

% Auxiliar: verifica se o aluno concluiu TODOS os pré-requisitos diretos de uma disciplina D.
todos_prereqs_concluidos(Aluno, D) :-
    \+ (prerequisito(D, P), \+ concluiu(Aluno, P)).

% Regra principal:
% aluno_apto(Aluno, Disciplina) é verdadeira se:
% - Disciplina não é da área fundamental
% - Aluno ainda não concluiu a própria Disciplina
% - Aluno concluiu todos os pré-requisitos diretos
aluno_apto(Aluno, Disciplina) :-
    disciplina(Disciplina, _, Area),
    Area \= fundamental,
    \+ concluiu(Aluno, Disciplina),
    todos_prereqs_concluidos(Aluno, Disciplina).

% Queries:
% ?- aluno_apto(joao, D).
% ?- aluno_apto(maria, inteligencia_artificial).
