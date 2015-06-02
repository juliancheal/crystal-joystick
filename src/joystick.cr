require "./*"

@[Link("SDL2")]
lib SDL2

  fun init = SDL_Init(flags : Init) : Int32
  fun getError = SDL_GetError() : UInt8*

  fun joystickOpen = SDL_JoystickOpen(device_index : Int32) : Joystick*
  fun numJoysticks = SDL_NumJoysticks() : Int32

  fun joystickClose = SDL_JoystickClose()
	fun joystickEventState = SDL_JoystickEventState(state : Int32) : Int32
	fun joystickGetAttached = SDL_JoystickGetAttached(joystick : Joystick*) : Bool
	fun joystickGetAxis = SDL_JoystickGetAxis()
	fun joystickGetBall = SDL_JoystickGetBall()
	fun joystickGetButton = SDL_JoystickGetButton()
	fun joystickGetDeviceGUID = SDL_JoystickGetDeviceGUID(device_index : Int32) : JoystickGUID
	fun joystickGetGUID = SDL_JoystickGetGUID(joystick : Joystick*) : JoystickGUID
	fun joystickGetGUIDFromString = SDL_JoystickGetGUIDFromString()
	fun joystickGetGUIDString = SDL_JoystickGetGUIDString()
	fun joystickGetHat = SDL_JoystickGetHat()
	fun joystickInstanceID = SDL_JoystickInstanceID(joystick : Joystick*) : JoystickID
	fun joystickIsHaptic = SDL_JoystickIsHaptic()
	fun joystickName = SDL_JoystickName(joystick : Joystick*) : UInt8*
	fun joystickNameForIndex = SDL_JoystickNameForIndex(device_index : Int32) : UInt8*
	fun joystickNumAxes = SDL_JoystickNumAxes(joystick : Joystick*) : Int32
	fun joystickNumBalls = SDL_JoystickNumBalls(joystick : Joystick*) : Int32
	fun joystickNumHats = SDL_JoystickNumHats(joystick : Joystick*) : Int32
  fun joystickNumButtons = SDL_JoystickNumButtons(joystick : Joystick*) : Int32
	fun joystickUpdate = SDL_JoystickUpdate()

  fun joystick_event_state = SDL_JoystickEventState(state : Int32) : Int32

  fun pollEvent = SDL_PollEvent(event : Event*) : Int32
	fun wait_event = SDL_WaitEvent(event : Event*) : Int32
	fun wait_event_timeout = SDL_WaitEventTimeout(event : Event*, timeout : Int32) : Int32
	fun push_event = SDL_PushEvent(event : Event*) : Int32
	fun set_event_filter = SDL_SetEventFilter(filter : EventFilter, userdata : Void*) : Void
	fun get_event_filter = SDL_GetEventFilter(filter : EventFilter*, userdata : Void**) : Bool
	fun add_event_watch = SDL_AddEventWatch(filter : EventFilter, userdata : Void*) : Void
	fun del_event_watch = SDL_DelEventWatch(filter : EventFilter, userdata : Void*) : Void
	fun filter_events = SDL_FilterEvents(filter : EventFilter, userdata : Void*) : Void
	fun event_state = SDL_EventState(type : UInt32, state : Int32) : UInt8
  fun register_events = SDL_RegisterEvents(numevents : Int32) : UInt32
  fun getTicks = SDL_GetTicks() : UInt32

  fun quit = SDL_Quit() : Void

  #CONSTANTS
  TRUE = 0x1
  FALSE = 0x0

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
  # AUDIO          = 0X00000010
  # VIDEO          = 0X00000020
  JOYSTICK       = 0x00000200
  HAPTIC         = 0x00001000
  GAMECONTROLLER = 0x00002000
  EVENTS         = 0x00004000
  PARACHUTE      = 0x00100000
  EVERYTHING     = TIMER | EVENTS | JOYSTICK | HAPTIC | GAMECONTROLLER
  end

  @[Flags]
  enum Events : UInt32
    FirstEvent = 0

    Quit                   = 0x100
    AppTerminating         = 0x101
    AppLowMemory           = 0x102
    AppWillEnterBackground = 0x103
    AppDidEnterBackground  = 0x104
    AppWillEnterForeground = 0x105
    AppDidEnterForeground  = 0x106

    WindowEvent = 0x200
    SysWMEvent  = 0x201

    KeyDown     = 0x300
    KeyUp       = 0x301
    TextEditing = 0x302
    TextInput   = 0x303

    MouseMotion     = 0x400
    MouseButtonDown = 0x401
    MouseButtonUp   = 0x402
    MouseWheel      = 0x403

    JoyAxisMotion    = 0x600
    JoyBallMotion    = 0x601
    JoyHatMotion     = 0x602
    JoyButtonDown    = 0x603
    JoyButtonUp      = 0x604
    JoyDeviceAdded   = 0x605
    JoyDeviceRemoved = 0x606

    ControllerAxisMotion     = 0x650
    ControllerButtonDown     = 0x651
    ControllerButtonUp       = 0x652
    ControllerDeviceAdded    = 0x653
    ControllerDeviceRemoved  = 0x654
    ControllerDeviceRemapped = 0x655

    FingerDown   = 0x700
    FingerUp     = 0x701
    FingerMotion = 0x702

    DollarGesture = 0x800
    DollarRecord  = 0x801
    MultiGesture  = 0x802

    ClipboardUpdate = 0x900

    DropFile = 0x1000

    RenderTargetReset = 0x2000

    UserEvent = 0x8000

    LastEvent = 0xFFFF
  end

  enum EventType
    FIRSTEVENT = 0
    QUIT = 256
    APP_TERMINATING
    APP_LOWMEMORY
    APP_WILLENTERBACKGROUND
    APP_DIDENTERBACKGROUND
    APP_WILLENTERFOREGROUND
    APP_DIDENTERFOREGROUND
    WINDOWEVENT = 512
    SYSWMEVENT
    KEYDOWN = 768
    KEYUP
    TEXTEDITING
    TEXTINPUT
    MOUSEMOTION = 1024
    MOUSEBUTTONDOWN
    MOUSEBUTTONUP
    MOUSEWHEEL
    JOYAXISMOTION = 1536
    JOYBALLMOTION
    JOYHATMOTION
    JOYBUTTONDOWN
    JOYBUTTONUP
    JOYDEVICEADDED
    JOYDEVICEREMOVED
    CONTROLLERAXISMOTION = 1616
    CONTROLLERBUTTONDOWN
    CONTROLLERBUTTONUP
    CONTROLLERDEVICEADDED
    CONTROLLERDEVICEREMOVED
    CONTROLLERDEVICEREMAPPED
    FINGERDOWN = 1792
    FINGERUP
    FINGERMOTION
    DOLLARGESTURE = 2048
    DOLLARRECORD
    MULTIGESTURE
    CLIPBOARDUPDATE = 2304
    DROPFILE = 4096
    RENDER_TARGETS_RESET = 8192
    USEREVENT = 32768
    LASTEVENT = 65535
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

  type EventFilter = (Void*, Event*) -> Int32

  enum PS3 : UInt8
    J0 = 1
    J1 = 2
    Start = 3
    Dpad_up = 4
    Dpad_right = 5
    Dpad_down = 6
    Dpad_left = 7
    L2 = 8
    R2 = 9
    L1 = 10
    R1 = 11
    Triangle = 12
    Circle = 13
    X = 14
    Square = 15
    Ps3 = 16
  end

  fun button_value(value : PS3)
