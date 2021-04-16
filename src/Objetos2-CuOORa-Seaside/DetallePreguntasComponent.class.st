Class {
	#name : #DetallePreguntasComponent,
	#superclass : #BaseComponent,
	#category : #'Objetos2-CuOORa-Seaside'
}

{ #category : #'instance creation' }
DetallePreguntasComponent class >> newCuoora: cuoora pregunta: unaPregunta [
	^ (self new cuoora: cuoora) pregunta: unaPregunta
]

{ #category : #callbacks }
DetallePreguntasComponent >> creadorDeRespuesta: respuesta con: aCanvas [
	aCanvas text: 'Respuesta de '.
	aCanvas anchor
		callback: [ self mostrarUsuario: respuesta creadorDelPosteo ];
		with: respuesta creadorDelPosteo nombreDeUsuario
]

{ #category : #private }
DetallePreguntasComponent >> crearRespuesta [
	self
		call: (AgregarRespuestaComponent newCuoora: cuoora pregunta: pregunta)
]

{ #category : #private }
DetallePreguntasComponent >> listaRespuestas: aCanvas [
	pregunta respuestas
		do: [ :respuesta | self mostrarRespuesta: respuesta con: aCanvas ]
]

{ #category : #rendering }
DetallePreguntasComponent >> mostrarRespuesta: respuesta con: aCanvas [
	aCanvas strong
		with: [ self creadorDeRespuesta: respuesta con: aCanvas ].
	aCanvas paragraph: respuesta texto.
	aCanvas paragraph
		with: [ self likesDislikesDePosteo: respuesta con: aCanvas ].
	aCanvas paragraph
		with: [ self valorarPosteo: respuesta con: aCanvas ].
	aCanvas horizontalRule
]

{ #category : #rendering }
DetallePreguntasComponent >> nuevaRespuesta: aCanvas [
	aCanvas anchor
		callback: [ self crearRespuesta ];
		with: '+ Agregar respuesta'
]

{ #category : #accessing }
DetallePreguntasComponent >> pregunta: unaPregunta [
	pregunta := unaPregunta
]

{ #category : #rendering }
DetallePreguntasComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self textoPregunta: aCanvas.
	self mostrarPregunta: pregunta con: aCanvas.
	self listaRespuestas: aCanvas.
	aCanvas paragraph: 'No hay mas respuestas'.
	self volver: aCanvas.
	aCanvas paragraph with: [ self nuevaRespuesta: aCanvas ]
]
