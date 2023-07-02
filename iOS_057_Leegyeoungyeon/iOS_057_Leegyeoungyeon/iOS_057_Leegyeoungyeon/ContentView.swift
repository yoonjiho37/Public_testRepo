//
//  ContentView.swift
//  iOS_057_Leegyeoungyeon
//
//  Created by yeon I on 2023/07/02.
//

import SwiftUI

struct ContentView: View {
    var body: some View {        
        VStack{
            NavigationStack {
                List {
                    Section {
                        AsyncImage(url: school.imageURL) {
                            image in image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    Section {
                        ForEach(school.grades) { grade in
                            NavigationLink {
                                GradeView (grade: grade)
                            } label: {
                                Text("\(grade.name)")
                            }
                        }
                        NavigationLink {
                            SelectionBattleView()
                        }label: {
                            Text("🔨battle of no humanity🔨")
                                .font(.custom("Aloha Chunky", size: 20))
                        }
                    }
                }.padding()
                    .navigationTitle("\(school.name)")
                   
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
