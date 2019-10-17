# Dependency Library

## 의존성 프로그래밍

### 종류

* CocoaPods
* Carthage
* Swift Package Manager


## CocoaPods

## Carthage

### Installation

1. Carthage 설치
	* 	Homebrew를 이용해서 Carthage 설치
	
	```
	$ brew update
	
	// brew 설치
	$ brew install carthage
	
	// 설치된 경우 update
	$ brew upgrade carthage
	
	```
2. Project만들기 : Xcode로 project 만들기
3. Carthage file 만들기

	```
	$ touch Cartfile
	
	$ open -a Xcode ./Cartfile
	```
	
4. Cartfile 작성

	```
	github "Alamofire/Alamofire"
	```
	
5. carthage update

	```
	$ carthage update
	```

6. project에 라이브러리 연결

	TARGETS > Build Phage > Linked Frameworks and Libraries
	추가함.

7. Project에 Run Script 추가 (Xcode 11에서는 괜찮음)
	
	TARGETS > Build Phage > `+` New Run Script Phase
	
	`“/usr/local/bin/carthage copy-frameworks` copy & paste
	
	Add input file
	
	`$(SRCROOT)/Carthage/Build/iOS/라이브러리명.framework`
	
[주요 링크](https://github.com/Carthage/Carthage#quick-start)
