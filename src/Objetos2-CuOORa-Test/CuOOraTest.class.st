Class {
	#name : #CuOOraTest,
	#superclass : #TestCase,
	#instVars : [
		'cuoora',
		'userFede',
		'userNahu',
		'userPepito',
		'topicoMate3',
		'topicoObj2',
		'preguntaMate',
		'respuestaNahu',
		'respuestaPepito',
		'usuarioConPuntaje',
		'usuarioSinPuntaje',
		'preguntaPython',
		'respuestaPython1',
		'respuestaPython2',
		'topicoPython'
	],
	#category : #'Objetos2-CuOORa-Test'
}

{ #category : #'private-initialization' }
CuOOraTest >> initializePreguntas [
	userFede := cuoora agregarUsuario: 'Fede' passwd: 'xxx'.
	userNahu := cuoora agregarUsuario: 'Nahu' passwd: 'yyy'.
	userPepito := cuoora agregarUsuario: 'Pepito' passwd: 'zzz'.
	usuarioConPuntaje := cuoora agregarUsuario: 'UserWithPoints' passwd: 'puntos'.
	usuarioSinPuntaje := cuoora agregarUsuario: 'UserWithoutPoints' passwd: 'sinpuntos'.
	preguntaMate := userFede
		agregarPreguntaConTitulo: 'Mate 3'
		descripcion: 'Probabilidad'
		topicos: (OrderedCollection with: topicoMate3).
	preguntaPython := usuarioConPuntaje
		agregarPreguntaConTitulo: 'Python'
		descripcion: 'Como es el operador logico or en python'
		topicos: (OrderedCollection with: topicoPython)
]

{ #category : #'private-initialization' }
CuOOraTest >> initializeRespuestas [
	respuestaNahu := userNahu
		agregarRespuestaDeLaPregunta: preguntaMate
		texto:
			'Calculo matematico de las posibilidades que existen de que una cosa se cumpla o suceda al azar'.
	respuestaPepito := userPepito
		agregarRespuestaDeLaPregunta: preguntaMate
		texto: 'La posibilidad de que pase algo'.
	respuestaPython1 := usuarioConPuntaje agregarRespuestaDeLaPregunta: preguntaPython texto: 'Creo que es con ||'.
	 
]

{ #category : #'private-initialization' }
CuOOraTest >> initializeTopicos [
	topicoMate3 := Topico
		nombre: 'Mate 3'
		descripcion: 'Que es la probabilidad?'.
	topicoObj2 := Topico
		nombre: 'Objetos 2'
		descripcion: 'Que es seaside?'.
	topicoPython := Topico
		nombre: 'Python'
		descripcion: 'Info sobre python'
]

{ #category : #running }
CuOOraTest >> setUp [
	cuoora := CuOOra new.
	self initializeTopicos .
	self initializePreguntas .
	self initializeRespuestas 
]

{ #category : #'test-topicos' }
CuOOraTest >> testAgregarTropico [
	self assert: (cuoora topicos size) equals: 0.
	cuoora agregarTopico: 'Objetos 2' y: 'Caso de estudio sobre framework seaside para aprender sobre la 	creacion y utilizacion de frameworks'.
	self assert: (cuoora topicos first nombre) equals: 'Objetos 2'
]

{ #category : #'test-preguntas' }
CuOOraTest >> testBorrarPregunta [
	self assert: (userFede misPreguntas first titulo) equals: 'Mate 3'.
	cuoora eliminarPregunta: preguntaMate .
	self assert: (userFede misPreguntas size) equals: 0.
]

{ #category : #'test-puntaje' }
CuOOraTest >> testCalcularPuntajeDeUnUsuario [
	preguntaPython registrarLikeDe: userFede.
	preguntaPython registrarDislikeDe: usuarioSinPuntaje .
	self assert: (cuoora calcularPuntajeDe: usuarioConPuntaje) equals: 20.
	self assert: (cuoora calcularPuntajeDe: usuarioSinPuntaje) equals: 0.
	usuarioConPuntaje agregarRespuestaDeLaPregunta: preguntaMate texto: 'La verdad ni idea'.
	self assert: (cuoora calcularPuntajeDe: usuarioConPuntaje) equals: 70.
]

{ #category : #'private-initialization' }
CuOOraTest >> testConstructor [
	self assert: CuOOra new usuarios isEmpty.
	self assert: CuOOra new topicos isEmpty
]

{ #category : #'test-preguntas' }
CuOOraTest >> testObtenerPreguntasDeUnTopico [
	self
		assert: (cuoora obtenerPreguntasRelacionadasA: topicoMate3) first titulo
		equals: 'Mate 3'.
	self
		assert: (cuoora obtenerPreguntasRelacionadasA: topicoObj2) size
		equals: 0
]

{ #category : #'test-preguntas' }
CuOOraTest >> testObtenerPreguntasRelevantesDeUnUsuario [
	self assert: ((cuoora obtenerPreguntasRelevantesDe: userFede)size) equals: 0. 
	userFede agregarTopicoDeInteres: topicoMate3 .
	self assert: ((cuoora obtenerPreguntasRelevantesDe: userFede) first titulo) equals: 'Mate 3'.
	self assert: ((cuoora obtenerPreguntasRelevantesDe: userFede)size) equals: 1.
	userFede seguirA: userNahu .
	userNahu agregarPreguntaConTitulo:'Objetos 2' descripcion:'Que es seaside?'  topicos: (OrderedCollection with: topicoObj2) .
	self assert: ((cuoora obtenerPreguntasRelevantesDe: userFede) second titulo) equals: 'Objetos 2'.
	self assert: ((cuoora obtenerPreguntasRelevantesDe: userFede)size) equals: 2.
	
]

{ #category : #'test-respuestas' }
CuOOraTest >> testObtenerRespuestasOrdenadasDeUnaPregunta [
	respuestaNahu registrarLikeDe: userFede .
	respuestaNahu registrarLikeDe: userPepito .
	respuestaPepito registrarLikeDe: userFede .
	self assert: ((cuoora obtenerRespuestasOrdenadasDeLaPregunta: preguntaMate)first mayorPuntaje) equals: 2.
	self assert: ((cuoora obtenerRespuestasOrdenadasDeLaPregunta: preguntaMate)second mayorPuntaje) equals: 1.  
	
]

{ #category : #'test-preguntas' }
CuOOraTest >> testPreguntasDeUnUsuario [
	self assert: userFede misPreguntas size equals: 1.
	self assert: userFede misPreguntas first titulo equals: 'Mate 3'.
	self assert: userPepito misPreguntas size equals: 0
]
