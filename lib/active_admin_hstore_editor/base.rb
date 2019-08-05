module ActiveAdminHstoreEditor
  module Base
    mattr_accessor :default_hstore_input_options
    @@default_hstore_input_options = {}

    def to_html
      html = '<div class="jsoneditor-wrap">'
      current_value = @object.public_send method
      html << builder.text_area(method, input_html_options.merge(
                                        hidden: true,
                                        value: (current_value.respond_to?(:to_json) ? current_value.to_json : '')))
      html << '</div>'
      html << '<div style="clear: both"></div>'
      input_wrapping do
        label_html << html.html_safe
      end
    end

    def html_class
      'hide'
    end

    def input_html_data
      {}
    end

    def input_html_options(input_name = nil, placeholder = nil)
      super().tap do |options|
        options[:class] = [self.options[:class], html_class].compact.join(' ')
        options[:data] ||= input_html_data
        options[:data].merge!(hstore_input_options: hstore_input_options)
        options[:value] = input_value(input_name)
        options[:maxlength] = 19
        options[:placeholder] = placeholder unless placeholder.nil?
      end
    end

    def input_value(input_name = nil)
      object.public_send(input_name || method)
    end

    def hstore_input_options
      @hstore_input_options ||= begin
        options = self.options.fetch(:hstore_input_options, {})
        options = Hash[options.map { |k, v| [k.to_s.camelcase(:lower), v] }]
        _default_hstore_input_options.merge(options)
      end
    end

    protected

    def _default_hstore_input_options
      res = default_hstore_input_options.map do |k, v|
        if v.respond_to?(:call) || v.is_a?(Proc)
          [k, v.call]
        else
          [k, v]
        end
      end
      Hash[res]
    end
  end
end

