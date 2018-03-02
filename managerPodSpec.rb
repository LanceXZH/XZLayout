#ruby create podSpec , register and push.

$PODNAME = Hash.new
$PODADDRESS = Hash.new

if ARGV[0] && ARGV[1]
   PODNAME = ARGV[0]
   PODADDRESS = ARGV[1]
   puts(PODNAME)
   puts(`pod spec create #{PODNAME}`)
   
   if File.exist?("#{PODNAME}.podspec")
      File.write("#{PODNAME}.podspec" , "")
   end
   
   aFile = File.new("#{PODNAME}.podspec", "w+")
   if aFile
       aFile.syswrite("Pod::Spec.new do |s|\n")
       
       aFile.syswrite("  s.name         = \"#{PODNAME}\"\n")
       aFile.syswrite("  s.version      = \"0.0.1\"\n")
       aFile.syswrite("  s.summary      = \"#{PODNAME}\"\n")
       aFile.syswrite("  s.description  = <<-DESC\n\t\t\t\t\t#{PODNAME} description\n\t\t\t\t\tDESC\n")
       aFile.syswrite("  s.homepage     = \"#{PODADDRESS}\"\n")
       aFile.syswrite("  s.license      = \"MIT\"\n")
       aFile.syswrite("  s.license      = { :type => \"MIT\", :file => \"LICENSE\" }\n")
       aFile.syswrite("  s.author             = { \"xuzhong\" => \"xuzhong@meituan.com\" }\n")
       aFile.syswrite("  s.platform     = :ios, \"8.0\"\n")
       aFile.syswrite("  s.source       = { :git => \"#{PODADDRESS}.git\", :tag => s.version}\n")
       aFile.syswrite("  s.source_files  = \"Classes\", \"#{PODNAME}/Classes/**/*.{h,m}\"\n")
       aFile.syswrite("  s.exclude_files = \"Classes/Exclude\"\n")
       aFile.syswrite("  s.public_header_files = \"#{PODNAME}/Classes/**/*.h\"\n")
       aFile.syswrite("  s.requires_arc = true\n")
       
       aFile.syswrite("end")
       
   else
       puts "Unable to open #{PODNAME}.podspec!"
   end
   
   
else
    puts("请输入仓库名和地址，例如: ruby managerPodSpec.rb XZBaseModule https://github.com/LanceXZH/XZBaseModule.git")
end



puts(`pod lib lint`)

puts(`git push origin :refs/tags/0.0.1`)
puts(`git tag -d 0.0.1`)

puts(`git tag -m "first release #{PODNAME} with podspec" "0.0.1"`)
puts(`git push --tags`)

result = `pod trunk push #{PODNAME}.podspec --allow-warnings`
puts(result)

if result.include?('not able')
    #防止not able to update the 'master' repo
    puts(`sudo rm -fr ~/.cocoapods/repos/master`)
    puts(`pod setup`)
    puts(`pod trunk push #{PODNAME}.podspec --allow-warnings`)
end


if result.include?('NoMethodError')
    puts(`sudo gem update --system`)
    puts(`sudo gem install cocoapods`)
    puts(`sudo gem install cocoapods-trunk`)
    puts(`pod trunk push #{PODNAME}.podspec --allow-warnings`)
end

#安装最新版本
if result.include?('NoMethodError')
    puts(`pod setup`)
    puts(`gem install cocoapods`)
    puts(`pod trunk push #{PODNAME}.podspec --allow-warnings`)
end






