
module Colors
  LIST =
  {
      R: "Red",
      B: "Blue",
      G: "Green",
      Y: "Yellow",
      V: "Violet",
      P: "Purple",
      I: "Indigo",
      A: "Ash",
      O: "Orange"
    }

    class Colors
      def initialize

      end


      def self.generate_colors(amount)
        # LIST.to_a.sample(amount)
        sample = []
        list = LIST.to_a
        amount.times{ sample << list[Random.rand(list.length-1)] }
        sample
      end

      def self.get_color(key)
        LIST[key]
      end

      def self.get_color_keys (colors)
        keys_array = []
        colors.each{|key, color| keys_array << key.to_s;}
        return keys_array
      end

      def self.get_color_values(colors)
        values_array = []
        colors.each{|key, color| values_array << color}
        values_array
      end

      # private
      #   def create_color_list (colors_number)
      #
      #     @colors.to_a.sample(colors_number)
      #   end

      #   def get_color_keys (colors)
      #     keys_array = []
      #     colors.each{|key, color| keys_array << key.to_s;}
      #     return keys_array
      #   end
      #
        # def get_color_values(colors)
        #   values_array = []
        #   colors.each{|key, color| values_array << color}
        #   values_array
        # end

    end
end
