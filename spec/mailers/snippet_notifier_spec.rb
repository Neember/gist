require 'rails_helper'

describe SnippetNotifier do
  describe '#snippet_sharing' do
    let(:snippet) { create :snippet }
    let(:jack) { create :user }
    let(:john) { create :user }
    let(:notifier) do
      SnippetNotifier.snippet_sharing(sharer: jack, sharee: john, snippet: snippet)
    end
    let(:email) { ActionMailer::Base.deliveries.last }

    it 'sets the correct subject, body, senders and receivers' do
      notifier.deliver
      expect(email.subject).to eq "#{jack.name} wants to share a snippet to you"
      expect(email.body).to have_content "I have just shared a gist on Neember Gist"
      expect(email.from).to include jack.email
      expect(email.to).to include john.email
    end
  end
end