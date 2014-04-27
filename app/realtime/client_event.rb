class ClientEvent
  def incoming(message, callback)
    if message['channel'] !~ %r{^/meta/}
      if message['data']
        if message['data']['token'] != Settings.faye_token
          # Setting any 'error' against the message causes Faye to not accept it.
          message['error'] = "403::Authentication required"
        else
          message['data'].delete('token')
        end
      end
    end
    callback.call(message)
  end
end
