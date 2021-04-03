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

{ #category : #initialization }
Pregunta >> initialize [ 
	fechaYHoraDeCreacion := Date today.
	respuestas := OrderedCollection new.
	
]

{ #category : #accesing }
Pregunta >> newPreguntaConTitulo: unTitulo descripcion: unaDescripcion topico: unTopico usuario: unUsuario [
	titulo := unTitulo.
	descripcion := unaDescripcion.
	topicos add: unTopico.
	creadorDelPosteo := unUsuario
]

{ #category : #accesing }
Pregunta >> respuestasOrdenadasPorPuntaje [
	^ respuestas
		asSortedCollection: [ :a :b | a mayorPuntaje > b mayorPuntaje ]
]

{ #category : #accesing }
Pregunta >> tenesComoTopicoA: unTopico [
	^ topicos anySatisfy: [ :each | each nombre ]
]

{ #category : #accesing }
Pregunta >> tenesUnaRespuestaDe: nombreDeUsuario [
	^ respuestas
		select: [ :each | each creadorDelPosteo = nombreDeUsuario ]
]
