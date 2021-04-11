Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #creation }
Topico class >> nombre: unNombre descripcion: unaDescripcion [
	^ self new nombre: unNombre descripcion: unaDescripcion
]

{ #category : #accesing }
Topico >> descripcion [
	^ descripcion 
]

{ #category : #accesing }
Topico >> nombre [
	^ nombre 
]

{ #category : #accesing }
Topico >> nombre: unNombre descripcion: unaDescripcion [
	nombre := unNombre.
	descripcion := unaDescripcion
]
