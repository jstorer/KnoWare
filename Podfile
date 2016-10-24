# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'KnoWare' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for KnoWare
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'MGSwipeTableCell'
  pod 'GoogleMaps'
  pod 'UIColor_Hex_Swift'
  pod 'SwiftyButton'
  pod 'SCLAlertView'
  pod 'SnapKit'
  pod 'ChameleonFramework'
  pod 'Eureka', '~> 2.0.0-beta.1'
  pod ‘iOS-Color-Picker’
  pod ‘Kingfisher’
  
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES'] = 'NO'
        end
    end
end
