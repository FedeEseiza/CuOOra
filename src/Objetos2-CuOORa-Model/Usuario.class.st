Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'topicosDeInteres',
		'follows',
		'followers',
		'preguntas',
		'nombreDeUsuario',
		'password'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #accesing }
Usuario >> agregarPregunta: unaPregunta [
	preguntas add: unaPregunta
]

{ #category : #accesing }
Usuario >> agregarSeguidor: unUsuario [
	followers add: unUsuario
]

{ #category : #initialization }
Usuario >> initialize [
	followers := OrderedCollection new.
	follows := OrderedCollection new.
	preguntas := OrderedCollection new.
	topicosDeInteres := OrderedCollection new
]

{ #category : #accesing }
Usuario >> misPreguntas [
	^ preguntas 
]

{ #category : #accesing }
Usuario >> nombreDeUsuario [
	^ nombreDeUsuario 
]

{ #category : #accesing }
Usuario >> seguirA: unUsuario [
	follows add: unUsuario.
	unUsuario agregarSeguidor: self
]

{ #category : #accesing }
Usuario >> teInteresaEstaPregunta: unaPregunta [
	^ topicosDeInteres
		anySatisfy: [ :each | unaPregunta tenesComoTopicoA: each ]
]

{ #category : #accesing }
Usuario >> teSigue: unUsuario [
	^ followers
		anySatisfy: [ :each | each nombreDeUsuario = unUsuario nombreDeUsuario ]
]
