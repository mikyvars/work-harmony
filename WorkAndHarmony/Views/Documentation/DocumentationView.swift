//
//  DocumentationView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import SwiftUI

struct DocumentationView: View {
    var videos: [Video] = [
        Video(title: "Yoga", image: "yoga", url: "", description: ""),
        Video(title: "Yoga", image: "yoga", url: "", description: ""),
        Video(title: "Yoga", image: "yoga", url: "", description: ""),
        Video(title: "Yoga", image: "yoga", url: "", description: ""),
        Video(title: "Yoga", image: "yoga", url: "", description: ""),
        Video(title: "Yoga", image: "yoga", url: "", description: "")
    ]
    
    let columns: [GridItem] = [
        GridItem(.fixed(100)),
        GridItem(.fixed(100)),
        GridItem(.fixed(100))
    ]
    
    var body: some View {
        NavigationStack{
            //        ZStack{
            //            TextField("Search", text: .constant(""))
            //                .padding(10)
            //                .background(Color(.systemGray6))
            //                .cornerRadius(8)
            //            HStack{
            //                Spacer()
            //                Image(systemName: "mic")
            //                    .foregroundColor(.gray)
            //                    .padding(10)
            //                    .background(Color(.systemGray6))
            //                    .cornerRadius(8)
            //            }
            //        }
            VStack{
                HStack{
                    Text("Vidéo")
                        .font(.title2)
                        .bold()
                    Spacer()
                    NavigationLink(destination: VideoView()) {
                        
                        Text("Tout voir")
                            .font(.callout)
                            .foregroundColor(.blue)
                        
                    } .padding()
                }
            }
            VStack {
                ScrollView {
                    
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(videos) { video in
                            VStack {
                                Image("yoga")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 110, height: 70)
                                Text(video.title)
                                    .font(.system(size: 10))
                            }
                        }
                    }
                    .padding(.vertical)
                }
            }
            HStack{
                Text("Articles")
                    .font(.title2)
                    .bold()
                Spacer()
                NavigationLink(destination: ArticlesView()) {
                    Text("Tout voir")
                        .font(.callout)
                        .foregroundColor(.blue)
                }
            } .padding()
        }
                    VStack {
                        ScrollView {
                            
                            
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(videos) { video in
                                    VStack {
                                        Image("stress")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 110, height: 70)
                                        Text(video.title)
                                            .font(.system(size: 10))
                                    }
                                }
                            }
                            .padding(.vertical)
                        }
                    }
                }
            }
        
    

#Preview {
    DocumentationView()
}


