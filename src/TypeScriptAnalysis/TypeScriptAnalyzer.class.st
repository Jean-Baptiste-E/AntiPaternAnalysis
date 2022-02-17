Class {
	#name : #TypeScriptAnalyzer,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
TypeScriptAnalyzer >> analyzeProject: path [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"
	|model headers data finalLine projectData|
	headers := #('Project Name' 'Classes' 'Methods' 'AVG LOC By Method' 'Methods LOC > 100' 'Bigest Method LOC' 'Lazy classes' 'Methods > 3 parameters' 'Average Class FanOut' 'Potential God Classes').
	projectData:= OrderedCollection new.
	model:= ProjectLoader new loadProject: path	.
	projectData add: model name;
		addAll: (GlobalParametersAnalizer getGlobalParameters: model);
		addAll: (LineOfCodeAnalizer getLinesOfCodeStats: model);
		add: (HeavyMethodDetector getLazyClasses: model);
		add: (HeavyMethodDetector getHeavyMethods: model);
		addAll: (GodClassDetector detectGodClass: model).
	data := OrderedCollection new.
	data add: projectData.
	finalLine:= CSVWriter new write: data withHeaders: headers.
	  
	^finalLine  
]
