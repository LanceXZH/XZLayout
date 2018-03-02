#ruby create podSpec , register and push.

$PODNAME = Hash.new

if ARGV[0]
   PODNAME = ARGV[0]
   puts(PODNAME)
   `pod spec create #{PODNAME}`
   
   if File.exist?("#{PODNAME}.podspec")
      File.write("#{PODNAME}.podspec" , "")
   end
   
   aFile = File.new("#{PODNAME}.podspec", "r+")
   if aFile
       aFile.syswrite("Pod::Spec.new do |s|\n")
       
       aFile.syswrite("  s.name         = #{PODNAME}\n")
       aFile.syswrite("  s.version      = '0.0.1'\n")
       aFile.syswrite("  s.summary      = #{PODNAME}\n")
       aFile.syswrite("  s.description  = <<-DESC\n\t\t\t\t\t#{PODNAME}\n\t\t\t\t\tDESC\n")
       aFile.syswrite("  s.homepage     = 'https://github.com/LanceXZH/XZBaseModule'\n")
       aFile.syswrite("  s.license      = 'MIT'\n")
       aFile.syswrite("  s.license      = { :type => 'MIT', :file => 'LICENSE' }\n")
       
       aFile.syswrite("end")
   else
       puts "Unable to open #{PODNAME}.podspec!"
   end


else
   puts("请输入仓库名: ruby **.rb podName")
end




