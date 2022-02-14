Class {
	#name : #CSVWriter,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
CSVWriter >> generateCSVLine: stream [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| line |
	
	(NeoCSVWriter on: line)
			writeHeader: #('averageLineOfCode' 'maxLinesOfCode');
			nextPutAll: stream.
			
		^line
]
