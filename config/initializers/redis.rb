module RedisClient
  class << self
    def redis
      @redis ||= Redis.new(host: ENV.fetch('REDIS_HOST', 'localhost'))
    end
  end
end
