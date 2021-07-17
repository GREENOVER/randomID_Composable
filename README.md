# Composable Architecture Random Network ID&Title View App
### 컴포저블 아키텍처로 랜덤하게 서버 통신하여 ID와 TITLE을 무작위로 보여주는 앱
#### 비동기 통신 및 State, Action, Environment를 정의하고   
#### Reducer를 통해 리액트한 처리 과정을 익히는 기능 중심 프로젝트로 UI는 SwiftUI로 구성되었습니다.   
***
## **✍️ 키워드**
- SwiftUI
- Composable Architecture
- Combine
- CombineExt
- Alamofire
- JSON
## **🧑🏻‍💻 구현사항**
- 뷰가 나타나고 ID/TITLE이 3초마다 랜덤하게 바뀌도록 구현하였습니다.
- 수동 통신 버튼 클릭 시 3초를 기다리지 않고 즉시 ID/TITLE이 랜덤하게 바뀌도록 구현하였습니다.
- 수동 통시 버튼 클릭 시 랜덤 통신을 멈추도록 설정하였습니다.
- 자동 통신 버튼 클릭 시 3초마다 랜덤하게 통신을 하도록 구현하였습니다.
- Alamofire를 통해 서버 통신하여 JSON 디코딩 파싱을 해주도록 구현하였습니다.
- 네트워크 및 디코딩 시 failure에 대처하여 원인 로그 파악을 위해 NSError를 반환하는 에러 메서드를 구현하였습니다.
- 단방향 이벤트 처리를 위해 Composable Architecture를 사용해 State, Action, Environment를 설계하였습니다.
- 모든 처리는 Reducer에서 불려 처리되도록 구현하였습니다.
## 🌲 **UI 및 기능 동작**
1. 뷰 로드 시 3초마다 랜덤한 뷰 텍스트 변환     
![random](https://user-images.githubusercontent.com/72292617/126028361-aa661dab-9226-482d-a43f-14d3d1ee271f.gif)   
2. 수동 변경 버튼 클릭 시 수동으로 랜덤한 뷰 텍스트 변환   
![click](https://user-images.githubusercontent.com/72292617/126028363-430761cc-04bb-4d62-8c36-d8ea6eb996ba.gif)        
3. 자동 변경 버튼 클릭 시 자동으로 3초마다 랜덤한 뷰 텍스트 변환   
![click2](https://user-images.githubusercontent.com/72292617/126028379-152f7186-c8df-4980-8fd6-7365e08255a4.gif)       
## **코드 설명**
### 코드에 대한 자세한 설명은 아래 블로그에서 기술하였습니다📝
### [코드 설명보러 가기](https://green1229.tistory.com/156)
