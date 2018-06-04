Pod::Spec.new do |s|
  s.name         = "QLQRCodeScan"
  s.version      = "0.0.5"
  s.summary      = "A short description of QLQRCodeScan."
  s.description  = <<-DESC
	iOS 二维码扫描
	v0.0.3 图片整理
                   DESC
  s.homepage     = "https://github.com/mark1225/QLQRCodeScan"
  s.license 	 = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "qilong" => "915464855@qq.com" }
  s.platform	 = :ios
  s.platform 	 = :ios,"9.0"
  s.source       = { :git => "https://github.com/mark1225/QLQRCodeScan.git", :tag => "#{s.version}" }
  # s.source_files  = "QLQRCodeScan/QLQRCode/*.{h,m}"
  # s.source_files  = "QLQRCodeScan/QLQRCode/QLQRCode/*.{h,m}"
  s.source_files  = "QLQRCode/QLQRCode/QLQRCode/*.{h,m}","QLQRCode/QLQRCode/QLQRCode/QRCodeReaderView/*.{h,m}"
  s.resources 	  = "QLQRCode/QLQRCode/QLQRCode/Resource.bundle"
  # s.requires_arc = true
end
