class NotifyController < FayeRails::Controller
  channel '/notify/**' do
    monitor :subscribe do
      puts "Client #{client_id} subscribed to #{channel}"
    end
    monitor :unsubscribe do
      puts "Client #{client_id} unsubscribed from #{channel}"
    end
    monitor :publish do
      puts "Client #{client_id} published #{data.inspect} to #{channel}"
    end
  end
end
