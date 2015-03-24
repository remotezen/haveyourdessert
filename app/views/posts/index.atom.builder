xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title   "Tuning in"
  xml.link    "rel" => "self", "href" => url('/')
  xml.id  url_for(:posts, :index)
  xml.updated @posts.first.updated_at.strftime "%Y-%m-%dT%H:%M:%SZ" if @posts.any?
  xml.author  { xml.name "Padrino Team" }
  @posts.each do |post|
    xml.entry do
      xml.title   post.title
      xml.link    "rel" => "alternate", "href" => url_for(:posts, :show, :id => post.permalink)
      xml.id      url_for(:posts, :show, :id => post.permalink)
      xml.updated post.updated_at.strftime "%Y-%m-%dT%H:%M:%SZ"
      xml.summary post.body
    end
  end
end
