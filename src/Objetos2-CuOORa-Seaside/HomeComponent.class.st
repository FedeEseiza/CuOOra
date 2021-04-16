Class {
	#name : #HomeComponent,
	#superclass : #BaseComponent,
	#category : #'Objetos2-CuOORa-Seaside'
}

{ #category : #private }
HomeComponent >> crearPregunta [
	self call: (AgregarPreguntaComponent newCuoora: cuoora)
]

{ #category : #private }
HomeComponent >> infoDePregunta: pregunta [
	self
		call: (DetallePreguntasComponent newCuoora: cuoora pregunta: pregunta)
]

{ #category : #callbacks }
HomeComponent >> linkPregunta: pregunta con: aCanvas [
	aCanvas anchor
		callback: [ self infoDePregunta: pregunta ];
		with: pregunta titulo
]

{ #category : #private }
HomeComponent >> listaDePreguntas: aCanvas [
	(cuoora obtenerPreguntasOrdenadasPorFecha: self session user)
		do: [ :pregunta | 
			self linkPregunta: pregunta con: aCanvas.
			self mostrarPregunta: pregunta con: aCanvas ]
]

{ #category : #callbacks }
HomeComponent >> nuevaPregunta: aCanvas [
	aCanvas anchor
		callback: [ self crearPregunta ];
		with: '+ Hacer una nueva pregunta'
]

{ #category : #rendering }
HomeComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self nuevaPregunta: aCanvas.
	self ultimasPreguntas: aCanvas
]

{ #category : #rendering }
HomeComponent >> ultimasPreguntas: aCanvas [
	aCanvas heading: 'Ultimas preguntas'.
	aCanvas unorderedList: [ self listaDePreguntas: aCanvas ]
]
