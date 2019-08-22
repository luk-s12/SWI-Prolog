:-module(
            baseDeConocimientos,
            [candidato/2, persona/2, postulacionDel/2, poblacionEn/2, intencionDeVotoEn/3, promete/2, amigo/2, esImportante/1]
        ).


/*
 *    ██████╗ ██╗   ██╗███╗   ██╗████████╗ ██████╗      ██╗
 *    ██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██╔═══██╗    ███║
 *    ██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║    ╚██║
 *    ██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║     ██║
 *    ██║     ╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝     ██║
 *    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝      ╚═╝                                                         
 */


%candidato(Candidato, Partido).

candidato(linda, azul).
candidato(garrett, azul).

candidato(catherine, rojo).
candidato(claire, rojo).
candidato(frank, rojo).
candidato(catherine, rojo).

candidato(jackie, amarillo).
candidato(seth, amarillo).
candidato(heather, amarillo).

%persona(Persona, Edad).

persona(garret, 64).
persona(catherine, 59).
persona(claire, 52).
persona(frank, 50).
persona(heather, 50).
persona(jackie, 38).
persona(linda, 30).
persona(peter, 26).

%postulacionDel(Partido, Provincias).

postulacionDel(azul, [buenosAires, cacho, tierraDelFuego, sanLuis, neuquen]).
postulacionDel(rojo, [buenosAires, santaFe, cordoba, chubut, tierraDelFuego, sanLuis]).
postulacionDel(amarillo, [cacho, formosa, tucuman, salta, santaCruz, laPampa, corrientes, misiones, buenosAires]).

%poblacionEn(Provincia, Habitantes).

poblacionEn(buenosAires, 15355000).
poblacionEn(cacho, 1143201).
poblacionEn(tierraDelFuego, 160720).
poblacionEn(sanLuis, 489255).
poblacionEn(neuquen, 637913).
poblacionEn(santaFe, 3397532).
poblacionEn(cordoba, 3567654).
poblacionEn(chubut, 577466).
poblacionEn(formosa, 527895).
poblacionEn(tucuman, 1687305).
poblacionEn(salta, 1333365).
poblacionEn(santaCruz, 273964).
poblacionEn(laPampa, 349299).
poblacionEn(corrientes, 992595).
poblacionEn(misiones, 1189446).

/*
Por principio de Universo cerrado no se definieron los siguientes casos:

.-PeternoescandidatodelpartidoAmarillo
.-El partido violeta no tiene candidatos
.-Finalmente no se prentara en formosa el partido rojo

Este principio establece que todo lo que desconoce de nuestra base de conocimientos, lo considere falso.
*/

/*
 *    ██████╗ ██╗   ██╗███╗   ██╗████████╗ ██████╗     ██████╗ 
 *    ██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██╔═══██╗    ╚════██╗
 *    ██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║     █████╔╝
 *    ██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║     ╚═══██╗
 *    ██║     ╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝    ██████╔╝
 *    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝     ╚═════╝ 
                                                             
 */

%intencionDeVotoEn(Provincia, Partido, Porcentaje).

intencionDeVotoEn(buenosAires, rojo, 20).
intencionDeVotoEn(buenosAires, azul, 40).
intencionDeVotoEn(buenosAires, amarillo, 40).

intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).

intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).

intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).

intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).

intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 41).
intencionDeVotoEn(santaFe, amarillo, 39).

intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).

intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).

intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, marillo, 0).

intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).

intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).

intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).

intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).

intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).

intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).

/*
 *    ██████╗ ██╗   ██╗███╗   ██╗████████╗ ██████╗     ██╗  ██╗
 *    ██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██╔═══██╗    ██║  ██║
 *    ██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║    ███████║
 *    ██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║    ╚════██║
 *    ██║     ╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝         ██║
 *    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝          ╚═╝                                                             
 */

%esImportante(Provincia).

esImportante(buenosAires).
esImportante(cordoba).
esImportante(santaFe).

/*
 *    ██████╗ ██╗   ██╗███╗   ██╗████████╗ ██████╗     ███████╗
 *    ██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██╔═══██╗    ██╔════╝
 *    ██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║    ███████╗
 *    ██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║    ╚════██║
 *    ██║     ╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝    ███████║
 *    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝     ╚══════╝                                                             
 */

%promete(Candidato, Promesa).

promete(garrett, construir([escuela, hospital, universidad, ruta])).
promete(garrett, metaDeInflacion(18)).
promete(garrett, construir([casas, autopistas])).

promete(seth, metaDeInflacion(10)).

promete(claire, nuevosPuestosDeTrabajo(200000)).
promete(claire, nuevosPuestosDeTrabajo(520000)).
promete(claire, nuevosPuestosDeTrabajo(1000000)).
promete(claire, metaDeInflacion(4)).
promete(claire, metaDeInflacion(14)).

promete(frank, metaDeInflacion(3)).
promete(frank, metaDeInflacion(13)).
promete(frank, nuevosPuestosDeTrabajo(10000)).
promete(frank, construir([hospital, universidad])).
promete(frank, construir([plazas, autopistas, extensionSubte, repavimentacionTotal])).

/*
 *    ██████╗ ██╗   ██╗███╗   ██╗████████╗ ██████╗      ██████╗ 
 *    ██╔══██╗██║   ██║████╗  ██║╚══██╔══╝██╔═══██╗    ██╔════╝ 
 *    ██████╔╝██║   ██║██╔██╗ ██║   ██║   ██║   ██║    ███████╗ 
 *    ██╔═══╝ ██║   ██║██║╚██╗██║   ██║   ██║   ██║    ██╔═══██╗
 *    ██║     ╚██████╔╝██║ ╚████║   ██║   ╚██████╔╝    ╚██████╔╝
 *    ╚═╝      ╚═════╝ ╚═╝  ╚═══╝   ╚═╝    ╚═════╝      ╚═════╝                                                               
 */

%El primero es amigo del segundo pero NO al reves
%amigo(Candidato, OtroCandidato).

amigo(frank, claire).
amigo(claire, catherine).
amigo(catherine, jackie).

amigo(jackie, garrett).
amigo(jackie, heather).
amigo(seth, heather).


