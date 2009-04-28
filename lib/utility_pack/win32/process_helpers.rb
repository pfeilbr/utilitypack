module UtilityPack
  module Win32
    module ProcessHelpers
      include UtilityPack::Win32
      
      def self.kill(*images)
        images.flatten.each do |image|
          CoreHelpers.s "taskkill /IM #{image} /F /T"
        end
      end      
 
    end
  end
end
