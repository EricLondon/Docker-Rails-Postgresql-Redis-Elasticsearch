class PagesController < ApplicationController
  before_action :authenticate_user!

  def index
    # postgresql model data
    @test_models = TestModel.all

    # elasticsearch data
    @index_mapping = TestModel.index_mapping
    @search_results = TestModel.search('test')

    # redis data
    @increment_count = TestModel.increment_count
    @redis_keys = RedisClient.redis.keys
  end
end
