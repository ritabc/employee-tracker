class UpdateNameColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :divisions do |t|
      t.rename :name, :title
    end
  end
end
