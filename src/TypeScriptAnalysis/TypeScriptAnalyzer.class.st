Class {
	#name : #TypeScriptAnalyzer,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
TypeScriptAnalyzer >> analyzeProject: path [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"
	|model data line finalLine|
	data:= OrderedCollection  new.
	line:= OrderedCollection new.
	model:= ProjectLoader new loadProject: path	.
	line add: (LineOfCodeAnalizer new averageLinesOfCodeInMethods: model).
	line add: (LineOfCodeAnalizer new maxLinesOfCodeInMethods: model).
	data add: line.
	finalLine:= CSVWriter new generateCSVLine: data.
	  
	^finalLine  
]
