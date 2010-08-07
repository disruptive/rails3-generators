require 'generators/haml'
require 'rails/generators/erb/controller/controller_generator'

module Haml
  module Generators
    class ControllerGenerator < Erb::Generators::ControllerGenerator
      extend TemplatePath
      
      argument :actions, :type => :array, :default => [], :banner => "action action"

      def copy_view_files
        base_path = File.join("app/views", class_path, file_name)
        empty_directory base_path

        actions.each do |action|
          @action = action
          @path = File.join(base_path, "#{action}.haml")
          template "view.haml.erb", @path
        end
      end

    end
  end
end
