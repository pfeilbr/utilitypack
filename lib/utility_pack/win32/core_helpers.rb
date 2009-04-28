module UtilityPack
  module Win32
    module CoreHelpers
      
      def self.s(*argv)
        system(*argv)
      end      
      
    end
  end
end
