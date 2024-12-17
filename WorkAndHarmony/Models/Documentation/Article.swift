//
//  Article.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import Foundation

class Article: Documentation {
    var type: Emotion
    var content: String
    
    init(title: String, image: String, type: Emotion, content: String) {
        self.type = type
        self.content = content
        super.init(title: title, image: image)
    }
}
