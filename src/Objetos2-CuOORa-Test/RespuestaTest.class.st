Class {
	#name : #RespuestaTest,
	#superclass : #TestCase,
	#instVars : [
		'userFede',
		'userNahu',
		'preguntaSmalltalk',
		'respuestaSamalltalk',
		'respuestaSeaside',
		'topicoSmalltalk'
	],
	#category : #'Objetos2-CuOORa-Test'
}

{ #category : #running }
RespuestaTest >> setUp [
	userFede := Usuario nombreDeUsuario: 'Fede' password: 'xxx'.
	userNahu := Usuario nombreDeUsuario: 'Nahu' password:  'xxx'.
	topicoSmalltalk := Topico nombre: 'Samalltalk' descripcion: '' .
	preguntaSmalltalk := userFede agregarPreguntaConTitulo: 'Que es una ordererCollection?' descripcion:''  topicos:(OrderedCollection with: topicoSmalltalk).
	respuestaSamalltalk := userNahu agregarRespuestaDeLaPregunta: preguntaSmalltalk  texto: 'Una coleccion'  

]

{ #category : #'test-puntaje' }
RespuestaTest >> testCalcularMayorPuntaje [
	self assert: respuestaSamalltalk mayorPuntaje equals: 0.
	respuestaSamalltalk registrarDislikeDe: userFede.
	self assert: respuestaSamalltalk mayorPuntaje equals: -1.
	respuestaSamalltalk registrarLikeDe: userNahu.
	self assert: respuestaSamalltalk mayorPuntaje equals: 0
]

{ #category : #'test-registrarLikeODislike' }
RespuestaTest >> testRegistrarDislike [
	self assert: respuestaSamalltalk cantidadDeDislikes equals: 0.
	respuestaSamalltalk registrarDislikeDe: userFede.
	self assert: respuestaSamalltalk cantidadDeDislikes equals: 1.
	respuestaSamalltalk registrarDislikeDe: userFede.
	self assert: respuestaSamalltalk cantidadDeDislikes equals: 1.
	respuestaSamalltalk registrarDislikeDe: userNahu.
	self assert: respuestaSamalltalk cantidadDeDislikes equals: 2.
	respuestaSamalltalk registrarLikeDe: userFede.
	self assert: respuestaSamalltalk cantidadDeDislikes equals: 1.
	self assert: respuestaSamalltalk cantidadDeLikes equals: 1.
]

{ #category : #'test-registrarLikeODislike' }
RespuestaTest >> testRegistrarLike [
	self assert: respuestaSamalltalk cantidadDeLikes equals: 0.
	respuestaSamalltalk registrarLikeDe: userFede.
	self assert: respuestaSamalltalk cantidadDeLikes equals: 1.
	respuestaSamalltalk registrarLikeDe: userFede.
	self assert: respuestaSamalltalk cantidadDeLikes equals: 1.
	respuestaSamalltalk registrarLikeDe: userNahu.
	self assert: respuestaSamalltalk cantidadDeLikes equals: 2.
	respuestaSamalltalk registrarDislikeDe: userFede.
	self assert: respuestaSamalltalk cantidadDeDislikes equals: 1.
	self assert: respuestaSamalltalk cantidadDeLikes equals: 1.
]
