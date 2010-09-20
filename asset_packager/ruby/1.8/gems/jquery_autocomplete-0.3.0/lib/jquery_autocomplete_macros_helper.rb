module JqueryAutocompleteMacrosHelper
  # Adds JQuery autocomplete functionality to the text input field with the
  # DOM ID specified by +field_id+.
  #
  # You'll probably want to turn the browser's built-in autocompletion off,
  # so be sure to include an <tt>autocomplete="off"</tt> attribute with your text
  # input field.
  #
  # Required +options+ are:
  # <tt>:source</tt>::               URL to call for autocompletion results
  #                                  in url_for format.
  #
  # Addtional +options+ are:
  # <tt>:update</tt>::               Specifies the DOM ID of the element whose
  #                                  innerHTML should be updated with the autocomplete
  #                                  entries returned by the request.
  #                                  Defaults to <tt>field_id</tt> + '_auto_complete'
  # <tt>:disabled</tt>::             Disables (true) or enables (false) the autocomplete.
  #                                  Can be set when initialising (first creating) the autocomplete.
  #                                  Defaults to <tt>false</tt>.
  # <tt>:delay</tt>::                The delay in milliseconds the Autocomplete waits after
  #                                  a keystroke to activate itself. A zero-delay makes sense
  #                                  for local data (more responsive), but can produce a lot
  #                                  of load for remote data, while being less responsive.
  #                                  Defaults to <tt>300</tt>.
  # <tt>:min_length</tt>::           The minimum number of characters a user has to type
  #                                  before the Autocomplete activates. Zero is useful for
  #                                  local data with just a few items. Should be increased
  #                                  when there are a lot of items, where a single character
  #                                  would match a few thousand items.
  #                                  Defaults to <tt>1</tt>.
  # <tt>:search</tt>::               Before a request (source-option) is started, after
  #                                  minLength and delay are met. Can be canceled (return false),
  #                                  then no request will be started and no items suggested.
  # <tt>:open</tt>::                 Triggered when the suggestion menu is opened.
  # <tt>:focus</tt>::                Before focus is moved to an item (not selecting), ui.item
  #                                  refers to the focused item. The default action of focus is
  #                                  to replace the text field's value with the value of the focused
  #                                  item. Canceling this event prevents the value from being updated,
  #                                  but does not prevent the menu item from being focused.
  # <tt>:select</tt>::               Triggered when an item is selected from the menu; ui.item
  #                                  refers to the selected item. The default action of select is
  #                                  to replace the text field's value with the value of the
  #                                  selected item. Canceling this event prevents the value from
  #                                  being updated, but does not prevent the menu from closing.
  # <tt>:close</tt>::                When the list is hidden - doesn't have to occur together
  #                                  with a change.
  # <tt>:change</tt>::               After an item was selected; ui.item refers to the selected
  #                                  item. Always triggered after the close event.
  def auto_complete_field(field_id, options = {})
    js_options = {}
    js_options[:source]        = "'#{url_for(options[:source])}'"
    js_options[:update]        = "'" + (options[:update] || "#{field_id}_auto_complete") + "'"

    {:min_length => :minLength, :delay => :delay, :disabled => :disabled}.each do |k, v|
      js_options[v] = options[k] if options[k]
    end

    [:search, :open, :focus, :select, :close, :change].each do |k|
      js_options[k] = "function(event,ui){#{options[k]}}" if options[k]
    end

    function = "$('##{field_id}').autocomplete("
    function << options_for_javascript(js_options) + ')'

    javascript_tag(function)
  end

  def auto_complete_result(entries, field, phrase = nil)
    return unless entries
    unique_entries= entries.uniq.map do |entry|
      {'id' => entry[:id],
        'value' => h(entry[field]),
        'label' => phrase ? highlight(entry.send(field), phrase) : h(entry[field])}
    end
    unique_entries.to_json
  end

  def auto_complete_for(object, method, options = {})
    content_tag('div', '', :id => "#{object}_#{method}_auto_complete") +
      auto_complete_field("#{object}_#{method}", { :source => { :action => "auto_complete_for_#{object}_#{method}" } }.update(options))
  end

  def text_field_with_auto_complete(object, method, tag_options = {}, completion_options = {})
    text_field(object, method, tag_options) +
      auto_complete_for(object, method, completion_options)
  end

end