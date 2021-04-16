Class {
	#name : #AgregarRespuestaComponent,
	#superclass : #BaseComponent,
	#instVars : [
		'texto'
	],
	#category : #'Objetos2-CuOORa-Seaside'
}

{ #category : #'instance creation' }
AgregarRespuestaComponent class >> newCuoora: cuoora pregunta: pregunta [
	^ (self new cuoora: cuoora) pregunta: pregunta
]

{ #category : #callbacks }
AgregarRespuestaComponent >> botonesRespuesta: aCanvas [
	aCanvas submitButton
		callback: [ self cancelar ];
		with: 'Cancelar'.
	aCanvas space.
	aCanvas submitButton
		callback: [ self guardar ];
		with: 'Guardar'
]

{ #category : #private }
AgregarRespuestaComponent >> cancelar [
	self answer
]

{ #category : #private }
AgregarRespuestaComponent >> formularioRespuesta: aCanvas [
	aCanvas
		form: [ self ingresarRespuesta: aCanvas.
			self botonesRespuesta: aCanvas ]
]

{ #category : #private }
AgregarRespuestaComponent >> guardar [
	texto
		ifNotEmpty: [ self session user
				agregarRespuestaDeLaPregunta: pregunta
				texto: texto ].
	self answer
]

{ #category : #rendering }
AgregarRespuestaComponent >> ingresarRespuesta: aCanvas [
	aCanvas heading level3 with: 'RESPONDER'.
	aCanvas textArea
		rows: 7;
		columns: 100;
		placeholder: 'Escriba aquí el texto de su respuesta';
		on: #texto of: self.
	aCanvas break
]

{ #category : #accessing }
AgregarRespuestaComponent >> pregunta: unaPregunta [
	pregunta := unaPregunta
]

{ #category : #rendering }
AgregarRespuestaComponent >> recuadro: aCanvas [
	aCanvas textArea
		rows: 10;
		columns: 100;
		placeholder: 'Escriba aqui el texto de su respuesta';
		on: #texto of: self
]

{ #category : #rendering }
AgregarRespuestaComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self textoPregunta: aCanvas.
	self mostrarPregunta: pregunta con: aCanvas.
	self formularioRespuesta: aCanvas.
	aCanvas paragraph with: [ self volver: aCanvas ]
]

{ #category : #accessing }
AgregarRespuestaComponent >> texto [
	^ texto
]

{ #category : #accessing }
AgregarRespuestaComponent >> texto: unTexto [
	texto := unTexto
]
