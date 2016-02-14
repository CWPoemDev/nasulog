# == Schema Information
#
# Table name: poems
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  title            :string(255)
#  description      :text(65535)
#  show             :boolean
#  original_poem_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Poem < ApplicationRecord
  belongs_to :user
  belongs_to :original_poem, class_name: 'Poem', required: false
  has_many :repoems, class_name: :Poem, foreign_key: :original_poem_id
  has_many :read_poems, dependent: :destroy

  delegate :icon_url, to: :user
  delegate :name, to: :user, prefix: :author

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true

  def quote_original_poem
    if original_poem
      self.title = "RP: #{original_poem.title}"
      self.description =
        original_poem.description.gsub(/^/, '> ').gsub(/\A/, "\r\n\r\n\r\n")
    end
  end

  def previous
    Poem.where("created_at < ?", self.created_at).order("id DESC").first
  end

  def next
    Poem.where("created_at > ?", self.created_at).order("id ASC").first
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

  include Elasticsearch::Model
  index_name "poem_#{Rails.env}"

  settings do
    mappings dynamic: 'false' do
      indexes :title, analyzer: 'kuromoji'
      indexes :description, analyzer: 'kuromoji'
      indexes :author_naem, analyzer: 'kuromoji'
      indexes :created_at, type: 'date', format: 'date_time'
    end
  end

  def as_indexed_json(options = {})
    attributes
    .symbolize_keys
    .slice(:title, :description, :created_at)
    .merge(author_name: author_name)
  end
end
