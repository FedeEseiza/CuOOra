Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#classInstVars : [
		'cuoora',
		'pedro',
		'diego',
		'juan',
		'topicoOO1',
		'topicoTestDeUnidad',
		'topicoSmalltalk',
		'preguntaDePedro',
		'preguntaDeDiego',
		'respuestaDeDiego',
		'respuestaDePedro'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #example }
CuOOra class >> example [
	cuoora := CuOOra new.
	self exampleUsuarios .
	^ cuoora
]

{ #category : #example }
CuOOra class >> exampleUsuarios [
	cuoora agregarUsuario: 'pedro@cuoora.com' passwd: 'pedro@cuoora.com'.
	cuoora agregarUsuario: 'diego@cuoora.com' passwd: 'diego@cuoora.com'.
	cuoora agregarUsuario: 'juan@cuoora.com' passwd: 'juan@cuoora.com'
]

{ #category : #accesing }
CuOOra >> agregarTopico: nombre y: descripcion [
	 (self existeElTopico: nombre)
		ifTrue: [ ^ 'El topico ya existe' ]
		ifFalse: [ ^topicos add: (Topico nombre: nombre descripcion: descripcion) ]
]

{ #category : #accesing }
CuOOra >> agregarUsuario: nombreDeUsuario passwd: password [
	(self existeElUsuario: nombreDeUsuario)
		ifTrue: [ ^ 'El usuario ya existe' ]
		ifFalse: [ ^ usuarios
				add: (Usuario nombreDeUsuario: nombreDeUsuario password: password) ]
]

{ #category : #accesing }
CuOOra >> calcularPuntajeDe: unUsuario [
	^ (unUsuario puntajeDePreguntas)
		+ (self puntajeDeRespuestasDe: unUsuario) + (self
		puntajeDeTodasLasParticipacionesDe: unUsuario)
]

{ #category : #private }
CuOOra >> existeElTopico: nombreDelTopico [
	^ topicos anySatisfy: [ :each | each nombre = nombreDelTopico ]
]

{ #category : #private }
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
CuOOra >> obtenerRespuestasOrdenadasDeLaPregunta: unaPregunta [
	^ unaPregunta respuestasOrdenadasPorPuntaje
]

{ #category : #accesing }
CuOOra >> preguntasDeLosUsuarios [
	^ usuarios flatCollect: [ :each | each misPreguntas ]
]

{ #category : #private }
CuOOra >> puntajeDeRespuestasDe: unUsuario [
	^ (((self obtenerRespuestasDe: unUsuario)
		reject: [ :each | each pregunta creadorDelPosteo nombreDeUsuario = unUsuario nombreDeUsuario ])
		size) * 50
]

{ #category : #private }
CuOOra >> puntajeDeTodasLasParticipacionesDe: unUsuario [
	^ (unUsuario puntajeDiferenciaDePreguntas) + (self
		puntajeDiferenciaDeRespuestasDe: unUsuario)
]

{ #category : #private }
CuOOra >> puntajeDiferenciaDeRespuestasDe: unUsuario [
	^ ((self obtenerRespuestasDe: unUsuario)
		reject: [ :each | each pregunta creadorDelPosteo nombreDeUsuario = unUsuario nombreDeUsuario ])
		sumNumbers: [ :each | each mayorPuntaje ]
]

{ #category : #accesing }
CuOOra >> topicos [
	^ topicos 
]

{ #category : #accesing }
CuOOra >> usuarios [
	^ usuarios
]
