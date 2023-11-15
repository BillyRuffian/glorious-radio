class Episode < ApplicationRecord
  belongs_to :feed
  has_many :listens

  after_create_commit { broadcast_prepend_later_to feed, partial: "feeds/episode", locals: { episode: self }, target: "feed-episodes" }
  after_destroy_commit { broadcast_remove_to feed, target: self }
  after_update_commit { broadcast_replace_later_to feed, partial: "feeds/episode", locals: { episode: self }, target: self }
end
