:- use_module(baseDeConocimientos).

/*
 *    ██████╗ ██╗   ██╗███╗   ██╗████████╗ ██████╗     ██████╗ 
 *    ██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██╔═══██╗    ╚════██╗
 *    ██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║     █████╔╝
 *    ██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║    ██╔═══╝ 
 *    ██║     ╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝    ███████╗
 *    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝     ╚══════╝                                                             
 */

%Es picante la provincia si los partidos que se presentan en ella,  son rivales y la cantidad de habitantes supera 1000k
esPicante(Provincia):-
    sonRivales(_, _, Partido, OtroPartido),
    ambosSePresentan(Partido, OtroPartido, Provincia),
    esPoblado(Provincia).

esPoblado(Provincia):-
    poblacionEn(Provincia, Habitantes),
    Habitantes > 1000000.

ambosSePresentan(Partido, OtroPartido, Provincia):-
    compiteEnLa(Provincia, Partido),
    compiteEnLa(Provincia, OtroPartido).

compiteEnLa(Provincia, Partido):-
    postulacionDel(Partido, Provincias),
    member(Provincia, Provincias).

sonRivales(Candidato, OtroCandidato, Partido, OtroPartido):-
    candidato(Candidato, Partido),
    candidato(OtroCandidato, OtroPartido),
    Partido \= OtroPartido,
    Candidato \= OtroCandidato.

/*
 *    ██████╗ ██╗   ██╗███╗   ██╗████████╗ ██████╗     ██████╗ 
 *    ██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██╔═══██╗    ╚════██╗
 *    ██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║     █████╔╝
 *    ██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║     ╚═══██╗
 *    ██║     ╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝    ██████╔╝
 *    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝     ╚═════╝                                                              
 */



%Gana el partido que obtuvo el mayor porcentaje en esa provincia. Los partidos deben ser diferentes y
% deben competir en la misma provincia.
leGanaA(Candidato, OtroCandidato, Provincia):-
    sonRivales(Candidato, OtroCandidato, Partido, OtroPartido),
    ambosSePresentan(Partido, OtroPartido, Provincia),
    tieneMasVotos(Partido, OtroPartido, Provincia).



%Gana el partido que se presenta en la provincia. Ambos partidos deben ser rivales
leGanaA(Candidato, OtroCandidato, Provincia):-
    sonRivales(Candidato, OtroCandidato, Partido, OtroPartido),
    compiteEnLa(Provincia, Partido),
    not(compiteEnLa(Provincia, OtroPartido)).   


%Gana el partido si se presenta en la provincia. Debe ser el mismo partido para diferente candidatos
leGanaA(Candidato, OtroCandidato, Provincia):-
    sonDelMismoPartido(Candidato, OtroCandidato, Partido),
    compiteEnLa(Provincia, Partido).


tieneMasVotos(Partido, OtroPartido, Provincia):-
    intencionDeVotoEn(Provincia, Partido, Porcentaje),
    intencionDeVotoEn(Provincia, OtroPartido, OtroPorcentaje),
    Porcentaje > OtroPorcentaje.

sonDelMismoPartido(Candidato, OtroCandidato, Partido):-
    candidato(Candidato, Partido),
    candidato(OtroCandidato, Partido),
    Candidato \= OtroCandidato.


/*
 *    ██████╗ ██╗   ██╗███╗   ██╗████████╗ ██████╗     ██╗  ██╗
 *    ██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██╔═══██╗    ██║  ██║
 *    ██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║    ███████║
 *    ██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║    ╚════██║
 *    ██║     ╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝         ██║
 *    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝          ╚═╝                                                           
 */

% Es un partido hegemonico si es favorito en esa provincia. La provincia es importante en buenos aires, cordoba y santa fe.  
partidoHegemonico(Partido):-
    postulacionDel(Partido, _),
    forall(esImportante(Provincia), esFavoritaEl(Partido, Provincia)).
 

% Es favorito el partido en una provincia, si le gana o empata con el porcentaje de votos a todos los otros partidos
esFavoritaEl(Partido, Provincia):-
    intencionDeVotoEn(Provincia, Partido, Porcentaje),
    forall((intencionDeVotoEn(Provincia, OtroPartido, OtroPorcentaje), Partido \= OtroPartido), Porcentaje >= OtroPorcentaje).


/*

¿cuáles son los casos de equivalencia que surgen?

Serian los casos a donde debemos probar si un partido es hegemonico o no.


¿Cómo podemos testear los que no son partidos hegemónicos, qué conceptos
aparecen?

Haciendo un test existencial, por lo tanto establecemos los valores a los cual se puede unificar la variable
por ser el predicado inversible. Y aquellos valores a los que no se pueda unificar porque no cumple con
los requisitos del predicado , sabremos que son los partidos NO hegemononicos. 

*/

/*
 *    ██████╗ ██╗   ██╗███╗   ██╗████████╗ ██████╗     ███████╗
 *    ██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██╔═══██╗    ██╔════╝
 *    ██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║    ███████╗
 *    ██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║    ╚════██║
 *    ██║     ╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝    ███████║
 *    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝     ╚══════╝                                                             
 */

%Es serio el candidato, si el candidato promete al menos 3 promesas realizables
esSerio(Candidato):-
    promete(Candidato, _),
    findall(Promesa, ( promete(Candidato, Promesa), esRealizable(promete(Candidato,Promesa)) ), Promesas),
    length(Promesas, Cantidad),
    Cantidad >= 3.

% Es realizable la promesa, si promete que la inflacion es menor al 10%
esRealizable(promete(_, metaDeInflacion(Porcentaje))):- Porcentaje < 10.

%Es realizable la promesa, si en las cosas que promete no se encuentra una universidad y la cantidad sea menor a 3.
esRealizable(promete(_, construir(Cosas))):-
    not(member(universidad, Cosas)),
    length(Cosas, Cantidad),
    Cantidad < 3.

%Es realizable la promesa, si promete la misma o menos la cantidad de su edad * 10k sobre los puestos de trabajo.
esRealizable(promete(Candidato, nuevosPuestosDeTrabajo(Puestos))):-
    persona(Candidato, Edad),
    PuedePrometer is Edad * 10000,
    Puestos =< PuedePrometer.

/*
 *    ██████╗ ██╗   ██╗███╗   ██╗████████╗ ██████╗      ██████╗ 
 *    ██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██╔═══██╗    ██╔════╝ 
 *    ██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║    ███████╗ 
 *    ██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║    ██╔═══██╗
 *    ██║     ╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝    ╚██████╔╝
 *    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝      ╚═════╝                                                               
 */

%Es panquequeable un candidato si es amigo de otro candidato de otro partido o es amigo 
%de un candidato del mismo partido y este es paquequeable.

esPanquequeable(Candidato):- 
    amigo(Candidato, OtroCandidato),
    sonRivales(Candidato, OtroCandidato, _, _).

esPanquequeable(Candidato):-
    amigo(Candidato, CandidatoDelMismoPartido),
    esPanquequeable(CandidatoDelMismoPartido). 




