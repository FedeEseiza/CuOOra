Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'preguntaSmalltalk',
		'preguntaSinPuntaje',
		'userFede',
		'userNahu',
		'userPepito',
		'topicoSmalltalk',
		'topicoObj2',
		'respuestaSmalltalk'
	],
	#category : #'Objetos2-CuOORa-Test'
}

{ #category : #'private-initialization' }
PreguntaTest >> initializePreguntas [
	preguntaSmalltalk := userFede
		agregarPreguntaConTitulo: 'Smalltalk'
		descripcion: 'Como se obtiene el tamaño de una coleccion'
		topicos: (OrderedCollection with:topicoSmalltalk).
	preguntaSinPuntaje := userNahu
		agregarPreguntaConTitulo: 'Que es seaside?'
		descripcion: 'Definicion de seaside'
		topicos: (OrderedCollection with: topicoObj2)
]

{ #category : #'private-initialization' }
PreguntaTest >> initializeTopicos [
	topicoSmalltalk := Topico nombre: 'Smalltalk' descripcion: 'xxx' .
	topicoObj2 := Topico nombre: 'Objetos 2' descripcion: 'yyy'.
]

{ #category : #'private-initialization' }
PreguntaTest >> initializeUsuarios [
	userFede := Usuario nombreDeUsuario:'Fede' password:'xxx' .
	userNahu := Usuario nombreDeUsuario:'Nahu' password:'yyy' .
	userPepito := Usuario nombreDeUsuario:'Pepito' password:'zzz' .
]

{ #category : #running }
PreguntaTest >> setUp [
	self initializeUsuarios .
	self initializeTopicos .
	self initializePreguntas 

]

{ #category : #'test-respuestas' }
PreguntaTest >> testAgregarRespuestas [
	self assert: (preguntaSmalltalk respuestas size) equals: 0.
	preguntaSmalltalk
		agregarRespuesta:
			(Respuesta
				texto: 'Lenguaje puro orientado a ojetos'
				usuario: userFede
				deLaPregunta: preguntaSmalltalk).
	self assert: (preguntaSmalltalk respuestas size) equals: 1.
]

{ #category : #'test-puntaje' }
PreguntaTest >> testMayorPuntaje [
	self assert: preguntaSinPuntaje mayorPuntaje equals: 0.
	preguntaSmalltalk registrarDislikeDe: userFede.
	self assert: preguntaSmalltalk mayorPuntaje equals: -1
]

{ #category : #'test-like-dislike' }
PreguntaTest >> testRegistrarLikeODislike [
	preguntaSmalltalk registrarLikeDe: userFede.
	self assert: preguntaSmalltalk cantidadDeLikes equals: 1.
	preguntaSmalltalk registrarLikeDe: userFede.
	self assert: preguntaSmalltalk cantidadDeLikes equals: 1.
	preguntaSmalltalk registrarDislikeDe: userFede.
	self assert: preguntaSmalltalk cantidadDeLikes equals: 0.
	self assert: preguntaSmalltalk cantidadDeDislikes equals: 1.
	preguntaSmalltalk registrarDislikeDe: userFede.
	self assert: preguntaSmalltalk cantidadDeDislikes equals: 1
]

{ #category : #'test-topico' }
PreguntaTest >> testTenesComoTopicoA [
	self
		assert: (preguntaSmalltalk tenesComoTopicoA: topicoSmalltalk)
		equals: true.
	self
		assert: (preguntaSmalltalk tenesComoTopicoA: topicoObj2)
		equals: false
]
