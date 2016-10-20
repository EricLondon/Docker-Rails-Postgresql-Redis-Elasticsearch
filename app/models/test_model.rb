require 'elasticsearch/model'

class TestModel < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  validates :body, presence: true
  validates :title, presence: true

  REDIS_COUNTER_KEY = "#{self}:counter"

  def self.increment_count
    RedisClient.redis.incr REDIS_COUNTER_KEY
  end

  def self.index_mapping
    __elasticsearch__.client.perform_request('GET', "#{index_name}/_mapping", {}, nil).body[index_name]['mappings'][ActiveSupport::Inflector.singularize(index_name)]
  end

  def self.search(query = nil, options = {})
    search_definition = {
      size: options[:size] || 10,
    }

    if query.present?
      search_definition[:query] = {
        bool: {
          should: [
            multi_match: {
              query: query,
              fields: %w(title body),
              operator: 'and'
            }
          ]
        }
      }
    end

    __elasticsearch__.search(search_definition).response.hits
  end
end
