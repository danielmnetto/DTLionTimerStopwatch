/// @desc A timer system constructor that performs time decreasing until
/// reaches zero.
/// @param {Real} _initial_time
function FrameTimer(_initial_time) constructor {
	__time = _initial_time;
	__initial_time = _initial_time;
	__decrease_amount = 1;
	
	/// @desc This function is used to count the time until it reaches zero.
	count = function() {
		__time = max(__time - __decrease_amount, 0);
	}
	
	/// @desc This function can be used to check whether the timer reached zero.
	/// @returns {Bool}
	has_timed_out = function() {
		return __time == 0;
	}
	
	/// @desc This function is used to set the current time to the initial time.
	reset = function() {
		__time = __initial_time;
	}
	
	/// @desc This function is used to get the current time.
	/// @returns {Real}
	get_time = function() {
		return __time;
	}
	
	/// @desc This function is used to get the initial time.
	/// @returns {Real}
	get_initial_time = function() {
		return __initial_time;
	}
	
	/// @desc This function is used to get the decrease amount value which is used
	/// to decrease the time when the count is performed.
	/// @returns {Real}
	get_decrease_amount = function() {
		return __decrease_amount;
	}
	
	/// @desc This function is used to set the current time.
	/// @param {Real} time
	set_time = function(time) {
		if is_nan(time) then throw "Time must be a number.";
		
		__time = max(time, 0);
	}
	
	/// @desc This function is used to set the initial time.
	/// @param {Real} initial_time
	set_initial_time = function(initial_time) {
		if is_nan(initial_time) then throw "Initial time must be a number.";
		
		__initial_time = max(initial_time, 0);
	}
	
	/// @desc This function is used to set the decrease amount value which is used
	/// to decrease the time when the count is performed.
	/// @param {Real} decrease_amount
	set_decrease_amount = function(decrease_amount) {
		if is_nan(decrease_amount) then throw "Decrease amount must be a number.";
		
		__decrease_amount = abs(decrease_amount);
	}
}

/// @desc A timer that counts the time by delta time until reaches zero.
/// @param {Real} _initial_time
function DeltaTimer(_initial_time): FrameTimer(_initial_time) constructor {
	__decrease_amount = undefined;
	__time_speed = 1;
	
	/// @ignore
	get_decrease_amount = function() {
		throw "This function only works on FrameTimer struct.";
	}
	
	/// @ignore
	set_decrease_amount = function() {
		throw "This function only works on FrameTimer struct.";
	}
	
	/// @desc This function is used to count the time until it reaches zero.
	count = function() {
		__time = max(__time - ((delta_time / 1000000) * __time_speed), 0);
	}
	
	/// @desc This function is used to get the time speed.
	/// @returns {Real}
	get_time_speed = function() {
		return __time_speed;
	}
	
	/// @desc This function is used to set the time speed to control the count.
	/// @param {Real} time_speed The higher the value, faster is the time count.
	/// e.g.: 1 is the default speed. 2 is twice the speed. 0.5 is half of the default speed.
	set_time_speed = function(time_speed) {
		if is_nan(time_speed) then throw "Time speed must be a number.";
		
		__time_speed = time_speed;
	}
}