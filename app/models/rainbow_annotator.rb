require 'rmagick'

class RainbowAnnotator
  COLORS = %w(
    #ff0000
    #ffa500
    #ffff00
    #00ff00
    #00ffa5
    #00ffff
    #0000ff
    #a500ff
    #ff00ff
  ).freeze

  def self.draw_rainbow(text, draw, image, draw_height)
    colors = COLORS.cycle
    width_accum = 10

    text.each_char do |char|
      if char == '/'
        draw.stroke_width = 0.0
        draw.fill = '#000000'
      else
        draw.stroke = '#000000'
        draw.stroke_width = 0.01
        draw.fill = colors.next
      end

      metrics = draw.get_type_metrics(char)
      draw.annotate(image, metrics.width, metrics.height, width_accum, draw_height, char)
      width_accum += metrics.width
    end
  end
end
