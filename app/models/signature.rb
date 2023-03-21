require 'rmagick'
require 'securerandom'

class Signature < ApplicationRecord
  validates :username, :api_key, :static_signature, :background_color, presence: true
  validates :username, :api_key, uniqueness: true

  before_validation :set_api_key

  def generate_signature_image
    pronouns = generate_signature_pronouns
    draw = set_draw_context
    static_signature_metrics = draw.get_multiline_type_metrics(self.static_signature)
    pronouns_metrics = draw.get_type_metrics(pronouns)
    image = generate_new_image(static_signature_metrics, pronouns_metrics)
    draw.annotate(image, static_signature_metrics.width, static_signature_metrics.height, 10, 10, self.static_signature)
    RainbowAnnotator.draw_rainbow(pronouns, draw, image, 10 + static_signature_metrics.height)

    image
  end

  private

  def generate_new_image(static_signature_metrics, pronouns_metrics)
    image = Magick::Image.new(
      [static_signature_metrics.width, pronouns_metrics.width].max + 20,
      static_signature_metrics.height + pronouns_metrics.height + 20,
      Magick::SolidFill.new(self.background_color)
    )
    image.format = 'png'

    return image
  end

  def generate_signature_pronouns
    Array.new(3) do
      NonsenseWordGenerator.generate_nonsense_word
    end.join('/')
  end

  def set_api_key
    return if self.api_key.present?
    self.api_key = SecureRandom.uuid
  end

  def set_draw_context
    draw = Magick::Draw.new
    draw.pointsize   = 20
    draw.fill        = '#000000'
    draw.gravity     = Magick::NorthWestGravity
    draw.font_weight = 100
    draw.font_family = 'DejaVu Sans Mono'
    draw.font_style  = Magick::NormalStyle

    return draw
  end
end
