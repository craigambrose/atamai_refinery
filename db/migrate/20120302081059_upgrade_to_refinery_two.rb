class UpgradeToRefineryTwo < ActiveRecord::Migration
  def self.up
    # For refinerycms-authentication
    rename_table :roles_users, :refinery_roles_users
    rename_table :roles, :refinery_roles
    rename_table :user_plugins, :refinery_user_plugins
    rename_table :users, :refinery_users
    remove_column :refinery_users, :persistence_token
    remove_column :refinery_users, :perishable_token
    remove_column :refinery_users, :remember_token
    add_column :refinery_users, :reset_password_sent_at, :datetime

    # For refinerycms-pages
    rename_table :page_parts, :refinery_page_parts
    rename_column :refinery_page_parts, :page_id, :refinery_page_id
    rename_table :pages, :refinery_pages
    add_column :refinery_pages, :slug, :string
    add_column :refinery_pages, :view_template, :string
    add_column :refinery_pages, :layout_template, :string
    rename_column :refinery_pages, :position, :unused_position

    # For refinerycms-images
    rename_table :images, :refinery_images

    # For refinerycms-resources
    rename_table :resources, :refinery_resources

    # For refinerycms-i18n
    rename_table :page_translations, :refinery_page_translations
    rename_column :refinery_page_translations, :page_id, :refinery_page_id
    add_column :refinery_page_translations, :slug, :string
    add_column :refinery_page_translations, :menu_title, :string
    add_column :refinery_page_translations, :custom_slug, :string
    remove_column :refinery_page_translations, :custom_title

    rename_table :page_part_translations, :refinery_page_part_translations
    rename_column :refinery_page_part_translations, :page_part_id, :refinery_page_part_id
  end

  def self.down
    raise NotImplementedError
  end
end