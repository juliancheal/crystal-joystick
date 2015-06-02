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

# # SDL2.pollEvent(out event)
# # pp event.type
# # pp SDL2::EventType::QUIT.to_s == event.type
# running = true
# # while running
# 	while SDL2.pollEvent(out event)
# 		puts event.type
# 		if event.type == SDL2::Events::Quit.to_s
# 			running = false
# 		end
# end

running = true

while running
  # while SDL2.pollEvent(out event) != 0
	if SDL2.pollEvent(out event) != 0
		# pp event.type
		# pp event.jdevice.type
		if event.type.to_s == "JOYAXISMOTION" || event.type.to_s == "CONTROLLERDEVICEADDED" || event.type.to_s == "JOYDEVICEADDED"
		else
			# puts ""
			# puts "It works #{event.type}"
			# event.jbutton.button
			puts SDL2::PS3::X
			puts "Button #{event.jbutton.button}, Event #{event.type}"
			if event.type.to_s == "QUIT"
				running = false
			end
			# if event.type.to_s == "JOYBUTTONUP"
			# 	pp event
			# end
		end
		# case event.type
		# when SDL2::EventType::JOYAXISMOTION,SDL2::EventType::JOYDEVICEADDED,SDL2::EventType::CONTROLLERDEVICEADDED
		# when SDL2::EventType::JOYBUTTONDOWN,SDL2::EventType::JOYBUTTONUP
	  # 	pp event.type
		# 	pp event.jbutton
		# end
	end
end
