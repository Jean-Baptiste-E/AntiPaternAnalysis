Class {
	#name : #GodClassDetector,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
GodClassDetector class >> detectGodClass: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| averageFanIn potentialGodClasses data|
	data:= OrderedCollection new.
	averageFanIn := model allClasses average: [ :each | each fanIn ].
	potentialGodClasses := model allClasses select: [ :each | each fanIn > (3 * averageFanIn ) ].
	data add: averageFanIn asFloat ;
		add: potentialGodClasses size.
	^data.
]
