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
        UINavigationBar.appearance().backgroundColor = #colorLiteral(red: 0, green: 0.1807721257, blue: 0.4193686843, alpha: 1)
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.002132764552, green: 0.1801773906, blue: 0.4192627668, alpha: 1)
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
            .preferredColorScheme(.light)
    }
}

//extension Color {
//    static let darkBlue = Color(red: 00 / 255, green: 17 / 255, blue: 67 / 255)
//}
