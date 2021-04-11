Class {
	#name : #InnSession,
	#superclass : #WASession,
	#instVars : [
		'user',
		'password'
	],
	#category : #'Objetos2-CuOORa-UI'
}

{ #category : #initialization }
InnSession >> initialize [ 
	super initialize 
]

{ #category : #'test-user' }
InnSession >> isLogging [ 
	^ user isNotNil 
]

{ #category : #callbacks }
InnSession >> logout [
	user := nil.
	password := nil 
]

{ #category : #accesing }
InnSession >> password [
	^ password  
]

{ #category : #accesing }
InnSession >> user [ 
	^ user 
]

{ #category : #accesing }
InnSession >> user: unUsuario password: unPassword [
	user := unUsuario .
	password := unPassword 
]
