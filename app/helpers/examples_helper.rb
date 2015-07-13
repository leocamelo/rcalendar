module ExamplesHelper

  # generate a title with anchor link feature
  def anchor_title(title, tag = :h2)
    anchor = title.parameterize
    content_tag tag, link_to(title, '#' + anchor), id: anchor
  end

end
