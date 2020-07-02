class DropArticlesTables < ActiveRecord::Migration[5.2]
  def up
    drop_table :articles_tables
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
