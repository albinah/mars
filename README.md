# Usage

The file source_data should be stored on root of program. To can change the file name need to update file name in Rakefile in the task :run.<br>
First line contains coordinates of plateau. They should be separate by space and should be more that zero. <br>
Next line is a start position of a rover. The position should contain three symbols: first and two are start positive coordinates of the rover, third is a direction of the rover. <br>
Rover's coordinates should be included in plateau coordinates. <br>
The direction can be N E S W, where N - North, E - East, S - South, W - West. <br>
Next line is a route which the rover should pass. It may contains any count of symbols R L M, where R - right, L - left, M - move. These two lines are required setup rover configuration.<br>

The file may contains any count rover configuration lines.
<br>
Example: <br>
**5 5** *# plateau x and y points*<br>
**1 4 N** *# rover x, y points and direction*<br>
**LRMMLMRM** *# rover route*<br>
**3 3 W**<br>
**RRMMRMLMML**<br>
**1 5 E**<br>
**LM**<br>
<br>
To run program run console command`rake run`. <br>
To run tests run `rake test`.<br>
The ouput is a final position of the rover after route is passed.
