class AddTagToDeployments < ActiveRecord::Migration
  def up
    add_column :deployments, :tag, :string
  end

  def down
    drop_column :deployments, :tag
  end
end
