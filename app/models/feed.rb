class Feed < ApplicationRecord
  has_many :episodes
  has_and_belongs_to_many :users

  def self.new_from_url(url)
    feed = Feed.find_or_initialize_by(url:)
    feed.refresh
    feed
  end

  def refresh
    rss = fetch

    self.update(
      name: rss.title,
      image: rss.itunes_image,
      description: rss.description
    )

    rss.entries.reverse.each do |entry|
      episode = Episode.find_or_initialize_by(url: entry.enclosure_url, feed: self)
      episode.update(
        title: entry.title,
        duration: entry.itunes_duration,
        published_at: entry.published,
        description: entry.summary,
        mimetype: entry.enclosure_type,
        bytes: Integer(entry.enclosure_length, exception: false),
        guid: entry.entry_id,
        image: entry.itunes_image
      )
    end
  end

  private

  def fetch
    Feedjira.parse(HTTPX.get(url).body.to_s)
  end
end
