Class {
	#name : #AnyTypeDetector,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
AnyTypeDetector class >> getAnyStats:  model [ 
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| anyVariables otherVariables proportion collection |
	collection := OrderedCollection new.
	anyVariables := self getNumOfAny: model.
	otherVariables := self getNumOfOtherTypes: model.
	proportion := (anyVariables / otherVariables).
	collection add: anyVariables.
	collection add: proportion asFloat.
	^collection .
	
	

]

{ #category : #'as yet unclassified' }
AnyTypeDetector class >> getNumOfAny:  model [ 
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| numberOfAnyVariable types |
	types := model allTypes.
	numberOfAnyVariable := types select: [ :each | each name = 'any' ].
	numberOfAnyVariable := numberOfAnyVariable at: 1.
	numberOfAnyVariable := numberOfAnyVariable typedEntities size.
	^numberOfAnyVariable 
	
	

]

{ #category : #accessing }
AnyTypeDetector class >> getNumOfOtherTypes: model [
	"comment stating purpose of class-side message"

	"scope: class-variables  &  class-instance-variables"

	| numberOfOtherTypeVariables otherTypes types |
	types := model allTypes.
	otherTypes := types select: [ :each | each name ~= 'any' ].
	numberOfOtherTypeVariables := otherTypes sum: [ :each | each typedEntities size ].
	^ numberOfOtherTypeVariables 
]
