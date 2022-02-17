Class {
	#name : #GodClassDetector,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
GodClassDetector class >> detectGodClass: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| hasGodClass averageNumberOfDependancies accessingClasses|
	accessingClasses := model allClasses average: [ :each | each invocation].
	averageNumberOfDependancies := accessingClasses size.
	^averageNumberOfDependancies 
]
