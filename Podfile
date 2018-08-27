platform :ios, '9.0'
use_frameworks!
def main_sources
#define your pod resources
pod 'Alamofire'
pod 'SnapKit', '~> 4.0.0'
pod 'SwiftLint'
pod 'RxAlamofire'
pod 'RxNuke'
pod 'RxDataSources', '~> 3.0'
pod 'RxSwift',    '~> 4.0'
pod 'RxCocoa',    '~> 4.0'
end
def test_sources
#define your pod resources for unit test
pod 'RxBlocking', '~> 4.0'
pod 'RxTest',     '~> 4.0'
end
target 'MVVMTemplate' do
main_sources

  target 'MVVMTemplateTests' do
    inherit! :search_paths
    test_sources
  end

  target 'MVVMTemplateUITests' do
    inherit! :search_paths
    test_sources
  end

end
