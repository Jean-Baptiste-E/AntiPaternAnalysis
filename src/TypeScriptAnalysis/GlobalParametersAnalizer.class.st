Class {
	#name : #GlobalParametersAnalizer,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
GlobalParametersAnalizer class >> getGlobalParameters: model [
	"comment stating purpose of class-side message"
	"scope: class-variables  &  class-instance-variables"	
			
	| globalParameters |
	globalParameters:= Dictionary new.
	globalParameters at: #ClassesNo put: (model numberOfClasses). 
	globalParameters at: #MethodsNo put: (model numberOfMethods). 
	^globalParameters 
]
