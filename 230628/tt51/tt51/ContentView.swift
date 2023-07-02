
import SwiftUI

// GameView를 ContentView로 감싸는 SwiftUI 앱의 진입점 역할을 하는 ContentView 구조체를 정의합니다.
struct ContentView: View {
    var body: some View {
        GameView() // GameView를 화면에 표시합니다.
    }
}

// ContentView를 프리뷰로 확인하기 위한 코드입니다.

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// 사칙연산 기호를 나타내는 열거형 Operator를 정의합니다.
enum Operator: String, CaseIterable {
    case addition = "+"
    case subtraction = "-"
    case multiplication = "x"
    case division = "/"
    
    // 주어진 두 개의 피연산자와 해당 연산자를 사용하여 연산을 수행하고 결과를 반환하는 함수입니다.
    func calculate(_ operand1: Int, _ operand2: Int) -> Double {
        switch self {
        case .addition:
            return Double(operand1 + operand2)
        case .subtraction:
            return Double(operand1 - operand2)
        case .multiplication:
            return Double(operand1 * operand2)
        case .division:
            return Double(operand1) / Double(operand2)
        }
    }
}

// 문제에 대한 정보를 담는 구조체 Question
struct Question {
    let operand1: Int
    let operand2: Int
    let oper: Operator
    let answer: Double
}

// 게임 화면을 담당하는 SwiftUI의 View 구조체인 GameView를 정의
struct GameView: View {
    // 현재 문제의 인덱스
    @State private var currentQuestionIndex = 0
    // 맞춘 횟수를
    @State private var correctCount = 0
    // 틀린 횟수를
    @State private var wrongCount = 0
    // 문제들을 저장하는 배열
    @State private var questions: [Question] = []
    
    // 게임에서 제시되는 최대 문제 수를 정의
    let maxQuestions = 10
    
    // 초기화 메서드에서 문제생성
    init() {
        generateQuestions()
    }
    
    // 문제들을 생성하는 함수
    func generateQuestions() {
        questions.removeAll()
        for _ in 0..<maxQuestions {
            
            let operand1 = Int.random(in: 1...10)
            let operand2 = Int.random(in: 1...10)
            let oper = Operator.allCases.randomElement()!
            let answer = oper.calculate(operand1, operand2)
            let question = Question(operand1: operand1, operand2: operand2, operator: `operator`, answer: answer)
            questions.append(question)
        }
    }
    
    // 답이 맞는지 확인하는 함수
    func checkAnswer(_ isCorrect: Bool) {
        if isCorrect {
            correctCount += 1
            print("오호!")
        } else {
            wrongCount += 1
            print("땡!")
        }
    }
    
    // 게임 상태를 초기화하고 새로운 문제들을 생성하는 함수입니다.
    func resetStats() {
        currentQuestionIndex = 0
        correctCount = 0
        wrongCount = 0
        generateQuestions()
    }
    
    var body: some View {
        VStack {
            // 게임 제목을 표시하는 텍스트입니다.
            Text("사칙연산 결과 OX 맞추기 게임")
                .font(.title)
                .padding()
            
            if currentQuestionIndex < maxQuestions {
                let question = questions[currentQuestionIndex]
                
                // 현재 문제를 표시하는 텍스트입니다.
                Text("문제: \(question.operand1) \(question.operator.rawValue) \(question.operand2) = ?")
                    .font(.headline)
                    .padding()
                
                HStack {
                    // O 버튼입니다. 눌리면 사용자가 선택한 답이 맞는지 확인합니다.
                    Button(action: {
                        let isCorrect = question.answer == 1
                        checkAnswer(isCorrect)
                        currentQuestionIndex += 1
                    }) {
                        Text("O")
                            .font(.title)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    //사용자가 선택한 답이 맞는지 확인합니다.
                    Button(action: {
                        let isCorrect = question.answer == 0
                        checkAnswer(isCorrect)
                        currentQuestionIndex += 1
                    }) {
                        Text("X")
                            .font(.title)
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            } else {
                VStack {
                    // 게임 종료 메시지를 표시
                    Text("게임 종료")
                        .font(.title)
                        .padding()
                    
                    // 맞춘 횟수와 틀린 횟수를 표시하는 텍스트입니다.
                    Text("맞춤: \(correctCount),틀림: \(wrongCount)")
                        .font(.headline)
                        .padding()
                }
            }
        }
    }
}
