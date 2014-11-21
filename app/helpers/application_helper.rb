class HtmlWithPygments < Redcarpet::Render::HTML
  def check_language_available(language)
    Pygments.lexers.select { |key, lexer| lexer[:aliases].include? language }.present?
  end

  def block_code(code, language)
    options = {options: {linespans: 'line'}}
    options.merge!(lexer: language) if check_language_available(language)
    Pygments.highlight(code, options)
  end
end

module ApplicationHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(HtmlWithPygments, fenced_code_blocks: true, disable_indented_code_blocks: true)
    markdown.render(text).html_safe
  end
end
