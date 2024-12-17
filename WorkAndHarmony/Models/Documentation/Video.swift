//
//  Video.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 11/12/2024.
//

import Foundation

class Video: Documentation {
    var url: String
    var description: String
    
    init(title: String, image: String, url: String, description: String) {
        self.url = url
        self.description = description
        super.init(title: title, image: image)
    }
}
