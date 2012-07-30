# statusbaroverlay Module

## Description

An overlay to the status bar for ios to display messages much like the one on twitter

## Accessing the statusbaroverlay Module

To access this module from JavaScript, you would do the following:

	var statusbaroverlay = require("mattapp.statusbar");

The statusbaroverlay variable is a reference to the Module object.

## API
	
	//displays a message in the status bar, that is dismissed when tapped
	statusbaroverlay.postMessage("Posting to Twitter");
	
	//you can also set a timeout to auto hide the message
	statusbaroverlay.postMessage("Start posting to Twitter", 2.5);
	
	//clears the statusbar instantly and displays a message in the status bar, that is dismissed when tapped
	statusbaroverlay.postImmediateMessage("Posting to Twitter", 2.5);
	
	
	
	//displays a message in the status bar with an activity indicator on the left side, that is dismissed when tapped
	statusbaroverlay.postMessageInProgress("Posting to Twitter", 5.0);
	
	//you can also set a timeout to auto hide the message
	statusbaroverlay.postMessageInProgress("Posting to Twitter", 3.0);
	
	//clears the statusbar instantly and displays a message in the status bar with an activity indicator on the left side, that is dismissed when tapped
	statusbaroverlay.postImmediateMessageInProgress("Posting to Twitter", 3.0);
	
	
	
	//displays a message in the status bar with a check on the left side, that is dismissed after a timeout
	statusbaroverlay.postFinishMessage("Message was posted to Twitter", 2.0);
	
	//clears the statusbar instantly and displays a message in the status bar with a check on the left side, that is dismissed after a timeout
	statusbaroverlay.postImmediateFinishMessage("Error posting to Twitter", 2.0);
	
	
	
	//displays a message in the status bar with an X the left side, that is dismissed after a timeout
	statusbaroverlay.postErrorMessage("Error posting to Twitter", 2.0);
	
	//clears the statusbar instantly and displays a message in the status bar with an X the left side, that is dismissed after a timeout
	statusbaroverlay.postImmediateErrorMessage("Error posting to Twitter", 2.0);
	
	
	
	//hide the statusbaroverlay but keep its current message displayed
	statusbaroverlay.hide();
	
	//show the statusbaroverlay if any messages were hidden
	statusbaroverlay.show();
	
	//hide and clear the statusbar
	statusbaroverlay.stop();


## Usage (Example)

	//simulate a posting
	var statusbaroverlay = require('mattapp.statusbar');
	statusbaroverlay.postMessage("Posting to Twitter");
	
	setTimeout(function(){
		statusbaroverlay.postMessageInProgress("Posting to Twitter...",8.0);
		setTimeout(function(){
			statusbaroverlay.postImmediateFinishMessage("Message was posted to Twitter", 5.0);
			
			//OR
			//statusbaroverlay.postImmediateErrorMessage("Error posting to Twitter", 3.0);
		}, 5000); //notice: after 5 sec, the postImmediateFinishMessage method will show, even though the postMessageInProgress still has 3 sec to go.
	}, 5000);

## Author

Module created by Matt Apperson, based on the open source work of Matthias Tretter

Other contributors for enhancments and bug fixes via PR:
- Mads Møller (www.napp.dk)
