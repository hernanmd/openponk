*DynaCASE-STON
stonOn: stonWriter
	stonWriter writeObject: self streamMap: [ :dictionary | dictionary at: #value put: value ]