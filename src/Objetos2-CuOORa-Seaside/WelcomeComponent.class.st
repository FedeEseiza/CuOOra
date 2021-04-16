"
|app|
app:= WAAdmin register: WelcomeComponent asApplicationAt: 'cuoora'.
app sessionClass: InnSession.
"
Class {
	#name : #WelcomeComponent,
	#superclass : #BaseComponent,
	#instVars : [
		'usuario',
		'password'
	],
	#category : #'Objetos2-CuOORa-Seaside'
}

{ #category : #callbacks }
WelcomeComponent >> botonesRespuesta: aCanvas [
	aCanvas submitButton
		callback: [ self login ];
		with: 'Iniciar sesion'
]

{ #category : #'private protocol' }
WelcomeComponent >> crearUsuario [
	password
		ifNotEmpty: [ | aux |
			aux := cuoora agregarUsuario: usuario passwd: password.
			self iniciarCon: aux ]
]

{ #category : #rendering }
WelcomeComponent >> ingresarDatos: aCanvas [
	aCanvas paragraph: [ self ingresarUsuario: aCanvas ].
	aCanvas paragraph: [ self ingresarPassword: aCanvas ]
]

{ #category : #rendering }
WelcomeComponent >> ingresarPassword: aCanvas [
	aCanvas
		strong: [ aCanvas label: 'Contraseña' ];
		space.
	aCanvas textInput on: #password of: self
]

{ #category : #rendering }
WelcomeComponent >> ingresarUsuario: aCanvas [
	aCanvas
		strong: [ aCanvas label: 'Usuario:' ];
		space.
	aCanvas textInput on: #usuario of: self
]

{ #category : #'private protocol' }
WelcomeComponent >> iniciarCon: unUsuario [
	self session user: unUsuario.
	self call: (HomeComponent newCuoora: cuoora)
]

{ #category : #initialization }
WelcomeComponent >> initialize [
	super initialize.
	cuoora := CuOOra example
]

{ #category : #'private protocol' }
WelcomeComponent >> login [
	(cuoora existeElUsuario: usuario)
		ifTrue: [ (cuoora existe: usuario y: password)
				ifNotNil: [ :it | self iniciarCon: it ]
				ifNil: [ ^ self logout ] ]
		ifFalse: [ self crearUsuario ]
]

{ #category : #accessing }
WelcomeComponent >> password [
	^ password
]

{ #category : #accessing }
WelcomeComponent >> password: pass [
	password := pass
]

{ #category : #rendering }
WelcomeComponent >> renderContentOn: aCanvas [
	aCanvas heading: 'CuOOra'.
	aCanvas
		form: [ self ingresarDatos: aCanvas.
			self botonesRespuesta: aCanvas ]
]

{ #category : #accessing }
WelcomeComponent >> usuario [
	^ usuario
]

{ #category : #accessing }
WelcomeComponent >> usuario: unUsuario [
	usuario := unUsuario
]
