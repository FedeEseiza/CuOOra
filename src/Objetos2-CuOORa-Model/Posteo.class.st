Class {
	#name : #Posteo,
	#superclass : #Object,
	#instVars : [
		'creadorDelPosteo',
		'fechaYHoraDeCreacion',
		'puntuaciones'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #accesing }
Posteo >> agregarPuntuacionLikeDe: unUsuario [
	puntuaciones add: (Puntuacion puntuador: unUsuario esLike: True)
]

{ #category : #accesing }
Posteo >> cambiarPuntuacion: unUsuario [
	puntuaciones remove: (self obtenerLikeODislikeDe: unUsuario)
]

{ #category : #accesing }
Posteo >> cantidadDeDislikes [
	^ (puntuaciones reject: [ :each | each esLike ]) size
]

{ #category : #accesing }
Posteo >> cantidadDeLikes [
	^ (puntuaciones select: [ :each | each esLike ]) size
]

{ #category : #accesing }
Posteo >> creadorDelPosteo [
	^ creadorDelPosteo
]

{ #category : #initialization }
Posteo >> initialize [ 
	fechaYHoraDeCreacion := DateAndTime .
	puntuaciones := OrderedCollection new.
]

{ #category : #accesing }
Posteo >> mayorPuntaje [
	^ self cantidadDeLikes - self cantidadDeDislikes
]

{ #category : #accesing }
Posteo >> obtenerLikeODislikeDe: unUsuario [
	^ puntuaciones
		select: [ :each | each puntuador = unUsuario nombreDeUsuario ]
]

{ #category : #accesing }
Posteo >> registrarLikeDe: unUsuario [
	(self tenesPuntuacionDe: unUsuario)
		ifFalse: [ self agregarPuntuacionLikeDe: unUsuario ]
		ifTrue: [ self cambiarPuntuacion: unUsuario.
			self agregarPuntuacionLikeDe: unUsuario ]
]

{ #category : #accesing }
Posteo >> tenesPuntuacionDe: unUsuario [
	^ puntuaciones
		anySatisfy: [ :each | each puntuador = unUsuario nombreDeUsuario ]
]

{ #category : #accesing }
Posteo >> tuCreadorEsSeguidoPor: unUsuario [ 
	^ (creadorDelPosteo teSigue: unUsuario )
]
