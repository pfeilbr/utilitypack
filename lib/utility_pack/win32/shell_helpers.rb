module UtilityPack
  module Win32
    module ShellHelpers
      include UtilityPack::Win32::CoreHelpers
      
      def cmd_then_exit(cmd, *options)
        options << "/c"
        s "cmd #{options.join(' ')} #{cmd}"
      end  

      def cmd_then_remain(cmd, *options)
        options << "/k"
        s "cmd #{options.join(' ')} #{cmd}"
      end  

      def start_async(cmd, *options)
        s "cmd /c start \"\" #{options.join(' ')} #{cmd}"
      end  

      def start_and_wait(cmd, *options)
        options << "/wait"
        start_async(cmd, options)
      end    

      def cmd_prompt_here(*options)
        directory_path = ENV['dir']  || ''
        cmd_then_remain "(cd /d #{directory_path} & cls)", options  
      end
 
    end
  end
end
