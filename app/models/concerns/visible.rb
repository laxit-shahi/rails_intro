# Module (known as mixins in other languages) can be used to abstract shared logic Models or Controllers
module Visible
  # This simplifies the module code and definition for us, but requires us to do certain thing such as: (go to ONE)
  extend ActiveSupport::Concern

  VALID_STATUSES = [ "pubilc", "private", "archived" ]

  # ONE: added included for validationc
  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  # Class methods to directly class Classes (Objects, Tables)
  class_methods do
    def public_count
      where(status: "public").count
    end
  end

  # TWO: But this gives us acces to methonds using the instance of a model
  def archived?
    status == "archived"
  end
end
