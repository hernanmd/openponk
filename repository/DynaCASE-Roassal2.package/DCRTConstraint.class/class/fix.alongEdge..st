public - sticking
fix: aShape alongEdge: anEdge
	| callbacks block |
	callbacks := self createCallbacksOfEdge: anEdge.
	block := [ self doFix: aShape alongEdge: anEdge callbacks: callbacks ].
	aShape when: TRMouseDragEnd do: block.
	block value