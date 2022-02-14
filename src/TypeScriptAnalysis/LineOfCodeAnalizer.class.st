Class {
	#name : #LineOfCodeAnalizer,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
LineOfCodeAnalizer >> averageLinesOfCodeInMethods: model [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"
	
	|average| 
	average:= model allMethods average: [ :each | each numberOfLinesOfCode ].
	^average 	asFloat

]

{ #category : #'as yet unclassified' }
LineOfCodeAnalizer >> maxLinesOfCodeInMethods: model [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"
	
	| max | 
	max:= model allMethods max: [ :each | each numberOfLinesOfCode ].
	^max 	

]
