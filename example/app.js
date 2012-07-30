// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
win.add(label);
win.open();

var statusbaroverlay = require('mattapp.statusbar');

//displays a message in the status bar, that is dismissed when tapped
statusbaroverlay.postMessage("Posting to Twitter");
//you can also set a timeout to auto hide the message
//statusbaroverlay.postMessage("Posting to Twitter", 3.0);
