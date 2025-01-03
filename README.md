# 긁적글적 Todo

* 상태관리(GetX, Riverpod 등) 배우고 추가 작업 들어갈 예정

## 프로젝트 소개

- 긁적글적 Todo는 간단한 일정 관리 앱입니다.
- todo mate 앱을 참고하여 만들었습니다.

## 화면 구조

화면은 크게 피드, 둘러보기, 알림, My 화면으로 구성되어 있습니다.

- 피드 : 일정 관리 화면
- 둘러보기 : 사용자 검색 및 다른 사용자 피드 둘러보기
- 알림 : 알림 화면
- My : 내정보 화면

## 피드 화면 (2024-12-18: 카테고리 생성 기능 추가)

- 피드 화면은 크게 헤더, 캘린더, 피드 리스트로 구성되어 있습니다.
- 헤더는 현재 날짜와 캘린더 버튼, 피드 작성 버튼으로 구성되어 있습니다.
- 캘린더는 월별 캘린더로 구성되어 있습니다.
- 피드 리스트는 오늘 할 일을 체크하고 완료 여부를 표시하는 피드 리스트로 구성되어 있습니다.
- 일기 화면은 일기 작성 화면과 이모지를 선택하는 화면으로 구성되어 있습니다.
- 일기는 전체공개, 팔로워 공개, 일부 공개, 나만보기로 구성되어 있습니다.
- 오늘의 기분을 나타내는 이모지를 선택할 수 있습니다.
- 카테고리를 길게 누르면 카테고리 설정 화면으로 이동합니다.
- + 버튼을 누르면 카테고리 생성 화면으로 이동합니다.

## 둘러보기 화면 (2024-12-10: More 버튼 기능 추가)

- 둘러보기 화면은 크게 헤더, 검색 그리드, 피드 리스트로 구성되어 있습니다.
- 검색 그리드는 사용자 검색 결과를 표시하는 그리드로 구성되어 있습니다.
- 피드 리스트는 사용자의 피드를 표시하는 리스트로 구성되어 있습니다.
- 피드 리스트는 다른 사용자의 일기 또는 일정 목록을 표시하는 리스트로 구성되어 있습니다.
- More 버튼은 다른 사용자를 신고할 수 있는 기능을 가지고 있습니다.
- ! 버튼을 누르면 둘러보기 검색에 관한 정보를 표시하는 다이얼로그를 띄웁니다.

## 알림 화면 (2024-12-14: 알림 화면 추가)

- 알림 화면은 '친구의 할 일', '친구의 일기', '받은 좋아요', '소식' 탭으로 구성되어 있습니다.
- 친구의 할 일은 친구들의 할 일을 표시하는 리스트로 구성되어 있습니다.
- 친구의 일기는 친구들의 일기를 표시하는 리스트로 구성되어 있습니다.(미구현)
- 받은 좋아요는 다른 사용자가 내 피드에 좋아요를 눌렀을 때 표시되는 리스트로 구성되어 있습니다.(미구현)
- 소식은 앱의 공지사항 등을 표시하는 리스트로 구성되어 있습니다.

## My(내정보) 화면 (2024-12-21: 설정 화면 추가)

- 내정보 화면은 나의 기록, 프리미엄, 스티커샵, 노트, 보관함, 설정 기능을 사용할 수 있도록 구성되어 있습니다.
- 내정보 하단에 명언을 표시하는 위젯을 추가하였으며, 해당 위젯은 'https://github.com/gwongibeom/korean-advice-open-api' 에서 제공하는 오픈API를 사용하였습니다.
- 설정 화면을 추가하였습니다.

## 공통 화면

- 내 피드 또는 다른 사용자의 피드 화면을 공통으로 사용하도록 변경하였습니다.
    - 영양 받은 위젯: Calendar, Todo, Profile
- 공통 Dialog 위젯을 추가하였습니다.
