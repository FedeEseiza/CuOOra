Class {
	#name : #Pregunta,
	#superclass : #Posteo,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos',
		'respuestas'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #creation }
Pregunta class >> newPreguntaConTitulo: unTitulo descripcion: unaDescripcion topico: unTopico usuario: unUsuario [
	^ self new
		newPreguntaConTitulo: unTitulo
		descripcion: unaDescripcion
		topico: unTopico
		usuario: unUsuario
]

{ #category : #accesing }
Pregunta >> agregarRespuesta: unaRespuesta [
	^ respuestas add: unaRespuesta
]

{ #category : #initialization }
Pregunta >> initialize [ 
	respuestas := OrderedCollection new.
	topicos := OrderedCollection new. 
	super initialize .
	
]

{ #category : #accesing }
Pregunta >> newPreguntaConTitulo: unTitulo descripcion: unaDescripcion topico: unTopico usuario: unUsuario [
	titulo := unTitulo.
	descripcion := unaDescripcion.
	topicos add: unTopico.
	creadorDelPosteo := unUsuario
]

{ #category : #accesing }
Pregunta >> respuestas [ 
	^ respuestas 
]

{ #category : #accesing }
Pregunta >> respuestasOrdenadasPorPuntaje [
	^ respuestas
		asSortedCollection: [ :a :b | a mayorPuntaje > b mayorPuntaje ]
]

{ #category : #accesing }
Pregunta >> tenesComoTopicoA: unTopico [
	^ topicos anySatisfy: [ :each | each nombre = unTopico nombre]
]

{ #category : #accesing }
Pregunta >> tenesUnaRespuestaDe: nombreDeUsuario [
	^ respuestas
		select: [ :each | each creadorDelPosteo nombreDeUsuario  = nombreDeUsuario ]
]

{ #category : #accesing }
Pregunta >> titulo [
	^ titulo 
]
