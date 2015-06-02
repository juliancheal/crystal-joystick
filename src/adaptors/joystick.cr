module Joystick
  module Adaptors
#     class Joystick
      @[Link("SDL2")]
      lib SDL2

        fun init = SDL_Init(flags : Init) : Int32

        fun numJoysticks = SDL_NumJoysticks
        fun joystickName = SDL_JoystickName
        fun joystickOpen = SDL_JoystickOpen
        fun joystickOpened = SDL_JoystickOpened
        fun joystickIndex = SDL_JoystickIndex
        fun joystickNumAxes = SDL_JoystickNumAxes
        fun joystickNumBalls = SDL_JoystickNumBalls
        fun joystickNumHats = SDL_JoystickNumHats
        fun joystickNumButtons = SDL_JoystickNumButtons
        fun joystickUpdate = SDL_JoystickUpdate
        fun joystickGetAxis = SDL_JoystickGetAxis
        fun joystickGetHat = SDL_JoystickGetHat
        fun joystickGetButton = SDL_JoystickGetButton
        fun joystickGetBall = SDL_JoystickGetBall
        fun joystickClose = SDL_JoystickClose

        # ENUMS
        @[Flags]
        enum Init : UInt32
          Timer          = 0x00000001
          Joystick       = 0x00000200
          Haptic         = 0x00001000
          GameController = 0x00002000
          Events         = 0x00004000
          Everything     = Timer | Audio | Video | Events | Joystick | Haptic | GameController
        end
      end
#     end
  end
end
