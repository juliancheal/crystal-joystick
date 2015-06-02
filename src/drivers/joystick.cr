require "./macosx_binding_map"

module CrystalJoystick
  module Drivers
    # The sdl-joystick driver behaviors
    class Joystick

      getter connection
      getter running
      getter button_values

      def initialize(connection)
        @connection = connection
        @running = true
        @button_values = {} of Int32 => UInt8
      end

      # Start driver and any required connections
      def start_driver(interval)
        while @running
          every(interval) do
            handle_message_events
          end
        end
      end

      def every(interval, &block)
        sleep(interval)
        block.call
      end

      def currently_pressed?(b)
        if button_map.has_value?(b)
          button_values[button_map.key(b)]
        end
      end

      def handle_message_events
        @connection.poll
        handle_buttons
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

      def handle_buttons
        connection.num_buttons.times {|b|
          currently_pressed = connection.button(b)
          begin
            if @button_values[b] != currently_pressed
              @button_values[b] = currently_pressed
              publish_button(b)
            end
	        rescue ex
            # ¯\_(ツ)_/¯
            @button_values[b] = currently_pressed
            publish_button(b)
          end
        }
      end

      def button_map(value)
        BINDING_MAP[:ps3][:button_map][value]
      end

      # def publish_joystick(s, x, y)
      #   publish(event_topic_name("update"), "joystick", {:x => x, :y => y, :s => s})
      #   publish(event_topic_name("joystick"), {:x => x, :y => y, :s => s})
      #   publish(event_topic_name("joystick_#{s}"), {:x => x, :y => y})
      # end
      #
      def publish_button(b)
        if @button_values[b] == 1
          puts "Button_#{button_map(b)} is currently pressed"
        else
          # puts "Button_#{button_map(b)} is released"
        end
      end
    end
  end
end
