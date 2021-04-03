Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descipcion'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #creation }
Topico class >> nombre: unNombre descripcion: unaDescripcion [
	^ self new nombre: unNombre descripcion: unaDescripcion
]

{ #category : #accesing }
Topico >> nombre [
	^ nombre 
]

{ #category : #accesing }
Topico >> nombre: unNombre descripcion: unaDescripcion [
	nombre := unNombre.
	descipcion := unaDescripcion
]
