//
//  SchoolClassView.swift
//  iOS_057_Leegyeoungyeon
//
//  Created by yeon I on 2023/07/02.
//

import SwiftUI

struct SchoolClassView: View {
    var schoolClass: SchoolClass
    
    var body: some View {
        NavigationStack{
            List {
                if schoolClass.students.count > 0 {
                    ForEach(schoolClass.students) { student in
                        HStack {
                            AsyncImage(url: student.imageURL) { image in image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                            NavigationLink {
                                StudentView(student: student)
                            } label: {
                                Text("\(student.name)")
                                    .font(.title)
                                    .padding()
                            }
                        }
                    }
                }  else {
                    Text("아직 학생이 없습니다.")
                }
            }
            .navigationTitle("\(schoolClass.name)")
        }
        
    }
    
}
struct SchoolClassView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            
            SchoolClassView(schoolClass: SchoolClass(name: "1반", students: [
                Student(name: "밥탱이", type: "불", imageURLString: "https://i.pinimg.com/736x/45/a1/db/45a1dbd0b5ab49d800e2eeac8b26ff2b.jpg"),
                Student(name: "키메라", type: "풀", imageURLString: "https://pbs.twimg.com/media/FQ94DenacAAcEO7.png"),
                Student(name: "재미쩨리", type: "불", imageURLString: "https://i1.sndcdn.com/avatars-Z88gS1I3rosQhzAI-r21i4w-t500x500.jpg")
            ]))
        }
    }
    
}
