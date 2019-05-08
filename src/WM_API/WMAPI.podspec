Pod::Spec.new do |s|
    s.source_files = '*.swift'
    s.name = 'WMAPI'
    s.authors = 'Yonas Kolb'
    s.summary = 'This spec is constructed based on OpenWeatherMap API data structure.'
    s.version = '1.0.0'
    s.homepage = 'https://github.com/yonaskolb/SwagGen'
    s.source = { :git => 'git@github.com:https://github.com/yonaskolb/SwagGen.git' }
    s.ios.deployment_target = '9.0'
    s.tvos.deployment_target = '9.0'
    s.osx.deployment_target = '10.9'
    s.source_files = 'Sources/**/*.swift'
    s.dependency 'Alamofire', '~> 4.8.2'
end
