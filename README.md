# Crystal Joystick

A Crystal joystick controller using SDL, based on Artoo-Joystick gem.

## Installation

Add it to `Projectfile`

```crystal
deps do
  github "https://github.com/juliancheal/crystal-joystick"
end
```

## Usage

```crystal
require "crystal-joystick"

joystick = CrystalJoystick::Adaptors::Joystick.new
joystick.connect
driver = CrystalJoystick::Drivers::Joystick.new(joystick)
driver.start_driver(0.1)
```
Currently only outputs to the command line
And seems to use 100% of the cpu!!

## Development

TODO: Write instructions for development

## Contributing

1. Fork it ( https://github.com/juliancheal/crystal-joystick/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- Julian Cheal(https://github.com/juliancheal) Julian Cheal - creator, maintainer
