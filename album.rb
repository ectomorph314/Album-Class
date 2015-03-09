class Album
  def initialize(album_id, album_title, album_artists)
    @album_id = album_id
    @album_title = album_title
    @album_artists = album_artists
    @tracks = Array.new
  end

  def id
    @album_id
  end

  def title
    @album_title
  end

  def artists
    @album_artists
  end

  def tracks
    @tracks
  end

  def track_list
    list = String.new
    tracks.each do |track|
      list += "#{track[:title]}\n"
    end
    list
  end

  def duration_min
    duration = 0
    tracks.each do |track|
      duration += track[:duration_ms].to_f
    end
    seconds = duration/1000
    Time.at(seconds).strftime("%M:%S")
  end

  def summary
    <<-Summary
Name: #{title}
Artist(s): #{artists}
Duration (min.): #{duration_min}
Tracks:
-#{track_list}
    Summary
  end
end
