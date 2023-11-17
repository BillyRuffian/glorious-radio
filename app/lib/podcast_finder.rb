class PodcastFinder
  # def client
  #   @client ||= PodcastApi::Client.new( api_key: Rails.application.credentials.listen_notes.api_key )
  # end

  # def best
  #   podcast_data = client.fetch_best_podcasts( region: 'uk', page: 1 )
  #                   .body
  #                   .then { |body| JSON.parse(body) }
  #                   .with_indifferent_access

  #   podcast_data[:podcasts].each { |podcast| Feed.new_from_url(podcast[:url]) }
  # end

  def best
    f = File.new('app/lib/top-100.csv')

      f.each_line do |l| 
        puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+ l.chomp; 
        begin 
           Feed.new_from_url( l.chomp ) 
        rescue
        end
    end
  end
end