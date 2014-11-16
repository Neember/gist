module RailsAdmin::Snippet
  extend ActiveSupport::Concern

  included do
    rails_admin do
      list do
        field :id
        field :title
        field :user_id do 
          pretty_value do 
            user = bindings[:object].user
            bindings[:view].link_to "#{user.username}", bindings[:view].rails_admin.show_path(user.class.name.underscore, user.id)
          end
        end
      end
    end
  end
end
