helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end

  def gfm(text)
    GitHub::Markdown.render_gfm(text)
  end
end