//
//  SelectionBattleView.swift
//  iOS_057_Leegyeoungyeon
//
//  Created by yeon I on 2023/07/02.
//

import SwiftUI


struct SelectionBattleView: View {
    
    @State  var selectedGradeIndex = 0
    @State  var selectedClassIndex = 0
    @State  var selectedStudentIndex1 = 0
    @State  var selectedStudentIndex2 = 0
    @State  var showingResult = false
    @State  var resultMessage = ""
    
    let strengths = ["불": "풀", "물": "불", "풀": "물"]
    // 불 >풀
    // 물 >불
    // 풀 >물
    
    var body: some View {
        
        
        ZStack{
            Color("bgPink")
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20)  {
                Text("🔨battle of no humanity🔨")
                    .font(.custom("Aloha Chunky", size: 30))
                    .foregroundColor(Color.white)
                
                
                HStack {
                    Text("내 캐릭터")
                    Picker("학년 선택", selection: $selectedGradeIndex) {
                        ForEach(0..<school.grades.count, id: \.self) { index in
                            Text(school.grades[index].name).tag(index)
                        }
                    }
                    
                    Picker("반 선택", selection: $selectedClassIndex) {
                        ForEach(0..<school.grades[selectedGradeIndex].schoolClasses.count, id: \.self) { index in
                            Text(school.grades[selectedGradeIndex].schoolClasses[index].name).tag(index)
                        }
                    }
                    
                    Picker("캐릭터 선택", selection: $selectedStudentIndex1) {
                        ForEach(0..<school.grades[selectedGradeIndex].schoolClasses[selectedClassIndex].students.count, id: \.self) { index in
                            Text(school.grades[selectedGradeIndex].schoolClasses[selectedClassIndex].students[index].name).tag(index)
                        }
                    }
                    //
                }
                HStack {
                    Text("대전 상대")
                    // 캐릭터 2 선택
                    Picker("학년 선택", selection: $selectedGradeIndex) {
                        ForEach(0..<school.grades.count, id: \.self) { index in
                            Text(school.grades[index].name).tag(index)
                        }
                    }
                    Picker("반 선택", selection: $selectedClassIndex) {
                        ForEach(0..<school.grades[selectedGradeIndex].schoolClasses.count, id: \.self) { index in
                            Text(school.grades[selectedGradeIndex].schoolClasses[index].name).tag(index)
                        }
                    }
                    
                    Picker("캐릭터 선택", selection: $selectedStudentIndex2) {
                        ForEach(0..<school.grades[selectedGradeIndex].schoolClasses[selectedClassIndex].students.count, id: \.self) { index in
                            Text(school.grades[selectedGradeIndex].schoolClasses[selectedClassIndex].students[index].name).tag(index)
                        }
                    }
                    
                }
                
                
                Button("Battle Start!")
                {
                    let character1 = school.grades[selectedGradeIndex].schoolClasses[selectedClassIndex].students[selectedStudentIndex1]
                    let character2 = school.grades[selectedGradeIndex].schoolClasses[selectedClassIndex].students[selectedStudentIndex2]
                    
                    let result = battle(character1, character2)
                    resultMessage = result
                    showingResult = true
                }
                .alert(isPresented: $showingResult) {
                    Alert(title: Text("결과"), message: Text(self.resultMessage), dismissButton: .default(Text("확인")))
                }.padding()
                
            }
            
            
        }
        
    }
    
}

func battle(_ character1: Student, _ character2: Student) -> String {
    let strengths = ["불": "풀", "물": "불", "풀": "물"]
    if character1.type == "최강" {
        return "\(character1.name)가 승리했습니다!"
    }
    if character2.type == "최강" {
        return "\(character2.name)가 승리했습니다!"
    }
    
    if character1.type == character2.type {
        return "비겼습니다!"
    }
    
    if let strength1 = strengths[character1.type], strength1 == character2.type {
        return "\(character1.name)가 승리했습니다!"
    }
    
    return "\(character2.name)가 승리했습니다!"
}



struct SelectionBattleView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionBattleView()
    }
}

