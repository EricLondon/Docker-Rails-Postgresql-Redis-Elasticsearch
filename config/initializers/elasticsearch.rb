Elasticsearch::Model.client = Elasticsearch::Client.new(host: ENV.fetch('ELASTICSEARCH_HOST', 'localhost'))
