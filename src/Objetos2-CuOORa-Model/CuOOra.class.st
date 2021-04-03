Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #accesing }
CuOOra >> agregarTopicoCon: nombre y: descripcion [
	^ (self existeElTopico: nombre)
		ifTrue: [ 'El topico ya existe' ]
		ifFalse: [ topicos add: (Topico nombre: nombre descripcion: descripcion) ]
]

{ #category : #accesing }
CuOOra >> agregarUsuarioCon: nombreDeUsuario passwd: password [
	^ (self existeElUsuario: nombreDeUsuario)
		ifTrue: [ 'El usuario ya existe' ]
		ifFalse: [ usuarios add: (Usuario nombreDeUsuario: nombreDeUsuario password: password) ]
]

{ #category : #accesing }
CuOOra >> existeElTopico: nombreDelTopico [
	^ topicos anySatisfy: [ :each | each nombre = nombreDelTopico ]
]

{ #category : #accesing }
CuOOra >> existeElUsuario: nombreDeUsuario [
	^ usuarios
		anySatisfy: [ :each | each nombreDeUsuario = nombreDeUsuario ]
]

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
CuOOra >> obtenerRespuestasDe: unUsuario [
	^ self preguntasDeLosUsuarios
		flatCollect: [ :each | each tenesUnaRespuestaDe: unUsuario nombreDeUsuario ]
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
