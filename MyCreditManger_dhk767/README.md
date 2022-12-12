#  tastycode_SeSAC 2차 선발 과제(MyCreditManager) 

## 과제 목표

* console에서 활용할 수 있는 학생성적 관리 프로그램 제작
* 학생 성적, 데이터 저장 영속성 추가

<br>

## 📣 접근 과정

* CRUD 기능의 경우, Array를 활용하여 저장한다.
* StudentData라는 클래스를 만들어 '학생 - 과목 - 성적'간 데이터 쌍을 만들어서 관리한다.
* 데이터 입력에 오류가 있는 경우를 대비하여 예외처리를 확실히 한다.
* FileManger를 활용하여 데이터의 영속성을 확보한다.(CoreData, SQLite로 저장 시도하였으나 실패)

<br>


## 📣 프로젝트 구조

### MyCreditManager

├─- CalculateScore.swift <br>
├── DataModel.xcdatamodeld <br>
│   └── DataModel.xcdatamodel <br>
│       └── contents <br>
├── InputErrorCheck.swift<br>
├── README.md<br>
├── SearchTool.swift<br>
├── StudentData.swift<br>
└── main.swift<br>

<br>


## 📣 파일 설명

### main.swift

** 메인 코드가 들어있는 파일 **

* 학생 추가, 삭제, 성적 추가, 삭제, 평점보기와 관련된 function이 위치함.
* while문으로 기본 프로그램이 종료되기 전까지 작동되게 했고 Switch문으로 분기하여 각각의 메서드를 호출할 수 있게 했음.
* 중복되는 기능들을 아래의 swift 파일로 분리시켰음. 
* ++ 학생삭제 시, 그 학생이 가지고 있던 성적도 함께 삭제하는 기능을 추가함. 

<br>

### InputErrorCheck.swift

** 콘솔 입력 시 제한하여야 하는 입력을 거르는 class **

* 공백, 특수입력 등을 제한하기 위해 필터링하는 class를 따로 둠.
* 평점보기에서 A+, A 등으로 입력되지 않으면 오류를 일으킬 수 있기에 필터링하는 메서드를 따로 두었음(inputDataArray()).
* inputName(), inputDataArray()가 주요 메서드이며, 나머지 메서드는 필터링 하는 것에 도움을 주는 메서드임.

<br>

### SearchTool.swift

** datum Array에서 학생의 인덱스를 찾아주는 메서드가 존재하는 SearchTool class **

* 학생삭제, 성적추가, 삭제 등을 할 때, datum 안에서의 인덱스를 반환함
* 반환된 인덱스는 값을 바꾸는 것에 활용됨.

<br>

### CalculateScore.swift

** 평점보기 탭에서 활용되는 계산 클래스 **

* StudentData 객체 내의 Score가 A+, A 등의 String으로 되어 있기 때문에, 이 값을 토대로 숫자로 바꾸어 계산하는 메서드를 두었음.

<br>

### StudentData.swift 

** 하나의 객체로 만들어 datum 내에 담기 위한 클래스 ** 

* "학생 - 학생의 과목과 성적" 간의 관계가 있기 때문에 하나의 데이터로 만들어 저장하기 위한 데이터 타입을 새로 만들었음.
 
<br>

## 📣 개발환경

* Swift 5.5
* Xcode 14
* GitHub

<br>

### 📣 Commit Message Convention

* feat : 새로운 기능 추가
* docs : 문서 수정
* refactor : 코드 리팩토링, 코드 포맷팅
* test : 테스트 코드, 리팩토링 테스트 코드 추가
* chore : 자잘한 수정, 빌드 수정, 패키지 매니저 수정


<br>

## 📣 개발 중 아쉬운점

* 성적관리 프로그램이라는 특성 상, 추후 과목 평균 등을 내야하는 상황이 예측되는데, 현재 데이터 저장 구조는 '이름'에 모든 것이 묶여 있기 때문에 검색 속도가 떨어질 수도 있을 것 같다.
* 데이터를 영속적으로 저장하는 것을 시도하였지만, CoreData, SQLite 등의 데이터베이스를 활용하지 못했고, FileManager도 사용하지 못했다.
* 데이터 위치를 파악하는 검색이 순차검색이라 데이터가 방대해지면 검색 시간이 느려질 수 있는데, 이 부분 개선이 아쉽다.
* TDD를 도입하고 싶었으나, 아직 Xcode가 익숙하지 않아 도입하지 못한 것이 아쉽다. 만약 시간이 더 주어진다면 단위 테스트를 도입해보고 싶다. 
