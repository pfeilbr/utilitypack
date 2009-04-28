module UtilityPack
  module CoreExtensions
    module String
     
      # returns a new string instance populated with the provided variable values.
      # template variables are of the form :<variable name>. e.g. :name
      def fill(values = {})
        s = self.clone
        values.each do |key, value|
          s.gsub!(":#{key}", value.to_s) if value.respond_to? :to_s
        end
        s  
      end
      
    end
  end
end

class String #:nodoc:
  include UtilityPack::CoreExtensions::String
end