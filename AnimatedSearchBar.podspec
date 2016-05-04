Pod::Spec.new do |s|
s.name = 'AnimatedSearchBar'
s.version = '0.1'
s.license = 'MIT'
s.summary = 'a tiny Animated Search Bar'
s.homepage = 'https://github.com/luiyezheng/JLStickerTextView'

s.authors = { "luiyezheng" => "luiyezheng@foxmail.com" }
s.source = { :git => 'https://github.com/luiyezheng/JLStickerTextView.git', :tag => s.version }

s.ios.deployment_target = '8.0'

s.source_files = 'Source/*.swift'

s.requires_arc = false
end
