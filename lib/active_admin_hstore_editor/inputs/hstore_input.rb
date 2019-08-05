module ActiveAdmin
  module Inputs
    class HstoreInput < ::Formtastic::Inputs::StringInput
      include ActiveAdminHstoreEditor::Base
    end
  end
end

