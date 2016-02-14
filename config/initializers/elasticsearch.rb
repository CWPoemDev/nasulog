Elasticsearch::Model.client =
  Elasticsearch::Client.new(host: Rails.application.config.elasticsearch_host)
