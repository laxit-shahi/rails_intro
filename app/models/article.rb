class Article < ApplicationRecord
  # This now gives the article object access to ALL of the variables, validation and more in the Module (Mixin) Visible
  include Visible

  # Ensure that all subclasses/ dependents are destroyed
  # In this case, comments SHOULD NOT exist when the article has been delted (unless for data tracking purposes)
  has_many :comments, dependant: :destory

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
