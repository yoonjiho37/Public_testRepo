//
//  StudentView.swift
//  iOS_057_Leegyeoungyeon
//
//  Created by yeon I on 2023/07/02.
//

import SwiftUI

struct StudentView: View {
    var student : Student
    var body: some View {
        List {
            AsyncImage(url: student.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
            } placeholder: {
                ProgressView()
            }
            Text("\(student.name)")
            Text("\(student.type) 속성")
            
        }
        .navigationTitle("\(student.name)")
    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StudentView (student: Student(name: "밥탱이", type: "불", imageURLString: "https://i.pinimg.com/736x/45/a1/db/45a1dbd0b5ab49d800e2eeac8b26ff2b.jpg"))
        }
        
        
    }
}
