defmodule Youtube do
  @id_regex  ~r/(?:youtube(?:-nocookie)?\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/ ]{11})/

  def extract_id(url) do
    Regex.run(@id_regex, url)
    |> List.last
  end

  def parse(url) do
    video_id = Youtube.extract_id(url)
    embed_url = "https://www.youtube.com/embed/" <> video_id
    %{ url: embed_url, video_id: video_id }
  end
end

