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
                
                List {
                    SearchBar(text: $searchText)
                    ForEach(self.fetchDictionaries.dictionaryData.filter {
                        self.searchText.isEmpty ? true : $0.keywords.lowercased().contains(self.searchText.lowercased())
                    }, id: \.keywords){item in
                        NavigationLink(
                            destination: DetailView(dictionary: item),
                            label: {
                                Text(item.keywords)
                            })
                    }
                }
                .navigationTitle("Addictech")

                .listStyle(GroupedListStyle())
                
            }
            .accentColor(Color(.label))
            
        }

    }
}

//func makeUIViewController () -> UINavigationController {
//    let controller = UINavigationController()
//    let searchController = UISearchController()
//    searchController.searchBar.placeholder = "Search"
//    controller.navigationBar.topItem?.searchController = searchController
//    
//    return controller
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//extension Color {
//    static let darkBlue = Color(red: 00 / 255, green: 17 / 255, blue: 67 / 255)
//}
