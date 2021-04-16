Class {
	#name : #Puntuacion,
	#superclass : #Object,
	#instVars : [
		'puntuador',
		'esLike',
		'fechaYHora'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #creation }
Puntuacion class >> puntuador: unUsuario esLike: boolean [
	^ self new puntuador: unUsuario esLike: boolean
]

{ #category : #accessing }
Puntuacion >> esLike [
	^ esLike
]

{ #category : #initialization }
Puntuacion >> initialize [
	fechaYHora := DateAndTime now
]

{ #category : #accessing }
Puntuacion >> puntuador [
	^ puntuador 
]

{ #category : #accessing }
Puntuacion >> puntuador: unUsuario esLike: boolean [
	puntuador := unUsuario.
	esLike := boolean
]
