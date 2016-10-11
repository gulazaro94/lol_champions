require 'redis'

REDIS = Redis.new(host: 'redis', port: 6379, db: 12)

module Services
  class Caching

    def self.set(key, value, options={})
      REDIS.set(key.to_s, value, options)
    end

    def self.get(key)
      REDIS.get(key.to_s)
    end

    def self.reset
      REDIS.keys.each { |key| REDIS.del(key) }
    end
  end
end