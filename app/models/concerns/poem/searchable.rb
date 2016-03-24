# elasticsearch用の検索モジュール
module Concerns::Poem::Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    index_name "poem_#{Rails.env}"

    settings do
      mappings dynamic: 'false' do
        indexes :title, analyzer: 'kuromoji'
        indexes :description, analyzer: 'kuromoji'
        indexes :author_name, analyzer: 'kuromoji'
        indexes :created_at, type: 'date', format: 'date_time'
      end
    end

    def self.search(params = {})
      keyword = params[:keywords]

      search_definition = Elasticsearch::DSL::Search.search {
        query {
          if keyword.present?
            multi_match {
              query keyword
              fields %w{ title description author_name }
            }
          else
            match_all
          end
        }
      }

      __elasticsearch__.search(search_definition)
    end
  end

  def as_indexed_json(options = {})
    attributes
    .symbolize_keys
    .slice(:title, :description, :created_at)
    .merge(author_name: author_name)
  end
end
