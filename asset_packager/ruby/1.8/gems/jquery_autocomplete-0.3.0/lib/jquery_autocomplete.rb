module JqueryAutocomplete
  def self.included(base)
    base.extend(ClassMethods)
  end

  #
  # Example:
  #
  #   # Controller
  #   class BlogController < ApplicationController
  #     auto_complete_for :post, :title
  #   end
  #
  #   # View
  #   <%= text_field_with_auto_complete :post, title %>
  #
  # By default, auto_complete_for limits the results to 10 entries,
  # and sorts by the given field.
  #
  # auto_complete_for takes a third parameter, an options hash to
  # the find method used to search for the records:
  #
  #   auto_complete_for :post, :title, :limit => 15, :order => 'created_at DESC'
  #    def auto_complete_for(object_name, method_name, options = {})
  #
  module ClassMethods
    def auto_complete_for(object_name, method_name, options = {})
      self.send(:define_method, "auto_complete_for_#{object_name}_#{method_name}") do
        model = object_name.to_s.camelize.constantize
        full_method_name = "#{model.quoted_table_name}.#{method_name}"
        find_options= {
          :conditions => ["LOWER(#{full_method_name}) LIKE ?", '%' + params['term'].downcase + '%'],
          :order => "#{full_method_name} ASC",
          :limit => 10
        }.merge!(options)

        @items = model.scoped(find_options)
        @items = yield(@items, params) if block_given?
        
        render :inline => "<%= auto_complete_result @items, '#{method_name}', '#{params['term']}' %>"
      end
    end
  end
end
