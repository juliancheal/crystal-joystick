module CrystalJoystick
  module Adaptors
    class Joystick
      def connect
        SDL2.init(SDL2::Init::EVERYTHING)

        raise "No SDL joystick available" if SDL2.numJoysticks == 0

        @joystick = SDL2.joystickOpen(0) # TODO: allow user to choose which joystick
      end

      def firmware_name
        SDL2.joystickName(@joystick)
      end

      def poll
        SDL2.joystickUpdate
      end

      def num_joysticks
        SDL2.numJoysticks
      end

      def num_axes
        SDL2.joystickNumAxes(@joystick)
      end

      def axis(n)
        SDL2.joystickGetAxis(@joystick, n)
      end

      def num_balls
        SDL2.joystickNumBalls(@joystick)
      end

      def ball(n)
        SDL2.joystickGetBall(@joystick, n)
      end

      def num_hats
        SDL2.joystickNumHats(@joystick)
      end

      def hat(n)
        SDL2.joystickGetHat(@joystick, n)
      end

      def num_buttons
        SDL2.joystickNumButtons(@joystick)
      end

      def button(n)
        SDL2.joystickGetButton(@joystick, n)
      end

    end
  end
end
