Class {
	#name : #DetalleUsuarioComponent,
	#superclass : #BaseComponent,
	#instVars : [
		'usuarioPosteo'
	],
	#category : #'Objetos2-CuOORa-Seaside'
}

{ #category : #'instance creation' }
DetalleUsuarioComponent class >> newCuoora: cuoora usuarioPosteo: usuario [
	^ (self new cuoora: cuoora) usuarioPosteo: usuario
]

{ #category : #private }
DetalleUsuarioComponent >> follow [
	self session user seguirA: usuarioPosteo
]

{ #category : #callbacks }
DetalleUsuarioComponent >> linkFollow: aCanvas [
	(usuarioPosteo teSigue: self session user)
		ifFalse: [ aCanvas anchor
				callback: [ self follow ];
				with: 'follow' ]
]

{ #category : #rendering }
DetalleUsuarioComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	aCanvas heading with: [ self tituloUsuario: aCanvas ].
	self respuestasDeUsuarioActual: aCanvas.
	aCanvas paragraph with: [ self volver: aCanvas ]
]

{ #category : #private }
DetalleUsuarioComponent >> respuestasDeUsuarioActual: aCanvas [
	usuarioPosteo misPreguntas
		do: [ :p | self mostrarPregunta: p con: aCanvas ]
]

{ #category : #rendering }
DetalleUsuarioComponent >> tituloUsuario: aCanvas [
	aCanvas text: 'Preguntas de ' , usuarioPosteo nombreDeUsuario , ' '.
	self linkFollow: aCanvas
]

{ #category : #accessing }
DetalleUsuarioComponent >> usuarioPosteo: unUsuario [
	usuarioPosteo := unUsuario
]
