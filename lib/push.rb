@@socket = nil

if pushes = PushMessage.all
  pushes.each do |push|
    begin
      puts push.inspect
      #key = ["48987aa5 f16aa9d5 2934734f 87a77a19 9d74827a 34611e87 11807edb 3c5210fa".delete(' ')].pack('H*')
      key = [push.token.delete(' ')].pack('H*')
      message = { "aps" => { "badge" => push.badge, "alert" => push.message, "sound" => push.sound}}.to_json
      notification_packet = [0, 0, 32, key, 0, message.size, message].pack("ccca*cca*")

      unless(@@socket)
        context = OpenSSL::SSL::SSLContext.new
        context.cert = OpenSSL::X509::Certificate.new(File.read("#{RAILS_ROOT}#{PUSH_CONFIG['cert']}"))
        context.key = OpenSSL::PKey::RSA.new(File.read("#{RAILS_ROOT}#{PUSH_CONFIG['cert']}"))
        sock = TCPSocket.new(PUSH_CONFIG['url'], 2195)
        ssl = OpenSSL::SSL::SSLSocket.new(sock,context)
        ssl.connect
        @@socket = ssl
      end
      @@socket.write(notification_packet)

      puts 'pushed'

    rescue Exception => e
      puts e.inspect
    ensure
      push.destroy
    end

  end
  
  if @@socket
    @@socket.close
    @@socket = nil
  end
  
else
  puts 'Nothing to push'
end