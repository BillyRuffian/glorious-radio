class Feed < ApplicationRecord
  has_many :episodes

  def refresh
    fetch.entries.reverse.each do |entry|
      episode = Episode.find_or_initialize_by(url: entry.enclosure_url, feed: self)
      episode.update(
        title: entry.title,
        duration: entry.itunes_duration,
        published_at: entry.published,
        description: entry.summary,
        mimetype: entry.enclosure_type,
        bytes: Integer(entry.enclosure_length, exception: false),
        guid: entry.entry_id
      )
      episode.save
    end
  end

  private

  def fetch
    Feedjira.parse(HTTPX.get(url).body.to_s)
  end
end
