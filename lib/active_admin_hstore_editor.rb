require 'activeadmin'
require 'active_admin_hstore_editor/version'
require 'active_admin_hstore_editor/base'
require 'active_admin_hstore_editor/resource_dsl.rb'
require 'active_admin_hstore_editor/inputs/hstore_input'

module ActiveAdminHstoreEditor
  module Rails
    class Engine < ::Rails::Engine
    end
  end
end

::ActiveAdmin::DSL.send(:include, ActiveAdminHstoreEditor::ResourceDSL)
