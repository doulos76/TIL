# Regular Expression

## 정규 표현식

- regular expression
- regexp
- regex
- 특정한 규칙을 가진 문자열의 집합을 표현하는 데 사용하는 형식 언어
- 문자열의 검색과 치환을 위해 지원하고 있음.

[참고: Wikipedia](https://ko.wikipedia.org/wiki/정규_표현식)

## 자주 쓰이는 표현

* 전자우편 주소 
	- `/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/ `

## Swift

### Swift 4 ([출처 링크](https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift))

```Swift
// Implementation
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}

// Usage
if "rdfsdsfsdfsd".isValidEmail() {

}
```	