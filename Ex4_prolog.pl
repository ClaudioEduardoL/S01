% =========================
% BD - Divindades (com Hades)
% =========================

% Fatos: Progenitores (pai_ou_mae, filho) - HIERARQUIA AMPLIADA
progenitor(urano, cronos).
progenitor(gaia, cronos).
progenitor(urano, oceano).
progenitor(gaia, oceano).
progenitor(cronos, zeus).
progenitor(reia, zeus).
progenitor(cronos, poseidon).
progenitor(reia, poseidon).

% (ADICIONADO) Hades é filho de Cronos e Reia
progenitor(cronos, hades).
progenitor(reia, hades).

progenitor(zeus, atena).
progenitor(zeus, apolo).
progenitor(hera, apolo).
progenitor(zeus, artemis).
progenitor(leto, artemis).
progenitor(zeus, ares).
progenitor(hera, ares).
progenitor(zeus, hefesto).
progenitor(hera, hefesto).
progenitor(poseidon, tritao).
progenitor(zeus, perseu). % Herói, filho de um deus
progenitor(danae, perseu).
progenitor(atena, erictônio).

% Fatos: Poderes e Domínios
dominio(zeus, ceu).
dominio(zeus, trovao).
dominio(poseidon, mar).
dominio(poseidon, terremoto).
dominio(hades, submundo).
dominio(atena, sabedoria).
dominio(atena, guerra_estrategica).
dominio(ares, guerra_brutal).
dominio(apolo, sol).
dominio(apolo, musica).
dominio(artemis, caca).
dominio(artemis, lua).
dominio(hefesto, fogo).
dominio(hefesto, forja).
dominio(afrodite, beleza).
dominio(afrodite, amor).
dominio(cronos, tempo).

% Fatos: Armas e Artefatos (deus, arma)
arma(zeus, raio).
arma(poseidon, tridente).
arma(hades, elmo_escuridao).
arma(atena, escudo_aegis).
arma(perseu, espada_adamantina).

% Fatos: Características e Títulos (deus, caracteristica)
caracteristica(zeus, rei).
caracteristica(hera, rainha).
caracteristica(hades, invisivel).
caracteristica(hefesto, ferreiro).
caracteristica(artemis, virgem).
caracteristica(perseu, mortal).

% Fatos: Relações de Aliança (Aliança é simétrica)
aliado(zeus, poseidon).
aliado(poseidon, zeus).
aliado(atena, apolo).
aliado(apolo, atena).
aliado(ares, hades).
aliado(hades, ares).
aliado(hefesto, atena).
aliado(atena, hefesto).

% Fatos: Localização ou Assinatura
local_principal(zeus, olimpo).
local_principal(poseidon, atlantida).
local_principal(hades, submundo).
local_principal(apolo, olimpo).
local_principal(artemis, florestas).

% =========================
% Regra pedida
% =========================
% Verdadeira SE:
% - Deus for filho de Cronos
% - e tiver domínio ceu OU mar OU submundo
divindade_olimpica(Deus) :-
    progenitor(cronos, Deus),
    ( dominio(Deus, ceu)
    ; dominio(Deus, mar)
    ; dominio(Deus, submundo)
    ).
% Deus é "maior" se:
% - habita o olimpo
% - e possui pelo menos 2 domínios diferentes cadastrados
deus_maior(Deus) :-
    local_principal(Deus, olimpo),
    dominio(Deus, D1),
    dominio(Deus, D2),
    D1 \= D2.
% Irmãos germanos: mesmo pai e mesma mãe (e pessoas diferentes)
irmaos_germanos(A, B) :-
    progenitor(Pai, A),
    progenitor(Pai, B),
    progenitor(Mae, A),
    progenitor(Mae, B),
    Pai \= Mae,
    A \= B.
% Exercício 4 - Ancestralidade
% Caso base: A é ancestral de D se A é progenitor de D
ancestral(A, D) :-
    progenitor(A, D).

% Passo recursivo: A é ancestral de D se A é progenitor de Z e Z é ancestral de D
ancestral(A, D) :-
    progenitor(A, Z),
    ancestral(Z, D).



