//
//  ContentView.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 03/06/21.
//

import SwiftUI
import CoreData
// var test = "testing"

struct MainView: View {
    @State private var searchText : String = ""
    @State var showInfoModalView: Bool = false
    @ObservedObject var fetchDictionaries = Dictionaries()
    //    var listOfFavorite: [String]
    
    init() {
        UINavigationBar.appearance().backgroundColor = #colorLiteral(red: 0, green: 0.1807721257, blue: 0.4193686843, alpha: 1)
        
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.002132764552, green: 0.1801773906, blue: 0.4192627668, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UITableView.appearance().contentInset.top = -35
        
        //        UISearchBar.appearance().backgroundColor = #colorLiteral(red: 0, green: 0.1807721257, blue: 0.4193686843, alpha: 1)
        //        UITableView.appearance().backgroundColor = #colorLiteral(red: 0, green: 0.1807721257, blue: 0.4193686843, alpha: 1)
        
    }
    
    var body: some View {
        TabView {
            NavigationView {
                ZStack{
                    Color("DarkBlue")
                        .ignoresSafeArea()
                    VStack{
                        HStack{
                            SearchBar(text: $searchText)
                            Button(action: {showInfoModalView = true
                                
                            }) {
                                Image(systemName: "line.horizontal.3.decrease.circle").imageScale(.large)
                                    .foregroundColor(Color.white)
                            }
                        }
                        .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing], 9.0/*@END_MENU_TOKEN@*/)
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/21.0/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color("Color"))
                                .ignoresSafeArea()
                            List {
                                
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
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .navigationTitle("Dictionary")
                            .listStyle(GroupedListStyle())
                        }
                        .accentColor(Color(.label))
                    }
                }
            }
            .tabItem {
                Label("Dictionary", systemImage: "book.fill")
            }
            
            FavoriteView()
                .tabItem {
                    Label("Favorite", systemImage: "star.fill")
                }
        }
        
        .sheet(isPresented: $showInfoModalView, content: {
            filtermodal()
        })
        
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.light)
    }
}

//extension Color {
//    static let darkBlue = Color(red: 00 / 255, green: 17 / 255, blue: 67 / 255)
//}
