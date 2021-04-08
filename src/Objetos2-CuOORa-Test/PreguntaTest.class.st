Class {
	#name : #PreguntaTest,
	#superclass : #TestCase,
	#instVars : [
		'preguntaSmalltalk',
		'userFede'
	],
	#category : #'Objetos2-CuOORa-Test'
}

{ #category : #'private-initialization' }
PreguntaTest >> initializeUsuarios [
	userFede := Usuario nombreDeUsuario:'Fede' password:'xxx' 
]

{ #category : #running }
PreguntaTest >> setUp [
	self initializeUsuarios 

]
