# Helper methods defined here can be accessed in any controller or view in the application

Portfolio.helpers do
  def soundcloud_tracks
    client = settings.soundcloud
    tracks = client.get("/me/tracks", filter: "public")
    tracks.map do |track|
      track[:oembed] = client.get("/oembed", url: track.permalink_url, color: "fe735b", show_artwork: "false")
    end
    tracks
  end
end
