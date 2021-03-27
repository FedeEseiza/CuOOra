Class {
	#name : #Posteo,
	#superclass : #Object,
	#instVars : [
		'creadorDelPosteo',
		'fechaYHoraDeCreacion'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #accesing }
Posteo >> tuCreadorEsSeguidoPor: unUsuario [ 
	^ (creadorDelPosteo teSigue: unUsuario )
]
