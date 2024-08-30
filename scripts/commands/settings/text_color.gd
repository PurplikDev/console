extends Command

func call_command(args: Array[String]):
	if args.size() <= 0:
		Console.print_line(str("current text color: ", Settings.get_text_color()))
	elif args.size() == 3:
		var new_color = Color(float(args[0]), float(args[1]), float(args[2]), 1.0) # silly
		Settings.set_text_color(new_color)
		Console.print_line(str("setting text color to: ", new_color))
	else:
		Console.print_error("invalid arguments", str(args))
