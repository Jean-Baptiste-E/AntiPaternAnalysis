Class {
	#name : #GodClassDetector,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
GodClassDetector class >> detectGodClass: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| averageFanOut classesPercentage potentialGodClasses data|
	data:= OrderedCollection new.
	classesPercentage := (model allClasses size) * (40/100).
	averageFanOut := model allClasses average: [ :each | each fanIn ].
	potentialGodClasses := model allClasses select: [ :each | each fanOut > classesPercentage ].
	data add: averageFanOut asFloat ;
		add: potentialGodClasses size.
	^data.
]
