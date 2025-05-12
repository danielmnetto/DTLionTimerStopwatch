<h1 align="center">DTLion Timer & Stopwatch</h1>

&nbsp;
&nbsp;

<p align="center"><strong>DTLion Timer & Stopwatch</strong> features simple, legible and intuitive timer and stopwatch system constructors for GameMaker, making it easy to control the way your timers and stopwatches work on your game.</p>

## Timer & Stopwatch Constructors
There are four constructors to count the time:
- Frame Timer
- Delta Timer
- Frame Stopwatch
- Delta Stopwatch

Timer constructors decrease their time until they reach zero, unlike Stopwatches which they increase their time instead.

Frame Timers and Stopwatches decrease/increase their time on each game frame. So in your Game Options, if the `Game frames per second` config is set to `60`, then your frame timer will consider the time `60` as 1 second, `120` as 2 seconds, `30` as a half second and so on.

Delta Timers and Stopwatches decrease/increase their time taking in account the delta time instead of game frames. These are useful in cases which you want to consider the real life time instead of game frame.

## Usage

### Frame Timer
````gml
// Create event code
timer = new FrameTimer(30); // 30 as a half second considering the game frame per seconds is 60.

// Step event code
timer.count();

if timer.has_timed_out() {
  show_debug_message("The timer has timed out.");
}
````

### Delta Timer
````gml
// Create event code
timer = new DeltaTimer(2); // 2 seconds since 

// Step event code
timer.count();

if timer.has_timed_out() {
  show_debug_message("The timer has timed out.");
}
````

### Frame Stopwatch
````gml
// Create event code
stopwatch = new FrameStopwatch(); // It starts from zero.

// Step event code
stopwatch.count();

var _current_time = stopwatch.get_time();

show_debug_message("Current time: " + string(_current_time));

if _current_time > 300 {
  show_debug_message("It exceeded 300 frames.");
}
````

### Delta Stopwatch
````gml
// Create event code
stopwatch = new DeltaStopwatch(); // It starts from zero.

// Step event code
stopwatch.count();

var _current_time = stopwatch.get_time();

show_debug_message("Current time: " + string(_current_time));

if _current_time > 5 {
  show_debug_message("It exceeded 5 seconds.");
}
````
