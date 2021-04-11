Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'topicosDeInteres',
		'follows',
		'followers',
		'preguntas',
		'nombreDeUsuario',
		'password'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #creation }
Usuario class >> nombreDeUsuario: unNombre password: pass [
	^ self new nombreDeUsuario: unNombre password: pass
]

{ #category : #accesing }
Usuario >> agregarPreguntaConTitulo: unTitulo descripcion: unaDescripcion topico: unTopico [
	^ preguntas
		add:
			(Pregunta
				newPreguntaConTitulo: unTitulo
				descripcion: unaDescripcion
				topico: unTopico
				usuario: self)
]

{ #category : #accesing }
Usuario >> agregarRespuestaDeLaPregunta: unaPregunta texto: unTexto [
	^ unaPregunta
		agregarRespuesta: (Respuesta texto: unTexto usuario: self deLaPregunta: unaPregunta)
]

{ #category : #private }
Usuario >> agregarSeguidor: unUsuario [
	followers add: unUsuario
]

{ #category : #accesing }
Usuario >> agregarTopicoDeInteres: topico [
	topicosDeInteres add: topico
]

{ #category : #initialization }
Usuario >> initialize [
	followers := OrderedCollection new.
	preguntas := OrderedCollection new.
	topicosDeInteres := OrderedCollection new
]

{ #category : #accesing }
Usuario >> misPreguntas [
	^ preguntas 
]

{ #category : #accesing }
Usuario >> nombreDeUsuario [
	^ nombreDeUsuario 
]

{ #category : #accesing }
Usuario >> nombreDeUsuario: unNombre password: pass [
	nombreDeUsuario := unNombre.
	password := pass
]

{ #category : #private }
Usuario >> puntajeDePreguntas [
	^ (self misPreguntas size) * 20
]

{ #category : #private }
Usuario >> puntajeDiferenciaDePreguntas [
	^ self misPreguntas sumNumbers: [ :each | each mayorPuntaje ]
]

{ #category : #accesing }
Usuario >> seguirA: unUsuario [
	unUsuario agregarSeguidor: self
]

{ #category : #private }
Usuario >> teInteresaEstaPregunta: unaPregunta [
	^ topicosDeInteres
		anySatisfy: [ :each | unaPregunta tenesComoTopicoA: each ]
]

{ #category : #accesing }
Usuario >> teSigue: unUsuario [
	^ followers
		anySatisfy: [ :each | each nombreDeUsuario = unUsuario nombreDeUsuario ]
]

{ #category : #accesing }
Usuario >> topicosDeInteres [
	^ topicosDeInteres 
]
