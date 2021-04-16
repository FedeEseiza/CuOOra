Class {
	#name : #Respuesta,
	#superclass : #Posteo,
	#instVars : [
		'texto',
		'pregunta'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #creation }
Respuesta class >> texto: unTexto usuario: unUsuario deLaPregunta: unaPregunta [ .
	^ self new texto: unTexto usuario: unUsuario deLaPregunta: unaPregunta .
]

{ #category : #initialization }
Respuesta >> initialize [
	super initialize
]

{ #category : #accessing }
Respuesta >> pregunta [ 	
	^ pregunta 
]

{ #category : #accessing }
Respuesta >> texto [
	^ texto
]

{ #category : #accessing }
Respuesta >> texto: unTexto usuario: unUsuario deLaPregunta: unaPregunta [ .
	texto := unTexto.
	creadorDelPosteo := unUsuario.
	pregunta := unaPregunta 
]
