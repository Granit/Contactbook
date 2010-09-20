module JqueryAutocompleteFormBuilderHelper

  def text_field_with_auto_complete(method, options = {}, auto_complete_options = {})
    text_field(method, options) + auto_complete_for(method, auto_complete_options)
  end

  def auto_complete_for(method, options = {})
    @template.auto_complete_for(@object_name, method, options)
  end

end
