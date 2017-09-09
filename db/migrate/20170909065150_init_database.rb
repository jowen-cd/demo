class InitDatabase < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
    end

    create_table :friendships do |t|
      t.references :user
      t.references :friend
      t.integer :unread_sms_count, default: 0

      t.timestamps
    end

    create_table :messages do |t|
      t.references :user
      t.references :another
      t.string :type
      t.string :content, null: false
      t.boolean :is_read, default: false

      t.timestamps
    end
  end
end
