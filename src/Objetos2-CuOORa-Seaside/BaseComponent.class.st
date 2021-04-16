Class {
	#name : #BaseComponent,
	#superclass : #WAComponent,
	#instVars : [
		'cuoora',
		'pregunta'
	],
	#category : #'Objetos2-CuOORa-Seaside'
}

{ #category : #'instance creation' }
BaseComponent class >> newCuoora: cuoora [
	^ self new cuoora: cuoora
]

{ #category : #callbacks }
BaseComponent >> creadorDePregunta: unaPregunta con: aCanvas [
	aCanvas anchor
		callback: [ self mostrarUsuario: unaPregunta creadorDelPosteo ];
		with: unaPregunta creadorDelPosteo nombreDeUsuario
]

{ #category : #accesing }
BaseComponent >> cuoora: unCuoora [
	cuoora := unCuoora
]

{ #category : #'rendering-pregunta' }
BaseComponent >> datosDePregunta: unaPregunta con: aCanvas [
	aCanvas text: 'Realizada por '.
	self creadorDePregunta: unaPregunta con: aCanvas.
	aCanvas text: ' | '.
	aCanvas text: unaPregunta respuestas size printString , ' respuestas'
]

{ #category : #'posteo-methods' }
BaseComponent >> deslikearPosteo: posteo [
	posteo registrarDislikeDe: self session user
]

{ #category : #'posteo-methods' }
BaseComponent >> likearPosteo: posteo [
	posteo registrarLikeDe: self session user
]

{ #category : #'posteo-methods' }
BaseComponent >> likesDislikesDePosteo: posteo con: aCanvas [
	aCanvas text: posteo cantidadDeLikes printString , ' likes | '.
	aCanvas text: posteo cantidadDeDislikes printString , ' dislikes'
]

{ #category : #accesing }
BaseComponent >> logout [
	self call: (WelcomeComponent newCuoora: cuoora)
]

{ #category : #'rendering-pregunta' }
BaseComponent >> mostrarPregunta: unaPregunta con: aCanvas [
	aCanvas paragraph
		with: [ self topicosDePregunta: unaPregunta con: aCanvas ].
	aCanvas paragraph
		with: [ self datosDePregunta: unaPregunta con: aCanvas ].
	aCanvas paragraph
		with: [ self likesDislikesDePosteo: unaPregunta con: aCanvas ].
	aCanvas paragraph with: [ self valorarPosteo: unaPregunta con: aCanvas ].
	aCanvas horizontalRule
]

{ #category : #'rendering-usuario' }
BaseComponent >> mostrarUsuario: unUsuario [
	self
		call: (DetalleUsuarioComponent newCuoora: cuoora usuarioPosteo: unUsuario)
]

{ #category : #rendering }
BaseComponent >> renderContentOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas div
				style: 'display:flex; justify-content:space-between; align-items:center';
				with: [ aCanvas heading: 'CuOOra'.
					aCanvas div
						with: [ aCanvas strong: self session user nombreDeUsuario.
							aCanvas space.
							aCanvas space.
							aCanvas anchor
								callback: [ self logout ];
								with: 'Cerrar sesión' ] ] ].
	aCanvas horizontalRule
]

{ #category : #'rendering-pregunta' }
BaseComponent >> textoPregunta: aCanvas [
	aCanvas heading: pregunta titulo
]

{ #category : #'rendering-pregunta' }
BaseComponent >> topicosDePregunta: unaPregunta con: aCanvas [
	aCanvas text: 'Topicos: '.
	unaPregunta topicos
		do: [ :topico | 
			aCanvas
				text: topico nombre;
				space;
				space ]
]

{ #category : #callbacks }
BaseComponent >> valorarPosteo: posteo con: aCanvas [
	aCanvas anchor
		callback: [ self likearPosteo: posteo ];
		with: 'like | '.
	aCanvas anchor
		callback: [ self deslikearPosteo: posteo ];
		with: 'disike'
]

{ #category : #callbacks }
BaseComponent >> volver: aCanvas [
	aCanvas anchor
		callback: [ self call: (HomeComponent newCuoora: cuoora) ];
		with: 'Pagina principal'
]
