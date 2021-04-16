Class {
	#name : #CuOOra,
	#superclass : #Object,
	#instVars : [
		'usuarios',
		'topicos'
	],
	#classInstVars : [
		'soleInstance',
		'cuoora',
		'pedro',
		'diego',
		'juan',
		'preguntaDePedro',
		'preguntaDeDiego',
		'respuestaDeDiego',
		'respuestaDePedro',
		'topicoTestDeUnidad',
		'topicoSmalltalk',
		'topicoOO1'
	],
	#category : #'Objetos2-CuOORa-Model'
}

{ #category : #'as yet unclassified' }
CuOOra class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #example }
CuOOra class >> example [
	cuoora := CuOOra new.
	self exampleUsuarios.
	self exampleTopicos.
	self examplePreguntas.
	self exampleRespuestas.
	juan seguirA: diego.
	pedro seguirA: juan.
	^ cuoora
]

{ #category : #'as yet unclassified' }
CuOOra class >> examplePreguntas [
	preguntaDePedro := pedro
		agregarPreguntaConTitulo: '¿Para qué sirve el método SetUp?'
		descripcion: ''
		topicos: (OrderedCollection with: topicoOO1 with: topicoTestDeUnidad).
	preguntaDeDiego := diego
		agregarPreguntaConTitulo: '¿Qué significa #messageNotUnderstood?'
		descripcion: ''
		topicos: (OrderedCollection with: topicoOO1 with: topicoSmalltalk)
]

{ #category : #'as yet unclassified' }
CuOOra class >> exampleRespuestas [
	respuestaDeDiego := diego
		agregarRespuestaDeLaPregunta: preguntaDePedro
		texto:
			'Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test.'.
	respuestaDePedro := pedro
		agregarRespuestaDeLaPregunta: preguntaDeDiego
		texto:
			'Significa que el objeto que recibió el mensaje
no encontró ningún método para ejecutar en respuesta.
'
]

{ #category : #'as yet unclassified' }
CuOOra class >> exampleTopicos [
	topicoOO1 := cuoora agregarTopico: 'OO1' y: ''.
	topicoTestDeUnidad := cuoora agregarTopico: 'Test de unidad' y: ''.
	topicoSmalltalk := cuoora agregarTopico: 'Smalltalk' y: ''
]

{ #category : #example }
CuOOra class >> exampleUsuarios [
	pedro := cuoora
		agregarUsuario: 'pedro@cuoora.com'
		passwd: 'pedro@cuoora.com'.
	diego := cuoora
		agregarUsuario: 'diego@cuoora.com'
		passwd: 'diego@cuoora.com'.
	juan := cuoora
		agregarUsuario: 'juan@cuoora.com'
		passwd: 'juan@cuoora.com'
]

{ #category : #accessing }
CuOOra class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #accesing }
CuOOra >> agregarTopico: nombre y: descripcion [
	(self existeElTopico: nombre)
		ifTrue: [ ^ 'El topico ya existe' ]
		ifFalse: [ ^ topicos add: (Topico nombre: nombre descripcion: descripcion) ]
]

{ #category : #accesing }
CuOOra >> agregarUsuario: nombreDeUsuario passwd: password [
	(self existeElUsuario: nombreDeUsuario)
		ifTrue: [ ^ 'El usuario ya existe' ]
		ifFalse: [ ^ usuarios
				add: (Usuario nombreDeUsuario: nombreDeUsuario password: password) ]
]

{ #category : #accesing }
CuOOra >> calcularPuntajeDe: unUsuario [
	^ (unUsuario puntajeDePreguntas)
		+ (self puntajeDeRespuestasDe: unUsuario) + (self
		puntajeDeTodasLasParticipacionesDe: unUsuario)
]

{ #category : #accesing }
CuOOra >> eliminarPregunta: pregunta [
	pregunta eliminarDatos
]

{ #category : #private }
CuOOra >> existe: usuario y: pass [
	^ usuarios
		detect: [ :u | u nombreDeUsuario = usuario & (u password = pass) ]
		ifNone: nil
]

{ #category : #private }
CuOOra >> existeElTopico: nombreDelTopico [
	^ topicos anySatisfy: [ :each | each nombre = nombreDelTopico ]
]

{ #category : #private }
CuOOra >> existeElUsuario: nombreDeUsuario [
	^ usuarios
		anySatisfy: [ :each | each nombreDeUsuario = nombreDeUsuario ]
]

{ #category : #initialization }
CuOOra >> initialize [
	usuarios := OrderedCollection new.
	topicos := OrderedCollection new. 
]

{ #category : #accesing }
CuOOra >> obtenerPreguntasOrdenadasPorFecha: usuario [
	| preguntas |
	preguntas := (self obtenerPreguntasRelevantesDe: usuario)
		asSortedCollection: [ :a :b | a fechaYHoraDeCreacion > b fechaYHoraDeCreacion ].
	preguntas size >= 5
		ifTrue: [ ^ preguntas first: 5 ].
	^ preguntas
]

{ #category : #accesing }
CuOOra >> obtenerPreguntasRelacionadasA: unTopico [
	^ self preguntasDeLosUsuarios
		select: [ :each | each tenesComoTopicoA: unTopico ]
]

{ #category : #accesing }
CuOOra >> obtenerPreguntasRelevantesDe: unUsuario [
	^ self preguntasDeLosUsuarios
		select: [ :each | 
			(unUsuario teInteresaEstaPregunta: each)
				or: (each tuCreadorEsSeguidoPor: unUsuario) ]
]

{ #category : #accesing }
CuOOra >> obtenerRespuestasDe: unUsuario [
	^ self preguntasDeLosUsuarios
		flatCollect: [ :each | each tenesUnaRespuestaDe: unUsuario nombreDeUsuario ]
]

{ #category : #accesing }
CuOOra >> obtenerRespuestasOrdenadasDeLaPregunta: unaPregunta [
	^ unaPregunta respuestasOrdenadasPorPuntaje
]

{ #category : #private }
CuOOra >> obtenerTopico: topico [
	^ topicos detect: [ :t | t nombre = topico ]
]

{ #category : #private }
CuOOra >> obtenerUsuario: nombreDeUsuario [
	^ usuarios
		detect: [ :usuario | usuario nombreDeUsuario = nombreDeUsuario ]
]

{ #category : #accesing }
CuOOra >> preguntasDeLosUsuarios [
	^ usuarios flatCollect: [ :each | each misPreguntas ]
]

{ #category : #private }
CuOOra >> puntajeDeRespuestasDe: unUsuario [
	^ (((self obtenerRespuestasDe: unUsuario)
		reject: [ :each | each pregunta creadorDelPosteo nombreDeUsuario = unUsuario nombreDeUsuario ])
		size) * 50
]

{ #category : #private }
CuOOra >> puntajeDeTodasLasParticipacionesDe: unUsuario [
	^ (unUsuario puntajeDiferenciaDePreguntas) + (self
		puntajeDiferenciaDeRespuestasDe: unUsuario)
]

{ #category : #private }
CuOOra >> puntajeDiferenciaDeRespuestasDe: unUsuario [
	^ ((self obtenerRespuestasDe: unUsuario)
		reject: [ :each | each pregunta creadorDelPosteo nombreDeUsuario = unUsuario nombreDeUsuario ])
		sumNumbers: [ :each | each mayorPuntaje ]
]

{ #category : #accesing }
CuOOra >> topicos [
	^ topicos 
]

{ #category : #accesing }
CuOOra >> usuarios [
	^ usuarios
]
