Class {
	#name : #TypeScriptAnalyzer,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
TypeScriptAnalyzer >> analyzeProject: path [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"
	|model data finalLine|
	data:= OrderedCollection  new.
	model:= ProjectLoader new loadProject: path	.
	data add: (LineOfCodeAnalizer new averageLinesOfCodeInMethods: model).
	data add: (LineOfCodeAnalizer new maxLinesOfCodeInMethods: model).
	finalLine:= CSVWriter new generateCSVLine: data writeStream.
	  
	^finalLine			
]
