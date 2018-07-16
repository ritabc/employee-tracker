class CreateDivision < ActiveRecord::Migration[5.2]
  def change
    create_table(:divisions) do |t|
      t.column(:name, :string)
    end
  end
end
