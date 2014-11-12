class SnippetNotifier < ActionMailer::Base
  def snippet_sharing(sharer:, sharee:, snippet:)
    @snippet = snippet
    
    mail(
      from: sharer.email,
      to: sharee.email,
      subject: "#{sharer.name} wants to share a snippet to you",
      template_path: 'mailers/snippets',
      template_name: 'sharing'
    )
  end
end 