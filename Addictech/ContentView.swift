//
//  ContentView.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 03/06/21.
//

import SwiftUI
var test = "testing"
struct ContentView: View {
    @ObservedObject var fetchDictionaries = Dictionaries()
    var body: some View {
        NavigationView {
            List(fetchDictionaries.dictionaryData, id: \.keywords){item in
                Text(item.keywords)
            }
            .navigationTitle("Addictech")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
