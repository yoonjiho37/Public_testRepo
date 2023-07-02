//
//  ContentView.swift
//  QuizQuizSwiftUI
//
//  Created by 최하늘 on 2023/06/21.
//

import SwiftUI

enum Level: Int, CaseIterable {
    case level1 = 0
    case level2 = 1
    case level3 = 2
}

struct ContentView: View {
    
    @State var questionNumText: String = "문제"
    @State var questionText: String = "시작을 눌러주세요~!"
    
    @State var questionNum: Int = 0  //문제번호
    @State var questionRate: Double = 0 //문제진행률
    @State var questionLevel: Int = -1
    @State var answerArr: [String] = [String](repeating: "보기", count: 4)
    
    @State var isButtonDisabled: Bool = true
    @State var isLevelButton: Bool = false
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                ForEach(Level.allCases, id: \.self) { level in
                    Button {
                        questionLevel = level.rawValue
                        questionNumText = "레벨 \(level.rawValue+1) 선택"
                        questionText = "시작을 눌러주세요"
                        isLevelButton = true
                    } label: {
                        Text(String(describing: level))
                            .font(.system(size: 14, weight: .semibold))
                            .frame(maxWidth: .infinity, maxHeight: 40)
                    }
                    .foregroundColor(.white)
                    .background(.mint)
                    .cornerRadius(10)
                }
            }
            .padding()
            
            //문제번호
            Text(questionNumText)
                .bold()
                .padding(.bottom)
            
            //진행률
            ProgressView(value: questionRate)
                .tint(.mint)
                .frame(maxWidth: .infinity)
                .padding([.leading, .trailing])
            
            //질문
            VStack {
                Text(questionText)
                    .font(.system(size: 22, weight: .heavy))
                    .multilineTextAlignment(.center)
                    .foregroundColor(isLevelButton ? .red : .white)
                    .padding()
            }
            .frame(maxWidth: .infinity, minHeight: 220)
            .background(.mint)
            .cornerRadius(10)
            .padding()
            .shadow(radius: 5)
            
            //정답버튼
            VStack(spacing: 15) {
                ForEach(0..<4) { i in
                    Button {
                        checkAnswer(answerNum: i)
                    } label: {
                        Text("\(answerArr[i])")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(isButtonDisabled ? .gray : .mint)
                            .frame(maxWidth: .infinity, minHeight: 50)
                    }
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .border(isButtonDisabled ? .gray : .mint, width: 1)
                    .cornerRadius(10)
                    .disabled(isButtonDisabled)
                }
            }
            .padding([.leading, .trailing, .bottom])
            
            Spacer()
            
            Button {
                isLevelButton = true
                if questionLevel != -1 {
                    isLevelButton = false
                }
                
                questionNum = 0
                questionRate = 0
                reset()
                
            } label: {
                Text("시작")
            }
            
            Spacer()
            
        }
    }
    
    //시작 버튼 누르면 문제 출력
    func reset() {
        if questionLevel < 0 {
            questionText = "레벨을 눌러주세요"
            return
        }
        if questionLevel != -1 {
            isButtonDisabled = false
        }
        
        questionNumText = "level \(questionLevel + 1) - \(questionNum + 1)번 문제"
        
        // 질문
        questionText = levelArr[questionLevel][questionNum].question
        // 정답버튼
        answerArr = [levelArr[questionLevel][questionNum].answerArr[0],
                     levelArr[questionLevel][questionNum].answerArr[1],
                     levelArr[questionLevel][questionNum].answerArr[2],
                     levelArr[questionLevel][questionNum].answerArr[3]
        ]
    }
    
    //문제 번호와 답 체크 기능 함수
    func checkAnswer(answerNum: Int) {
        guard questionNum < levelArr[questionLevel].count - 1 else {
            isButtonDisabled.toggle()
            questionRate = 1
            
            questionText = "끝"
            isLevelButton = true
            return
        }
        
        if answerNum == levelArr[questionLevel][questionNum].correctIndex {
            print("정답입니다")
        } else {
            print("오답입니다")
        }
        
        questionNum += 1
        questionRate = Double(questionNum) / Double(levelArr[questionLevel].count)
        reset()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
