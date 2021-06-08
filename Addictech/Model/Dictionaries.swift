//
//  Dictionaries.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 07/06/21.
//

import Foundation

class Dictionaries: ObservableObject{
    @Published var dictionaryData = [Dictionary]()
    init() {
        let url = Bundle.main.url(forResource: "AdditechData", withExtension: ".json")!
        let data = try! Data(contentsOf: url)
        dictionaryData = try! JSONDecoder().decode([Dictionary].self, from: data)
        print(dictionaryData)
    }
}
