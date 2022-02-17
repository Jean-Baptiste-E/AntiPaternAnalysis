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
	headers := #('Project Name' 'Classes' 'Methods' 'AVG LOC By Method' 'Bigest Method LOC' 'Methods > 3 parameters' 'Average Class FanIN' 'Potential God Classes').
	projectData:= OrderedCollection new.
	model:= ProjectLoader new loadProject: path	.
	projectData add: model name;
		addAll: (GlobalParametersAnalizer getGlobalParameters: model);
		addAll: (LineOfCodeAnalizer getLinesOfCodeStats: model);
		add: (HeavyMethodDetector getHeavyMethods: model);
		addAll: (GodClassDetector detectGodClass: model).
	data := OrderedCollection new.
	data add: projectData.
	finalLine:= CSVWriter new write: data withHeaders: headers.
	  
	^finalLine  
]
