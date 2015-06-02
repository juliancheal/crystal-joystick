module CrystalJoystick
  module Drivers
    # The sdl-joystick driver behaviors
    class Joystick

      getter connection
      getter running

      def initialize(connection)
        @connection = connection
        @running = true
      end

      # Start driver and any required connections
      def start_driver(interval)
        # @button_values = {}
        while @running
          every(interval) do
            handle_message_events
          end
        end
      end

      def every(interval, &block)
        # sleep(interval)
        block.call
      end

      def currently_pressed?(b)
        button_values[b]
      end

      def handle_message_events
        @connection.poll do |event|
        # handle_joystick
        # TODO: handle_trackball
        # TODO: handle_hats
          handle_buttons(event)
        end
      end

      # def handle_joystick
      #   number_sticks = connection.num_axes / 2
      #   number_sticks.times {|s|
      #     x = connection.axis(s * 2)
      #     y = connection.axis(s * 2 + 1)
      #
      #     publish_joystick(s, x, y)
      #   }
      # end
      #
      # def handle_trackball
      #   if connection.num_balls == 1
      #     x, y = connection.ball(0)
      #
      #     publish(event_topic_name("update"), "trackball", {:x => x, :y => y})
      #     publish(event_topic_name("trackball"), {:x => x, :y => y})
      #   end
      # end

      def handle_buttons(event)
        case event.type
          when SDL2::EventType::JOYBUTTONDOWN,SDL2::EventType::JOYBUTTONUP
            puts "Button #{event.jbutton.button}, Event #{event.type}"
          when SDL2::EventType::QUIT
            @running = false
        end
        # connection.num_buttons.times {|b|
        #   currently_pressed = connection.button(b)
        #   if button_values[b] != currently_pressed
        #     button_values[b] = currently_pressed
        #     publish_button(b)
        #   end
        # }
      end

      # def publish_joystick(s, x, y)
      #   publish(event_topic_name("update"), "joystick", {:x => x, :y => y, :s => s})
      #   publish(event_topic_name("joystick"), {:x => x, :y => y, :s => s})
      #   publish(event_topic_name("joystick_#{s}"), {:x => x, :y => y})
      # end
      #
      # def publish_button(b)
      #   if button_values[b] == 1
      #     publish(event_topic_name("update"), "button", b)
      #     publish(event_topic_name("button"), b)
      #     publish(event_topic_name("button_#{b}"))
      #   end
      # end
    end
  end
end
