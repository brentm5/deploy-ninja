class AddDeployments < ActiveRecord::Migration
  def change
    create_table :deployments do |t|
      t.string :tag
      t.string :branch
      t.string :commit_sha
      t.boolean :successful
      t.text :error_summary

      t.timestamps
    end
  end
end
