module JqueryAutocompleteTagHelper

  def to_auto_complete(options = {})
    send(:add_default_name_and_id, options)
    @template_object.auto_complete_field(options['id'], options)
  end

  def to_text_field_with_auto_complete(options = {}, text_field_options = {})
    to_input_field_tag('text', text_field_options) + to_auto_complete(options)
  end

end
