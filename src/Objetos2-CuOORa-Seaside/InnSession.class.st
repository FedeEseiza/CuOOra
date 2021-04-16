Class {
	#name : #InnSession,
	#superclass : #WASession,
	#instVars : [
		'user'
	],
	#category : #'Objetos2-CuOORa-Seaside'
}

{ #category : #accessing }
InnSession >> user [
	^ user
]

{ #category : #accessing }
InnSession >> user: unUser [
	user := unUser
]
