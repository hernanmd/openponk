"
I store a snapshot of a model/diagram.
I am passed onto PersistenceManager that handles in-image storing of me, and from there I am also passed onto Plugin's Importer/Exporter that handles the actual transformation to the target file format.
"
Class {
	#name : #OPPersistenceMemento,
	#superclass : #OPMemento,
	#category : #'OpenPonk-Core-Persistence'
}
