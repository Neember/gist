class SnippetNotifier < ActionMailer::Base
  def snippet_sharing(sharer:, share_email:, snippet:)
    @snippet = snippet
    
    mail(
      from: sharer.email,
      to: share_email,
      subject: "#{sharer.name} wants to share a snippet to you",
      template_path: 'mailers/snippets',
      template_name: 'sharing'
    )
  end
end
