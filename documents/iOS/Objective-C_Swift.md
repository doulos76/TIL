# Objective-C vs Swift

## main 함수

* Objective-C

	- C계열의 언어는 프로그램 실행될 때 가장 먼저 호출되는 Entry-point Function(진입점 함수)를 가지고 있음
	- 보통 __main__ 함수라고 부름
	- Objective-C main 함수는 UIApplicationMain 함수를 호출하여 run-loop를 실행하고 앱 실행에 필요한 필수요소를 구성하는 `UIApplication` 객체의 `delegate`를 지정.
	
```Objective-C
int main(int argc, char * argv[]) {
	@autoreleasepool {
		return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
	}
}
```

* Swift

```Swift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	// ...
}
```


- Swift는 __main함수가__ __없음__.
- Swift compiler가 전역 범위에 있는 코드를 자동으로 인식하고 실행
- `AppDelegate` class 구현 앞에 `@UIApplicationMain` 속성을 추가하여 Objective-C의 `UIApplicationMain` 함수 호출과 동일한 작업이 수행되도록 지정함.

