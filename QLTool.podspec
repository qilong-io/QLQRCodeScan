Pod::Spec.new do |s|
  s.name         = "QLTool"
  s.version      = "0.1.2"
  s.summary      = "A short description of QLQRCodeScan."
  s.description  = <<-DESC
	    个人工具类
                   DESC
  s.homepage     = "https://github.com/mark1225/QLQRCodeScan"
  s.license 	 = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "qilong" => "915464855@qq.com" }
  s.platform	 = :ios
  s.platform 	 = :ios,"9.0"
  s.source       = { :git => "https://github.com/mark1225/QLQRCodeScan.git", :tag => "#{s.version}" }
  s.source_files  = "QLQRCode/QLQRCode/QLTool/*.h"
  # s.source_files  = "QLQRCode/QLQRCode/QLTool/*.{h,m}","QLQRCode/QLQRCode/QLTool/Category/*.{h,m}","QLQRCode/QLQRCode/QLTool/Tool/*.{h,m}"
  
  s.subspec 'Category' do |sa|
    sa.source_files = 'QLQRCode/QLQRCode/QLTool/Category/**/*.{h,m}'
    sa.dependency 'QLTool/Tool'
  end

  s.subspec 'Tool' do |sc|
    sc.source_files = 'QLQRCode/QLQRCode/QLTool/Tool/**/*.{h,m}'
  end

  s.dependency "SDWebImage"
  # s.requires_arc = true
end
