require "../src/joystick.cr"

# Starting SDL

if SDL2.init(SDL2::Init::EVERYTHING) != 0
	puts "Error initializing SDL2: #{SDL2.getError}"
	exit
end

if SDL2.numJoysticks > 0
  joystick = SDL2.joystickOpen(0)
	puts "name: #{SDL2.joystickNameForIndex(0)}"
	puts "num_axes: #{SDL2.joystickNumAxes(joystick)}"
	puts "num_hats: #{SDL2.joystickNumHats(joystick)}"
	puts "num_buttons: #{SDL2.joystickNumButtons(joystick)}"
	puts "num_balls: #{SDL2.joystickNumBalls(joystick)}"
	puts "GUID: #{SDL2.joystickGetGUID(joystick)}"
	puts "attached?: #{SDL2.joystickGetAttached(joystick)}"
end

running = true

while running
	if SDL2.pollEvent(out event) != 0
		case event.type
			when SDL2::EventType::JOYBUTTONDOWN,SDL2::EventType::JOYBUTTONUP
				puts "Button #{event.jbutton.button}, Event #{event.type}"
			when SDL2::EventType::QUIT
				running = false
		end
	end
end
