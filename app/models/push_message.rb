class PushMessage
  
  include MongoMapper::Document
  
  key :badge, Integer
  key :message, String
  key :sound, String
  key :token, String
  
  def to_s
    "#{badge} #{message} #{sound} #{token}"
  end
  
end