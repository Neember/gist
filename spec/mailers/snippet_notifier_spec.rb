require 'rails_helper'

describe SnippetNotifier do
  describe '#snippet_sharing' do
    let(:snippet) { create :snippet }
    let(:user) { create :user }
    let(:sharing_email) { 'john@example.com' }
    let(:notifier) do
      SnippetNotifier.snippet_sharing(sharer: user, share_email: sharing_email, snippet: snippet)
    end
    let(:email) { ActionMailer::Base.deliveries.last }

    it 'sets the correct subject, body, senders and receivers' do
      notifier.deliver
      expect(email.subject).to eq "#{user.name} wants to share a snippet to you"
      expect(email.body).to have_content "I have just shared a gist on Neember Gist"
      expect(email.from).to include user.email
      expect(email.to).to include sharing_email
    end
  end
end