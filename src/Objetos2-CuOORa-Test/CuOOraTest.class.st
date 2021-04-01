Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'userFede',
		'userNahu'
	],
	#category : #'Objetos2-CuOORa-Test'
}

{ #category : #'private-initialization' }
CuOOraTest >> initializeUsuarios [
	userFede := Usuario nombreDeUsuario: 'Fede' password: 'xxx'.
	userNahu := Usuario nombreDeUsuario: 'Nahu' password: 'yyy'
]

{ #category : #running }
CuOOraTest >> setUp [
	cuoora := CuOOra new.
	self initializeUsuarios
]

{ #category : #'private-initialization' }
CuOOraTest >> testConstructor [
	self assert: CuOOra new usuarios isEmpty.
	self assert: CuOOra new topicos isEmpty
]
