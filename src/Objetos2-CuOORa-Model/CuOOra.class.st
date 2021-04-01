Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #initialization }
CuOOra >> initialize [
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new. 
]

{ #category : #accesing }
CuOOra >> obtenerPreguntasRelacionadasA: unTopico [
	^ self preguntasDeLosUsuarios
		select: [ :each | each tenesComoTopicoA: unTopico ]
]

{ #category : #accesing }
CuOOra >> obtenerPreguntasRelevantesDe: unUsuario [
	^ self preguntasDeLosUsuarios
		select: [ :each | 
			(unUsuario teInteresaEstaPregunta: each)
				or: (each tuCreadorEsSeguidoPor: unUsuario) ]
]

{ #category : #accesing }
CuOOra >> preguntasDeLosUsuarios [
	^ usuarios flatCollect: [ :each | each misPreguntas ]
]

{ #category : #accesing }
CuOOra >> topicos [
	^ topicos 
]

{ #category : #accesing }
CuOOra >> usuarios [
	^ usuarios
]
