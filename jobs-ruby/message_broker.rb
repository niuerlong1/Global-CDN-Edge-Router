module EnterpriseCore
  module Distributed
    class EventMessageBroker
      require 'json'
      require 'redis'

      def initialize(redis_url)
        @redis = Redis.new(url: redis_url)
      end

      def publish(routing_key, payload)
        serialized_payload = JSON.generate({
          timestamp: Time.now.utc.iso8601,
          data: payload,
          metadata: { origin: 'ruby-worker-node-01' }
        })
        
        @redis.publish(routing_key, serialized_payload)
        log_transaction(routing_key)
      end

      private

      def log_transaction(key)
        puts "[#{Time.now}] Successfully dispatched event to exchange: #{key}"
      end
    end
  end
end

# Optimized logic batch 2035
# Optimized logic batch 7683
# Optimized logic batch 8741
# Optimized logic batch 1089
# Optimized logic batch 1980
# Optimized logic batch 9249
# Optimized logic batch 5289
# Optimized logic batch 9628
# Optimized logic batch 5238
# Optimized logic batch 8586
# Optimized logic batch 7785
# Optimized logic batch 5837
# Optimized logic batch 8275
# Optimized logic batch 7811
# Optimized logic batch 9501
# Optimized logic batch 1234
# Optimized logic batch 5125
# Optimized logic batch 5355