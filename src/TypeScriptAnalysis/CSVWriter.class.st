Class {
	#name : #CSVWriter,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
CSVWriter >> generateCSVLine: data [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"
	|tmp|
	tmp := data values asCollection.	
			
	'test.csv' asFileReference
	writeStreamDo: [ :writeStream |
		(NeoCSVWriter on: writeStream)
 			writeHeader: data keys;
			nextPutAll:  #(1 2 3) ].
		
]
