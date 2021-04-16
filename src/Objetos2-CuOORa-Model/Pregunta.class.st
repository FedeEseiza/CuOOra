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
Pregunta class >> newPreguntaConTitulo: unTitulo descripcion: unaDescripcion topicos: unosTopicos usuario: unUsuario [
	^ self new
		newPreguntaConTitulo: unTitulo
		descripcion: unaDescripcion
		topicos: unosTopicos
		usuario: unUsuario
]

{ #category : #accesing }
Pregunta >> agregarRespuesta: unaRespuesta [
	^ respuestas add: unaRespuesta
]

{ #category : #accesing }
Pregunta >> agregarTopico: topico [
	topicos add: topico
]

{ #category : #private }
Pregunta >> eliminarDatos [
	creadorDelPosteo borrarPregunta: self
]

{ #category : #initialization }
Pregunta >> initialize [
	respuestas := OrderedCollection new.
	super initialize
]

{ #category : #'instance creation' }
Pregunta >> newPreguntaConTitulo: unTitulo descripcion: unaDescripcion topicos: unosTopicos usuario: unUsuario [
	titulo := unTitulo.
	descripcion := unaDescripcion.
	topicos := unosTopicos.
	creadorDelPosteo := unUsuario
]

{ #category : #accesing }
Pregunta >> nombreDeTopicos [
	^ topicos collect: [ :topico | topico nombre ]
]

{ #category : #accessing }
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

{ #category : #accessing }
Pregunta >> topicos [
	^ topicos
]
