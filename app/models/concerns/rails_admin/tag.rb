module RailsAdmin::Tag 
	extend ActiveSupport::Concern

	included do
		rails_admin do
			edit do
				field :title
				field :snippets
			end

			show do
				field :title
				field :snippets
			end

			list do
				field :title
				field :snippets
			end
		end
	end
end