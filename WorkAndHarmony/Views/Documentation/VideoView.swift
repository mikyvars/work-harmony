//
//  VideoView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 55 on 13/12/2024.
//

import SwiftUI

struct VideoView: View {
    
    var body: some View {
        let columns: [GridItem] = [
            GridItem(.fixed(100)),
            GridItem(.fixed(100)),
            GridItem(.fixed(100))
        ]
        HStack{
            Text("Videos")
                .padding()
            Spacer()
               
        }
        LazyVGrid(columns: columns, spacing: 20){
            ForEach(0..<9){ video in
                
                VStack{
                Image("stress")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 110, height: 70)
                     Text("Ici il y aura mets vidéos")
                        .font(.system(size: 10))
                    Spacer()
                    
                }
            }
        }
    }
}

                    
                
            
          

    

#Preview {
    VideoView()
}
