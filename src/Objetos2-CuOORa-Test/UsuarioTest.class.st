Class {
	#name : #UsuarioTest,
	#superclass : #TestCase,
	#instVars : [
		'userFede',
		'userNahu',
		'topicoSmalltalk'
	],
	#category : #'Objetos2-CuOORa-Test'
}

{ #category : #'private-initialization' }
UsuarioTest >> initializeTopicos [ 
	topicoSmalltalk := Topico nombre: 'Smalltalk' descripcion: 'xxx' 
]

{ #category : #'private-initialization' }
UsuarioTest >> initializeUsuarios [ 
	userFede := Usuario nombreDeUsuario: 'Fede' password: 'xxx'.
	userNahu := Usuario nombreDeUsuario: 'Nahu' password: 'zzz'.
]

{ #category : #running }
UsuarioTest >> setUp [
	self initializeUsuarios.
	self initializeTopicos 
]

{ #category : #'test-preguntas' }
UsuarioTest >> testAgregarPreguntas [
	self assert: userFede misPreguntas size equals: 0.
	userFede
		agregarPreguntaConTitulo: 'Smalltalk'
		descripcion: 'xxx'
		topicos: (OrderedCollection with:topicoSmalltalk).
	self assert: userFede misPreguntas first titulo equals: 'Smalltalk'
]

{ #category : #'test-topicos' }
UsuarioTest >> testAgregarTropicoDeInteres [
	self assert: userFede topicosDeInteres size equals: 0.
	userFede agregarTopicoDeInteres: topicoSmalltalk.
	self
		assert: userFede topicosDeInteres first nombre
		equals: 'Smalltalk'
]

{ #category : #'test-followers' }
UsuarioTest >> testSeguirA [
	self assert: (userFede teSigue: userNahu) equals: false.
	userNahu seguirA: userFede.
	self assert: (userFede teSigue: userNahu) equals: true
]
