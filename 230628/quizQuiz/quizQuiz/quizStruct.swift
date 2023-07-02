//
//  quizStruct.swift
//  quizQuiz
//
//  Created by 김윤우 on 2023/06/21.
//

import Foundation

struct Quiz {
    
    let question: String //질문
    let correctArr: [String] // 정답배열
    let correctIndex: Int //정 답
    
    
    
    
} //12

let levelArr = [level1,level2, level3 ]
let level1: [Quiz] = [
    Quiz(question: "애플의 CEO는?", correctArr: [ "이재용", "팀쿡", "추현호", "최하늘" ], correctIndex: 1),
    
    Quiz(question: "스위프트 기본 데이터 타입이 아닌 것은?", correctArr: [ "Bool", "Character", "UInt", "Pointer" ], correctIndex: 1),
    Quiz(question: "축구 선수 이름이 아닌 것은?", correctArr: [ "메시", "호날두", "홀란", "옷하니" ], correctIndex: 1),
    Quiz(question: "바나나의 색깔은 무엇인가요?", correctArr: [" 빨강", "노랑", "파랑", "초록"], correctIndex: 1),
    Quiz(question: "물이 끓기 위해 필요한 온도는 얼마인가요?", correctArr: [" 0°C", "25°C", "100°C", "200°C"], correctIndex: 2),
    Quiz(question: "세계에서 가장 큰 동물은 무엇인가요?", correctArr: ["고래", "상어", "코끼리", "사자"], correctIndex: 0),
    Quiz(question: "1988년에 개봉한 디즈니 애니메이션 영화 인어공주 에서 주인공인 아리엘은 어디에서 살고 있나요?", correctArr: [" 더블로 산", "해저", "사막", "정글"], correctIndex: 1),
    Quiz(question: "세계에서 가장 많은 언어가 사용되는 나라는 어디인가요?", correctArr: [" 인도", "중국", "미국", "브라질"], correctIndex: 0),
    Quiz(question: "신체의 가장 큰 장기는 무엇일까요?", correctArr: [" 뇌", "심장", "폐", "간"], correctIndex: 1),
    Quiz(question: "앱스쿨 강사님의 성함이 아닌 것은?", correctArr: ["추현호 강사님", "박종욱 강사님", "유민영 강사님", "이승준 강사님"], correctIndex: 3),
    Quiz(question: "우리나라 최초의 배달 음식은?", correctArr: ["설렁탕", "짜장면", "짬뽕", "해장국"], correctIndex: 3 ),
    Quiz(question: "우리나라에서 최초로 발명한 것은?", correctArr: ["신호등", "전기밥솥", "MP3 플레이어", "스마트폰"], correctIndex: 2),
    
    
    
    
]
//8
let level2: [Quiz] = [
    Quiz(question: "다음 중 우주를 이루는 물질 중에서 가장 많은 것은?", correctArr: ["수소", "헬륨", "탄소", "아산화질소"], correctIndex: 0),
    Quiz(question: "2006년 월드컵 개최지였던 나라는?"
         , correctArr: ["한국", "카타르", "독일", "브라질"], correctIndex: 2),
    Quiz(question: "세계에서 가장 큰 대륙은 어디인가요?", correctArr: [" 아시아", "아프리카", "유럽", "남극"], correctIndex: 1),
    Quiz(question: "가나의 수도는?", correctArr: ["쿠마시","타말","로메","아크라"], correctIndex: 3),
    Quiz(question: "정부가 자동차에 대한 ‘이것’ 인하 조치를 이달 말 5년 만에 종료한다. 고가 사치품 등 특정 물품에 붙이는 이 세금은?", correctArr: ["양도세","주민세","개별소비세","글세"], correctIndex: 2),
    Quiz(question: "한국 최초 독자 개발 차량으로 1975년 12월 출시됐다. 현대자동차의 뿌리가 된 모델로 꼽히는 이 자동차는?", correctArr: ["티코","소나타","포니","K7"], correctIndex: 2),
    Quiz(question: "다음중 생일날 먹는 음식은? ", correctArr: ["마롱글라세","뚱카롱","미역국","미역냉국"], correctIndex: 0),
    Quiz(question: "다음 주가지수 중 미국 증시를 대표하는 지표를 고르면?", correctArr: ["코스피200","S&P500","FTSE100","유로스톡스50"], correctIndex: 1),
    Quiz(question: "현대차가 아닌것은?", correctArr: [ "제네시스", "K5", "그랜저", "소나타" ], correctIndex: 1),
    Quiz(question: "독일의 수도는?", correctArr: ["뭰헨","프랑크푸르트","베를린","잘츠부르크"], correctIndex: 2),
    Quiz(question: "중국의 수도는?", correctArr: ["상하이","타이베이","베이징","칭타오"], correctIndex: 2),
    Quiz(question: "스페인의 수도는?", correctArr: ["바르셀로나","마드리드","그라나다","리스본"], correctIndex: 1),
    
    
]

//6
let level3: [Quiz] = [
    Quiz(question: "6/21 김윤우가 점심에 먹은 메뉴는?", correctArr: ["라면", "해장국", "집밥", "굶음"], correctIndex: 2 ),
    Quiz(question: "명목 국내총생산(GDP)을 광의통화(M2)로 나누면 산출할 수 있는 값을 무엇이라 부를까요?", correctArr: ["통화유통속도", "통화승수", "지급준비율", "지니계수"], correctIndex: 0 ),
    Quiz(question: "챗GPT 개발사인 오픈AI의 최고경영자(CEO)로 최근 한국을 다녀가기도 한 이 사람은?", correctArr: ["샘 올트먼", "싱하이밍", "론 디샌티스", "팀 쿡"], correctIndex: 0 ),
    Quiz(question: "기업의 신제품이 기존 주력상품의 매출을 깎아먹는 현상을 가리키는 말은?", correctArr: ["젠트리피케이션", "카니발리제이션", "리디노미네이션", "글로컬리제이션"], correctIndex: 0 ),
    Quiz(question: "불가리아의 수도는?", correctArr: ["베오그라드","소피아","부큐레스티","바르나"], correctIndex: 1),
    Quiz(question: "베네수엘라의 수도는?", correctArr: ["보고타","로조우","카라카스","죠지타운"], correctIndex: 2),
    
    
    
]
//
//var quiz1: Quiz = Quiz(question: "애플의 CEO는?", correctArr: ["일론머스크", "이재용", "팀쿡", "추현호", "최하늘" ], correctIndex: 2)


