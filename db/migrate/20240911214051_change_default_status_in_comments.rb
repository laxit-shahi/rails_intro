class ChangeDefaultStatusInComments < ActiveRecord::Migration[7.2]
  def change
    change_column_default :comment, :status, from: nil, to: "public"
  end
end
