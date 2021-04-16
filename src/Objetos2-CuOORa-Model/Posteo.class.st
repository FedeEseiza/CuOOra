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
Posteo >> agregarPuntuacionDe: unUsuario esLike: boolean [
	puntuaciones add: (Puntuacion puntuador: unUsuario esLike: boolean)
]

{ #category : #accesing }
Posteo >> cambiarPuntuacionDe: unUsuario esLike: boolean [
	puntuaciones remove: (self obtenerLikeODislikeDe: unUsuario).
	self agregarPuntuacionDe: unUsuario esLike: boolean
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

{ #category : #accessing }
Posteo >> fechaYHoraDeCreacion [
	^ fechaYHoraDeCreacion
]

{ #category : #initialization }
Posteo >> initialize [
	fechaYHoraDeCreacion := DateAndTime now.
	puntuaciones := OrderedCollection new
]

{ #category : #accesing }
Posteo >> mayorPuntaje [
	^ self cantidadDeLikes - self cantidadDeDislikes
]

{ #category : #accesing }
Posteo >> obtenerLikeODislikeDe: unUsuario [
	^ puntuaciones
		detect: [ :each | each puntuador nombreDeUsuario = unUsuario nombreDeUsuario ]
]

{ #category : #accesing }
Posteo >> obtenerPuntuacionDe: unUsuario [
	^ (puntuaciones
		detect: [ :each | each puntuador nombreDeUsuario = unUsuario nombreDeUsuario ])
		esLike
]

{ #category : #accesing }
Posteo >> registrarDislikeDe: unUsuario [
	(self tenesPuntuacionDe: unUsuario)
		ifFalse: [ self agregarPuntuacionDe: unUsuario esLike: false ]
		ifTrue: [ (self obtenerPuntuacionDe: unUsuario)
				ifTrue: [ self cambiarPuntuacionDe: unUsuario esLike: false ] ]
]

{ #category : #accesing }
Posteo >> registrarLikeDe: unUsuario [
	(self tenesPuntuacionDe: unUsuario)
		ifFalse: [ self agregarPuntuacionDe: unUsuario esLike: true ]
		ifTrue: [ (self obtenerPuntuacionDe: unUsuario)
				ifFalse: [ self cambiarPuntuacionDe: unUsuario esLike: true ] ]
]

{ #category : #accesing }
Posteo >> tenesPuntuacionDe: unUsuario [
	^ puntuaciones
		anySatisfy: [ :each | each puntuador nombreDeUsuario = unUsuario nombreDeUsuario ]
]

{ #category : #accesing }
Posteo >> tuCreadorEsSeguidoPor: unUsuario [ 
	^ (creadorDelPosteo teSigue: unUsuario )
]
