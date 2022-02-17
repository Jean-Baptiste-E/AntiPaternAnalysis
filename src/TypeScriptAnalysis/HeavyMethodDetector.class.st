Class {
	#name : #HeavyMethodDetector,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
HeavyMethodDetector class >> getHeavyMethods: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	^(model allMethods select: [ :each | each numberOfParameters > 3 ]) size .
]
