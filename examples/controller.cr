require "../src/joystick.cr"

joystick = CrystalJoystick::Adaptors::Joystick.new
joystick.connect
puts "name: #{joystick.firmware_name}"
puts "num_axes: #{joystick.num_joysticks}"
puts "num_hats: #{joystick.num_hats}"
puts "num_buttons: #{joystick.num_buttons}"
puts "num_balls: #{joystick.num_balls}"

driver = CrystalJoystick::Drivers::Joystick.new(joystick)
driver.start_driver(0.1)
