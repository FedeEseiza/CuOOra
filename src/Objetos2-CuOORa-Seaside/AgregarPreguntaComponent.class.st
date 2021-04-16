Class {
	#name : #AgregarPreguntaComponent,
	#superclass : #BaseComponent,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos'
	],
	#category : #'Objetos2-CuOORa-Seaside'
}

{ #category : #callbacks }
AgregarPreguntaComponent >> botonesNuevaPregunta: aCanvas [
	aCanvas submitButton
		callback: [ self answer ];
		with: 'Cancelar'.
	aCanvas space.
	aCanvas submitButton
		callback: [ self guardar ];
		with: 'Guardar'
]

{ #category : #rendering }
AgregarPreguntaComponent >> datosNuevaPregunta: aCanvas [
	aCanvas paragraph: [ self ingresarTitulo: aCanvas ].
	aCanvas paragraph: [ self ingresarDesarrollo: aCanvas ].
	aCanvas paragraph: [ self ingresarTopicos: aCanvas ]
]

{ #category : #accessing }
AgregarPreguntaComponent >> descripcion [
	^ descripcion
]

{ #category : #accessing }
AgregarPreguntaComponent >> descripcion: unaDescripcion [
	descripcion := unaDescripcion
]

{ #category : #'private ' }
AgregarPreguntaComponent >> guardar [
	titulo & topicos
		ifNotEmpty: [ self session user
				agregarPreguntaConTitulo: titulo
				descripcion: descripcion
				topicos: self persearTopicos ].
	self answer
]

{ #category : #rendering }
AgregarPreguntaComponent >> ingresarDesarrollo: aCanvas [
	aCanvas strong: [ aCanvas paragraph: 'Desarrollo ' ].
	aCanvas textArea
		on: #descripcion of: self;
		placeholder: 'Escriba aquí el desarrollo de su pregunta.';
		rows: 5;
		columns: 95
]

{ #category : #rendering }
AgregarPreguntaComponent >> ingresarTitulo: aCanvas [
	aCanvas strong: [ aCanvas paragraph: 'Título ' ].
	aCanvas textInput
		on: #titulo of: self;
		placeholder: 'Escriba aquí el título de su pregunta.';
		size: 95
]

{ #category : #rendering }
AgregarPreguntaComponent >> ingresarTopicos: aCanvas [
	aCanvas strong: [ aCanvas paragraph: 'Tópicos ' ].
	aCanvas textInput
		on: #topicos of: self;
		placeholder: 'Ingrese tópicos separado por coma.';
		size: 95
]

{ #category : #rendering }
AgregarPreguntaComponent >> persearTopicos [
	^ (topicos splitOn: ', ')
		collect: [ :nombreTopico | self retornarTopico: nombreTopico ]
]

{ #category : #rendering }
AgregarPreguntaComponent >> renderContentOn: aCanvas [
	super renderContentOn: aCanvas.
	self subtituloNuevaPregunta: aCanvas.
	aCanvas
		form: [ self datosNuevaPregunta: aCanvas.
			self botonesNuevaPregunta: aCanvas ]
]

{ #category : #'private ' }
AgregarPreguntaComponent >> retornarTopico: nombreTopico [
	^ (cuoora existeElTopico: nombreTopico)
		ifTrue: [ cuoora obtenerTopico: nombreTopico ]
		ifFalse: [ cuoora agregarTopico: nombreTopico y: '' ]
]

{ #category : #rendering }
AgregarPreguntaComponent >> subtituloNuevaPregunta: aCanvas [
	aCanvas heading level2 with: 'Nueva pregunta'.
	aCanvas horizontalRule
]

{ #category : #accessing }
AgregarPreguntaComponent >> titulo [
	^ titulo
]

{ #category : #accessing }
AgregarPreguntaComponent >> titulo: unTitulo [
	titulo := unTitulo
]

{ #category : #accessing }
AgregarPreguntaComponent >> topicos [
	^ topicos
]

{ #category : #accessing }
AgregarPreguntaComponent >> topicos: unTopico [
	topicos := unTopico
]
