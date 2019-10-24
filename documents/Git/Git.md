# Git

* Version Control System
	- Version Management, not by changing the file name
	- Backup Recoverty Collaboration

* Version Control Systems
 - CVS
 - SVN
 - GIT

* VCS
	- Essential Point : 변경 사항 관리
	- Key Point : Git과 SVN의 차이점

* Git is incredibly __complex__.

You can get a sense by using __Dropbox, Google Drive.__

We need just something __good enough__.

## Git Install

* Git install page: [https://git-scm.com](https://git-scm.com)

## Git Commands

git init

git add `fileName.fielExtension`

git status

git commit

git reset 1aa3ce993ccb66f8f11e4296987e0cc1a2431189 --hard

git commit -am "commit message"

- version 만들기(의미있는 변화)
- 작업이 완결된 상태

git config --global user.name

git config --global user.email

git log

git log에서 빠져나올때 `q`

git log -p

git diff `commit message`...`commit message`

reset VS revert



* stage
* repository

## Git Storage Data Flow

![Git Storage Data Flow](images/Git_StorageDataFlow.png)


## fork repository 최신 버전으로 유지하기

1. fork, clone 후 확인
	* 명령어

	```
	$ git remote -v
	```

	* 결과

	```
	origin https://github.com/user/ooo.git (fetch)
	origin https://github.com/user/ooo.git (push)
	```

2. upstream 이란 이름으로 원본 소스코드의 위치를 추가시킴

	* 명령어

	```
	$ git remote add upstream https://github.com/ooo/ooo.git
	```

3. 제대로 추가되었는지 확인

	* 명령어

	```
	$ git remote -v
	```

	* 결과
	
	```
	origin https://github.com/user/ooo.git (fetch)
	origin https://github.com/user/ooo.git (push)
	upstream		https://github.com/ooo/ooo.git (fetch)
	upstream		https://github.com/ooo/ooo.git (push)
	```
