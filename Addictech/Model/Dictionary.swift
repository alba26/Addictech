//
//  Dictionary.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 07/06/21.
//

import Foundation
struct Dictionary: Codable {
    let keywords, techExplanation, analogy, tag: String
    let img: String

    enum CodingKeys: String, CodingKey {
        case keywords
        case techExplanation = "tech_explanation"
        case analogy, tag, img
    }
}
