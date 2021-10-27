class SignaturesController < ApplicationController
  def show
    s = Signature.find_by!(api_key: params[:api_key])
    image = s.generate_signature_image
    send_data image.to_blob, type: 'image/png', disposition: 'inline', stream: true, buffer_size: 4096
  end
end
