require 'net/http'

class FayeClient
  class << self
    def publish(channel, params)
      Thread.new {
        params[:token] = Settings.faye_token
        message = {:channel => channel, :data => params}
        uri = URI.parse(Settings.faye_server)
        Net::HTTP.post_form(uri, :message => message.to_json)
      }
    end
  end
end
