Class {
	#name : #CSVWriter,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
CSVWriter >> generateCSVLine: data [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	'test.csv' asFileReference
	writeStreamDo: [ :writeStream |
		(NeoCSVWriter on: writeStream)
 			writeHeader: #(average max);
			nextPutAll: data ].
		
]
