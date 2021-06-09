//
//  ContentView.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 03/06/21.
//

import SwiftUI
// var test = "testing"


struct ContentView: View {
    @State private var searchText : String = ""
    
    @ObservedObject var fetchDictionaries = Dictionaries()
    init() {
        UINavigationBar.appearance().backgroundColor = .blue
        UINavigationBar.appearance().barTintColor = .blue
    }
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)
                
                List {
                ForEach(self.fetchDictionaries.dictionaryData.filter {
                    self.searchText.isEmpty ? true : $0.keywords.lowercased().contains(self.searchText.lowercased())
                }, id: \.keywords){item in
                    Text(item.keywords)
                }
                }
                Spacer()
                
                //List(fetchDictionaries.dictionaryData, id: \.keywords){item in
                //Text(item.keywords)
                //}
                .navigationTitle("Addictech")
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
