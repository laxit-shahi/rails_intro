class Comment < ApplicationRecord
  # This now gives the Comment object access to ALL of the variables, validation and more in the Module (Mixin) Visible
  include Visible

  belongs_to :article
end
