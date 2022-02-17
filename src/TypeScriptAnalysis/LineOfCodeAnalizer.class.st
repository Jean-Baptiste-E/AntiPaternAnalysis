Class {
	#name : #LineOfCodeAnalizer,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
LineOfCodeAnalizer class >> getAverageLineOfCodeByMethod: model [ 
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"
	| average |
	average := model allMethods average: [ :each | each numberOfLinesOfCode ].
			
	^average 
]

{ #category : #'as yet unclassified' }
LineOfCodeAnalizer class >> getBiggestMethod: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| biggestMethod maxNumberOfLinesOfCode | 
	maxNumberOfLinesOfCode := model allMethods max: [ :each | each numberOfLinesOfCode ].
	biggestMethod := model allMethods select: [ :each | each numberOfLinesOfCode = maxNumberOfLinesOfCode ].
	
	^maxNumberOfLinesOfCode  
	
]

{ #category : #'as yet unclassified' }
LineOfCodeAnalizer class >> getLinesOfCodeStats: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
	| data |
	data:= OrderedCollection new.
	data add: (self getAverageLineOfCodeByMethod: model).
	data add: (self getBiggestMethod: model).
	^data 
]
