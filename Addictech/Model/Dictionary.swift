//
//  Dictionary.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 07/06/21.
//

import Foundation
struct Dictionary: Decodable, Hashable {
    let keywords, tech_explanation, analogy, tag: String
    let image_name: String

//    enum CodingKeys: String, CodingKey {
//        case keywords
//        case techExplanation = "tech_explanation"
//        case analogy, tag, img
//    }
    static let example = Dictionary(keywords: "Machine Learning", tech_explanation: "This is ML", analogy: "This is Analogy", tag: "#ML", image_name: "None")
}
