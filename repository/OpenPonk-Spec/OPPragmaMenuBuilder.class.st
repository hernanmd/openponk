Class {
	#name : #OPPragmaMenuBuilder,
	#superclass : #PragmaMenuBuilder,
	#instVars : [
		'pragmaCollector'
	],
	#category : #'OpenPonk-Spec-Utils'
}

{ #category : #accessing }
OPPragmaMenuBuilder >> pragmaCollector [

	^ pragmaCollector
]

{ #category : #accessing }
OPPragmaMenuBuilder >> pragmaCollector: anObject [

	pragmaCollector := anObject
]
