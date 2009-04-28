module UtilityPack
  module CoreExtensions
    module Array
      
      # returns a random element from the array
      # if count is specified, a array of unique random elements is returned
      def random(count = 1)
        
        raise "Invalid argument (count must be >1)" if count < 1
        
        if count == 1
          self[rand(self.size)]
        else
          raise "Invalid argument.  The size of the array is #{self.size} and \
            you are requesting #{count} random elements" if count > self.size
          
          r = []
          while r.size != count
            tmp = self[rand(self.size)]
            r << tmp unless r.include?(tmp)
          end
          
          if count == 1
            r = r[0]
          end
          r
        end
      end
      
    end
  end
end

class Array #:nodoc:
  include UtilityPack::CoreExtensions::Array
end