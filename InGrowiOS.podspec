
Pod::Spec.new do |spec|

  spec.name         = "InGrowiOS"
  spec.version      = "1.0.0"
  spec.summary      = "A cocoapods library written in Swift to use ingrow dynamic event streaming platform."

  spec.description  = <<-DESC 
This cocoapods library helps you to use ingrow dynamic event streaming platform in iOS projects.
                   DESC

  spec.homepage     = "https://github.com/ingrowco/ios-sdk"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.author       = { "ingrow" => "https://ingrow.co" }

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.platform     = :ios
  spec.ios.deployment_target = "10.3"
  spec.swift_version = "5"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source       = { :git => "https://github.com/ingrowco/ios-sdk.git", :tag => "#{spec.version}" }

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source_files  = "InGrowiOS", "InGrowiOS/InGrowiOS/*.{h,m,swift}"
  spec.exclude_files = "InGrowiOS/InGrowiOS/*.plist"

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.dependency "Alamofire", "~> 5.2"

end
