:- include(democracia).

:- begin_tests(provinciaPicante).

    test(provincia_picante, nondet):- 
        esPicante(buenosAires).
    
    test(provincia_NO_picante_un_solo_partido_se_presenta, fail):- 
        esPicante(santaFe).
    
    test(provincia_NO_picante_por_no_cumplir_con_la_cantidad_de_habitantes, fail):- 
        esPicante(sanLuis).

:- end_tests(provinciaPicante).


:- begin_tests(ganador).
    
    test(gana_el_candidato_que_tiene_mas_voto_compitiendo_ambos_en_la_misma_provincia, nondet):-
        leGanaA(frank, garrett, tierraDelFuego).
    
    test(gana_el_candidato_que_se_presenta_en_la_provincia, nondet):-
        leGanaA(frank, jackie, santaFe).
    
    test(gana_el_candidato_que_NO_se_presenta_en_la_provincia, fail):-
        leGanaA(claire,jackie, misiones).
    
    test(gana_el_candidato_por_competir_con_otro_del_mismo_partido_y_en_la_misma_provincia, nondet):- 
        leGanaA(frank, claire, tierraDelFuego).
    
    test(ambos_candidatos_empatan_en_votos_en_la_provincia, fail):-
        leGanaA(heather, linda, buenosAires).
    

:- end_tests(ganador).


:- begin_tests(partidoHegemonico).
    
    test(es_favorito_en_una_provincia_pero_no_el_las_otras, fail):-
        partidoHegemonico(amarillo).

    test(el_partido_es_hegemonico_por_ser_favorito_en_alguna_provincia_importante, (set(Cual = [azul]))):-
        partidoHegemonico(Cual).

    test(el_partido_gana_en_otras_provincias_pero_no_son_favoritas, fail):-
        partidoHegemonico(rojo).

:- end_tests(partidoHegemonico).


:- begin_tests(promesas).
    
    test(candidato_vende_humo_de_las_3_promesas_que_promete_solo_2_son_realizable, fail):-
        esSerio(garret).
    
    test(candidato_vende_humo_solo_promete_una_promesa_realizable, fail):-
        esSerio(seth).
    
    test(candidato_prometedor, nondet):-
        esSerio(claire).
    
    test(candidato_vende_humo_de_las_5_promesas_que_promete_solo_2_son_realizable, fail):-
        esSerio(frank).

:- end_tests(promesas).


:- begin_tests(pancakes).

    test(candidato_panquequeable, (set( Cual = [catherine, frank, jackie, claire])) ):-
        esPanquequeable(Cual).

    test(candidato_panquequeable_por_ser_amigo_de_un_candidato_rival, nondet):-
        esPanquequeable(catherine).

    test(candidato_panquequeable_por_ser_amigo_de_un_candidato_del_mismo_partido_que_es_panquequeable, nondet):-
        esPanquequeable(frank).

:- end_tests(pancakes).
