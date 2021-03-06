Class {
	#name : #OPDiagramTest,
	#superclass : #TestCase,
	#instVars : [
		'view'
	],
	#category : #'OpenPonk-Core-Diagrams'
}

{ #category : #tests }
OPDiagramTest >> testAsJsonComplex [
	view := OPDiagram new
		camera:
			(OPDiagramCamera new
				offset: 20 @ 30;
				zoom: 1.2);
		layout:
			{('Person' -> (OPElementLayout withPosition: 27 @ 23 extent: 0 @ 0))}
				asDictionary.
	self
		assert: (STON fromString: view asJson)
		equals:
			(STON
				fromString:
					'{ 	"camera" : { "offset" : { "x" : 20, "y" : 30 }, "zoom" : 1.2 }	,
		"layout" : { "Person" : { "position" : { "x" : 27, "y" : 23 }, "extent" : { "x" : 0, "y" : 0 } } }, 
		"commonElements" : [],
		"visibleElements" : [  ] }')
]

{ #category : #tests }
OPDiagramTest >> testAsJsonModel [
	| model |
	model := Mock new.
	model stub name willReturn: 'testComp'.
	model stub typeName willReturn: 'Component'.
	view := OPDiagram new model: model.
	self
		assert: (STON fromString: view asJson)
		equals: (STON fromString: '{ "commonElements" : [], "visibleElements" : [ ] }')
]

{ #category : #tests }
OPDiagramTest >> testAsJsonModel2 [
	view := OPDiagram new model: OPTestContainerModel new.
	self
		assert: (STON fromString: view asJson)
		equals: (STON fromString: '{ "commonElements" : [], "visibleElements" : [ ] }')
]

{ #category : #tests }
OPDiagramTest >> testFromJsonComplex [
	| personUUID personUUIDstring person |
	personUUIDstring := '6b181c2c-135a-0d00-86ce-55e80f4cf59c'.
	personUUID := UUID fromString: personUUIDstring.
	person := Mock new.
	person stub uuid willReturn: personUUID.
	view := OPDiagram
		ofModel: Mock new
		fromJsonString:
			'{ 	"camera" : { "offset" : { "x" : 20, "y" : 30 }, "zoom" : 1.2 },
		"layout" : { "6b181c2c-135a-0d00-86ce-55e80f4cf59c" : { "position" : { "x" : 27, "y" : 23 } } },
		"visibleElements" : [ "6b181c2c-135a-0d00-86ce-55e80f4cf59c" ]	 }'.
	self assert: view camera offset equals: 20 @ 30.
	self assert: view camera zoom equals: 1.2.
	self
		assert: view layout
		equals: {(personUUID -> (OPElementLayout withPosition: 27 @ 23))} asDictionary.
	self assert: view visibleElements size equals: 1.
	self assert: view visibleElements anyOne equals: person.
]

{ #category : #tests }
OPDiagramTest >> testModel [
	| model project |
	model := OPTestContainerModel new.
	view := OPDiagram new model: model.
	self assert: view model equals: model
]

{ #category : #tests }
OPDiagramTest >> testNewCopy [
	| model project newView |
	model := OPTestContainerModel new.
	project := OPProject new.
	project addModel: model.
	view := OPDiagram new
		name: 'original';
		camera:
			(OPDiagramCamera new
				offset: 20 @ 30;
				zoom: 1.2);
		model: model;
		isOpen: true;
		isSelected: false;
		order: 7.
	newView := view newCopy.
	self deny: newView = view.
	self assert: newView name equals: 'copy of original'.
	self assert: newView model equals: model.
	view
]

{ #category : #tests }
OPDiagramTest >> testUpdateFromRoassalView [
	| roassalView |
	view := OPDiagram new.
	roassalView := RTView new.
	roassalView canvas camera
		translateTo: 200 @ 27;
		scale: 0.23.
	view updateFromRoassalView: roassalView.
	self assert: view camera offset equals: 200 @ 27.
	self assert: view camera zoom equals: 0.23
]
