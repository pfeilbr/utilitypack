module UtilityPack
  module DateTimeHelpers

    class HourMinSec < Time
      
      def <=>(other)
        # only compare based on hour, minutes, and seconds (leave date portion off)
        self_seconds = (self.hour * (60 * 60)) + (self.min * 60) + self.sec
        other_seconds = (other.hour * (60 * 60)) + (other.min * 60) + other.sec

        if self_seconds < other_seconds
          return -1
        elsif self_seconds == other_seconds
            return 0
        else
          return 1
        end
      end
    
    end
  
    def self.timestamp_for_filename
      Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    end
    
  end
end
