class AddForeignKeysSpeciality < ActiveRecord::Migration[7.1]
  def change
    add_reference :doctors, :speciality, foreign_key: true
  end
end
