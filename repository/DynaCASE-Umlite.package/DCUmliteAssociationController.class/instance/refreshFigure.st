hooks
refreshFigure
	(figure labels at: #name) shape text: (self convertName: self model name).
	(figure labels at: #name) update.
	
	(figure labels at: #sourceMultiplicity) shape text: self model sourceName.
	(figure labels at: #sourceMultiplicity) update.
	
	(figure labels at: #targetMultiplicity) shape text: self model targetName.
	(figure labels at: #targetMultiplicity) update.
	
	figure signalUpdate