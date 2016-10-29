This is my second game. It is a click counter.


First you need Love2D to play the games :


On Ubuntu download the .deb file and install it.

On Windows download the installer and install the programm.

On Mac download the app and put it in the Application floder.


On Linux run the game with :


	love /PathToTheFolder/GameFolder


On Mac run the game this :


	/Applications/love.app/Contents/MacOS/love /PathToTheFolder/GameFolder


On Windows :


		"C:\Program Files\LOVE\love.exe" "C:\PathToTheFolder\GameFolder"


To make a .love file on Mac or on Linux enter this command when you are in the gme folder :


	zip -9 -r Game.love .


On Windows go in the folder with explored create a zip with all the files and rename the extention to .love

Execute :
(Optional for Mac users)




	nano ~/.bash_profile


and copy this :


	# alias to love
	alias love="/Applications/love.app/Contents/MacOS/love"


Now you can run the game with :


	love "~/path/to/mygame"


I hope you will have fun with the game :)
