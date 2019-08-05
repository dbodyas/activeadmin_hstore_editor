module ActiveAdminHstoreEditor
  module ResourceDSL
    def hstore_editor(fields = [])
      before_action do |object|
        next if %w[update save create].exclude?(params[:action])

        raw = object.class.name.underscore
        request_namespace = raw.split('/').last.gsub('_controller', '').singularize

        unless params.key?(request_namespace)
          raise ActionController::ParameterMissing, request_namespace
        end
        columns = resource.class.columns_hash
        fields.concat(columns.select { |_, attr| attr.type == :hstore }.keys)
        fields.each do |key|
          next unless params[request_namespace].key?(key)

          json = params[request_namespace][key]
          data = (json == 'null' || json.blank?) ? {} : JSON.parse(json)
          params[request_namespace][key] = data
          params[request_namespace][key].permit!
        end
      end
    end
  end
end
