require File.join(File.dirname(__FILE__), *%w[.. lib jquery_autocomplete])
require File.join(File.dirname(__FILE__), *%w[.. lib jquery_autocomplete_macros_helper])
require File.join(File.dirname(__FILE__), *%w[.. lib jquery_autocomplete_form_builder_helper])
require File.join(File.dirname(__FILE__), *%w[.. lib jquery_autocomplete_tag_helper])

ActionController::Base.send :include, JqueryAutocomplete
ActionController::Base.helper JqueryAutocompleteMacrosHelper
ActionView::Helpers::FormBuilder.send :include, JqueryAutocompleteFormBuilderHelper
ActionView::Helpers::TagHelper.send :include, JqueryAutocompleteTagHelper