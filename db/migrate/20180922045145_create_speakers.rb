class CreateSpeakers < ActiveRecord::Migration[5.2]
  def change
    create_table :speakers do |t|
      t.string :name, null: false
      t.string :talk_title
    end
  end
end