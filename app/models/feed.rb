class Feed < ApplicationRecord
  has_many :episodes, dependent: :destroy
  has_and_belongs_to_many :users

  def self.new_from_url(url)
    feed = Feed.find_or_initialize_by(url:)
    feed.refresh
    feed
  end

  def refresh
    rss = fetch

    self.update(
      name: rss.title.strip,
      image: rss.itunes_image.strip,
      description: rss.description.strip
    )

    rss.entries.reverse.each do |entry|
      episode = Episode.find_or_initialize_by(url: entry.enclosure_url, feed: self)
      episode.update(
        title: entry.title.strip,
        duration: entry.itunes_duration.strip,
        published_at: entry.published,
        description: entry.summary.strip,
        mimetype: entry.enclosure_type.strip,
        bytes: Integer(entry.enclosure_length, exception: false),
        guid: entry.entry_id.strip,
        image: entry.itunes_image.strip
      )
    end
  end

  def subscribed?(user)
    users.include?(user)
  end

  private

  def fetch
    Feedjira.parse(HTTParty.get(url).body)
  end
end
