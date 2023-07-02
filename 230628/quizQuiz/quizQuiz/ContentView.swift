//
//  ContentView.swift
//  quizQuiz
//
//  Created by 김윤우 on 2023/06/21.
//
/* 방법!
 1단계 ~ 5단계 문제 난이도 설정
 1단계를 풀어야 다음 단계로 넘어갈 수 있음
 타이머
 구조체
 백틱백틱백틱swift 코드백틱백틱백틱
 캬
 */


import SwiftUI

struct ContentView: View {
    // level 구조체 초기화
    
    
    @State var questionNumberText = "레벨을 눌러주세요" //문제번호,난이도
    @State var questionNumber = 0
    @State var question = "" // 문제출력
    @State var answerArr = ["","","",""] // 정답 보기를 넣어 줄 빈 배열
    @State var isButtonDisabled: Bool = true
    @State var questionLevel = -1
    
    
    var body: some View {
        VStack {
            HStack(spacing: 30){
                
                Button {
                    questionLevel = 0
                    questionNumberText = "레벨 1 선택"
                } label: {
                    Text("Level1")
                }
                Button {
                    questionLevel = 1
                    questionNumberText = "레벨 2 선택"
                } label: {
                    Text("Level2")
                }
                Button {
                    questionLevel = 2
                    questionNumberText = "레벨 3 선택"
                } label: {
                    Text("Level3")
                }
                
            }.padding(.top, 5)
            Spacer()
            Group{
                Text(" \(questionNumberText) ")
                ProgressView(value: 5, total: 15)
                Spacer()
            }
            Text("\(question)")
                .frame(minHeight: 100)
                .padding(.bottom, 30)
                .font(.title2)
            Group{
                HStack() {
                    VStack(alignment:.leading){
                        Button {
                            check(answerNum: 0)
                            
                        } label: {
                            Text("1. \(answerArr[0])")
                        }
                        

                        Button {
                            check(answerNum: 2)
                        } label: {
                            Text("3. \(answerArr[2])")
                        }
                    }
                                        VStack(alignment:.leading){
                        Button {
                            check(answerNum: 1)
                        } label: {
                            Text("2. \(answerArr[1])")
                        }
                        
                        Button {
                            check(answerNum: 3)
                        } label: {
                            Text("4. \(answerArr[3])")
                        }
                        
                    }
                    
                    
                    
                }.font(Font.system(size: 22))
            
            }.disabled(isButtonDisabled)
            .padding()
            Spacer()
            Button {
                
                start()
                
            } label: {
                Text("시작")
            }
            Spacer()
            
        }.font(.largeTitle)
            .padding()
        
        
    }
    //시작 버튼 누르면 문제 출력
    func start() {
        if questionLevel < 0 {
            questionNumberText = "레벨을 눌러주세요"
            return
        }
        if questionLevel != -1 {
            isButtonDisabled = false
        }
        questionNumberText = "level\(questionLevel + 1) - \(questionNumber + 1)"
        // Level 구조체. level1의 인덱스. 질문
        question = levelArr[questionLevel][questionNumber].question
        // 정답 보기
        answerArr = [levelArr[questionLevel][questionNumber].correctArr[0],
                     levelArr[questionLevel][questionNumber].correctArr[1],
                     levelArr[questionLevel][questionNumber].correctArr[2],
                     levelArr[questionLevel][questionNumber].correctArr[3],
                     
        ]
        
    }
    //문제 번호와 답 체크 기능 함수
    func check(answerNum: Int) {
        print("\(questionNumber), \(levelArr[questionLevel].count)")
        guard questionNumber < levelArr[questionLevel].count - 1
        else {
            print("\(questionNumber), \(levelArr[questionLevel].count)")
            isButtonDisabled.toggle()
            return
        }
            
        
        if answerNum == levelArr[questionLevel][questionNumber].correctIndex{
            
            print("정답입니다 \(questionNumber)번 ")
        } else {
            print("오답입니다 \(questionNumber)번 ")
        }
        questionNumber += 1
        start()
                     
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
