class HtmlWithPygments < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language, options: {linespans: 'line'})
  end
end

module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(HtmlWithPygments, fenced_code_blocks: true, disable_indented_code_blocks: true)
    markdown.render(text).html_safe
  end

end