end
# module Joystick
# end

# fun gameControllerAddMapping = SDL_GameControllerAddMapping()
# fun gameControllerAddMappingsFromFile = SDL_GameControllerAddMappingsFromFile()
# fun gameControllerAddMappingsFromRW = SDL_GameControllerAddMappingsFromRW()
# fun gameControllerClose = SDL_GameControllerClose()
# fun gameControllerEventState = SDL_GameControllerEventState()
# fun gameControllerGetAttached = SDL_GameControllerGetAttached()
# fun gameControllerGetAxis = SDL_GameControllerGetAxis()
# fun gameControllerGetAxisFromString = SDL_GameControllerGetAxisFromString()
# fun gameControllerGetBindForAxis = SDL_GameControllerGetBindForAxis()
# fun gameControllerGetBindForButton = SDL_GameControllerGetBindForButton()
# fun gameControllerGetButton = SDL_GameControllerGetButton()
# fun gameControllerGetButtonFromString = SDL_GameControllerGetButtonFromString()
# fun gameControllerGetJoystick = SDL_GameControllerGetJoystick()
# fun gameControllerGetStringForAxis = SDL_GameControllerGetStringForAxis()
# fun gameControllerGetStringForButton = SDL_GameControllerGetStringForButton()
# fun gameControllerMapping = SDL_GameControllerMapping()
# fun gameControllerMappingForGUID = SDL_GameControllerMappingForGUID()
# fun gameControllerName = SDL_GameControllerName()
# fun gameControllerNameForIndex = SDL_GameControllerNameForIndex()
# fun gameControllerOpen = SDL_GameControllerOpen()
# fun gameControllerUpdate = SDL_GameControllerUpdate()
