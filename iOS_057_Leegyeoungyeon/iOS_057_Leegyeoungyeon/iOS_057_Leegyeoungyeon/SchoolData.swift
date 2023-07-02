//
//  CharacterData.swift
//  iOS_057_Leegyeoungyeon
//
//  Created by yeon I on 2023/07/02.
//

import Foundation

protocol ImageURL {
    var imageURLString : String { get set }
    var imageURL: URL { get }
}

struct School : ImageURL {
    var name : String
    var imageURLString: String
    var imageURL: URL {
        get {
            return URL(string: imageURLString)!
        }
    }
    var grades: [Grade]
    
}

struct Grade : Identifiable {
    var id: UUID = UUID()
    var name : String
    var schoolClasses : [SchoolClass]
}

struct SchoolClass : Identifiable {
    var id: UUID = UUID()
    var name : String
    var students: [Student]
}

struct Student : Identifiable , ImageURL {
    var id: UUID = UUID()
    var name: String
    var type: String
    var imageURLString: String
    var imageURL: URL {
        get {
            return URL(string: imageURLString)!
        }
    }
}
/*
 let grade1: Grade = Grade(name: "1학년")
 let grade2: Grade = Grade(name: "2학년")
 let grade3: Grade = Grade(name: "3학년")
 
 let school: School = School(name: "멋사중학교", grades: [grade1, grade2, grade3])
 */

let school : School = School (name: "냥냥유치원 (야간)",
                              imageURLString:
                                "https://dispatch.cdnser.be/wp-content/uploads/2018/06/20180601162504_9.jpg", grades: [
                                    Grade(name: "1학년", schoolClasses: [
                                        SchoolClass(name: "1반", students: [
                                            Student(name: "밥탱이", type: "불", imageURLString: "https://i.pinimg.com/736x/45/a1/db/45a1dbd0b5ab49d800e2eeac8b26ff2b.jpg"),
                                            Student(name: "키메라", type: "풀", imageURLString: "https://pbs.twimg.com/media/FQ94DenacAAcEO7.png"),
                                            Student(name: "재미쩨리", type: "불", imageURLString: "https://i1.sndcdn.com/avatars-Z88gS1I3rosQhzAI-r21i4w-t500x500.jpg")
                                            
                                            
                                        ]),
                                        SchoolClass(name: "2반", students: [
                                            Student(name: "애기", type: "물", imageURLString: "https://pbs.twimg.com/media/FW00852aQAAO5jB.png"),
                                            Student(name: "푸딩냥", type: "불", imageURLString: "https://i.pinimg.com/736x/12/34/b8/1234b8b9a54145a5526c33f0c8ca7f74.jpg"),
                                            Student(name: "오뎅냥", type: "풀", imageURLString: "https://i.pinimg.com/originals/aa/c0/9d/aac09d829cc6c127e9c69adebd1053a5.png")
                                        ]),
                                        SchoolClass(name: "3반", students: [
                                            Student(name: "박사", type: "최강", imageURLString: "https://i.pinimg.com/originals/5a/23/4f/5a234fe2db30f549a8d224902e8ea227.jpg"),
                                            Student(name: "백신냥", type: "물", imageURLString: "https://pbs.twimg.com/media/FQd-WvaagA8bgau.png")
                                        ]),
                                    ]),
                                    Grade(name: "2학년", schoolClasses: []),
                                    Grade(name: "3학년", schoolClasses: [])
                                ])

