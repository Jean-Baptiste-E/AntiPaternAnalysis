Class {
	#name : #TypeScriptAnalyzer,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
TypeScriptAnalyzer >> analyzeProject: path [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"
	|model data globalDictionary linesOfCodeDictionary finalLine|
	data:= Dictionary new.
	model:= ProjectLoader new loadProject: path	.
	globalDictionary := GlobalParametersAnalizer getGlobalParameters: model.
	linesOfCodeDictionary := LineOfCodeAnalizer getLinesOfCodeStats: model.
	UtilityHandler merge: globalDictionary  into: data.
	UtilityHandler merge: linesOfCodeDictionary   into: data.
	finalLine:= CSVWriter new generateCSVLine: data.
	  
	^finalLine  
]
