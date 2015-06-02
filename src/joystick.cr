require "./adaptors/joystick"
require "./drivers/joystick"

@[Link("SDL2")]
lib SDL2

  fun init = SDL_Init(flags : Init) : Int32
  fun getError = SDL_GetError() : UInt8*
  fun joystickOpen = SDL_JoystickOpen(device_index : Int32) : Joystick*
  fun numJoysticks = SDL_NumJoysticks() : Int32
  fun joystickClose = SDL_JoystickClose()
	fun joystickGetAttached = SDL_JoystickGetAttached(joystick : Joystick*) : Bool
	fun joystickGetAxis = SDL_JoystickGetAxis(joystick : Joystick*, axis : Int32) : Int16
	fun joystickGetBall = SDL_JoystickGetBall(joystick : Joystick*, ball : Int32, dx : Int32*, dy : Int32*) : Int32
	fun joystickGetButton = SDL_JoystickGetButton(joystick : Joystick*, button : Int32) : UInt8
	fun joystickGetHat = SDL_JoystickGetHat(joystick : Joystick*, hat : Int32) : UInt8
	fun joystickInstanceID = SDL_JoystickInstanceID(joystick : Joystick*) : JoystickID
	fun joystickName = SDL_JoystickName(joystick : Joystick*) : UInt8*
	fun joystickNumAxes = SDL_JoystickNumAxes(joystick : Joystick*) : Int32
	fun joystickNumBalls = SDL_JoystickNumBalls(joystick : Joystick*) : Int32
	fun joystickNumHats = SDL_JoystickNumHats(joystick : Joystick*) : Int32
  fun joystickNumButtons = SDL_JoystickNumButtons(joystick : Joystick*) : Int32
	fun joystickUpdate = SDL_JoystickUpdate() : Void
  fun pollEvent = SDL_PollEvent(event : Event*) : Int32
	fun quit = SDL_Quit() : Void

  struct JoystickInternal
    data : UInt8
  end

  type Joystick = JoystickInternal

  struct JoystickGUID
    data : UInt8[16]
  end

  type JoystickID = UInt32

  @[Flags]
  enum Init : UInt32
    TIMER          = 0x00000001
    JOYSTICK       = 0x00000200
    HAPTIC         = 0x00001000
    GAMECONTROLLER = 0x00002000
    EVENTS         = 0x00004000
    PARACHUTE      = 0x00100000
    EVERYTHING     = TIMER | EVENTS | JOYSTICK | HAPTIC | GAMECONTROLLER
  end

  @[Flags]
  enum Events : UInt32
    JoyAxisMotion    = 0x600
    JoyBallMotion    = 0x601
    JoyHatMotion     = 0x602
    JoyButtonDown    = 0x603
    JoyButtonUp      = 0x604
    JoyDeviceAdded   = 0x605
    JoyDeviceRemoved = 0x606
  end

  enum EventType
    QUIT = 256
    JOYAXISMOTION = 1536
    JOYBALLMOTION
    JOYHATMOTION
    JOYBUTTONDOWN
    JOYBUTTONUP
    JOYDEVICEADDED
    JOYDEVICEREMOVED
  end

  struct CommonEvent
    type : EventType
    timestamp : UInt32
  end

  struct JoyAxisEvent
    type : EventType
    timestamp : UInt32
    which : JoystickID
    axis : UInt8
    padding1 : UInt8
    padding2 : UInt8
    padding3 : UInt8
    value : Int16
    padding4 : UInt16
  end

  struct JoyBallEvent
    type : EventType
    timestamp : UInt32
    which : JoystickID
    ball : UInt8
    padding1 : UInt8
    padding2 : UInt8
    padding3 : UInt8
    xrel : Int16
    yrel : Int16
  end

  struct JoyHatEvent
    type : EventType
    timestamp : UInt32
    which : JoystickID
    hat : UInt8
    value : UInt8
    padding1 : UInt8
    padding2 : UInt8
  end

  struct JoyButtonEvent
    type : EventType
    timestamp : UInt32
    which : JoystickID
    button : UInt8
    state : UInt8
    padding1 : UInt8
    padding2 : UInt8
  end

  struct JoyDeviceEvent
    type : EventType
    timestamp : UInt32
    which : Int32
  end

  struct QuitEvent
    type : EventType
    timestamp : UInt32
  end

  union Event
    type : EventType
    common : CommonEvent

    jaxis : JoyAxisEvent
    jball : JoyBallEvent
    jhat : JoyHatEvent
    jbutton : JoyButtonEvent
    jdevice : JoyDeviceEvent
    # caxis : ControllerAxisEvent
    # cbutton : ControllerButtonEvent
    # cdevice : ControllerDeviceEvent
    quit : QuitEvent
    padding : UInt8[56]
  end
end
