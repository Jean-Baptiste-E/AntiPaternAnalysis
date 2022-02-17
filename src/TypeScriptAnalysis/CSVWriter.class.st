Class {
	#name : #CSVWriter,
	#superclass : #Object,
	#category : #TypeScriptAnalysis
}

{ #category : #'as yet unclassified' }
CSVWriter >> generateCSVLine: data [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"
	|values valuesToPrint|
	values := (data values) asOrderedCollection.
	valuesToPrint := OrderedCollection new.
	valuesToPrint add: (values) .
		
			
	'test.csv' asFileReference
	writeStreamDo: [ :writeStream |
		(NeoCSVWriter on: writeStream)
 			writeHeader: data keys;
			nextPutAll:  valuesToPrint ].
		
]
