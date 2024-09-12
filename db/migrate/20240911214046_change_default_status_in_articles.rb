class ChangeDefaultStatusInArticles < ActiveRecord::Migration[7.2]
  def change
    change_column_default :articles, :status, from: nil, to: "public"
  end
end
