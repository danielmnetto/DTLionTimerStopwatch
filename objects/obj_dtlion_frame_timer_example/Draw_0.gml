var text = $"FrameTimer: {timer.get_time()}\nFrameTimer has timed out? {(timer.has_timed_out() ? "yes" : "no")}";

draw_set_font(fnt_liberation_serif);
draw_set_halign(fa_left);

draw_text(x, y, text);

draw_set_halign(-1);
draw_set_font(-1);