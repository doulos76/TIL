# Git Tag

## Tag 조회

### 전체 tag 조회
```
$ git tag
v1.0.0
v1.0.1
v1.1.0
```

### 원하는 tag명을 조건으로 검색

```
git tag -l v1.1.*
v1.1.0
```

## Tag 붙이기

### Lightweight

* 특정 commit을 가르키는 역할


```
$ git tag v1.0.2
$ git tag
v1.0.2
```

### Annotated

* 태그를 만든 사람, 이메일,날짜 메시지를 저장함. 

```
$ git tag -a v1.0.3 -m"Release version 1.0.3"
```

* Tag 메시지와 커밋을 확인할 수 있음.

```
$ git show v1.0.3
```