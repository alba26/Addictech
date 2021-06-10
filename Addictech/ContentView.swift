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
    var body: some View {
        NavigationView {
            ZStack {
                //                LinearGradient(gradient: Gradient(colors: [Color.darkBlue, Color.white]), startPoint: .top, endPoint: .bottom)
                //                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                VStack {
                    SearchBar(text: $searchText)
                    
                    List {
                        ForEach(self.fetchDictionaries.dictionaryData.filter {
                            self.searchText.isEmpty ? true : $0.keywords.lowercased().contains(self.searchText.lowercased())
                        }, id: \.keywords){item in
                            Text(item.keywords)
                        }
                        
                        NavigationLink (
                            destination: DetailView(),
                            label: {
                                Text("Bandwidth")
                            })
                    }
                    
                    //List(fetchDictionaries.dictionaryData, id: \.keywords){item in
                    //Text(item.keywords)
                    //}
                    
                    Spacer()
                    
                }
                .navigationTitle("Addictech")
            }
        }
        .accentColor(Color(.label))
    }
}

struct DetailView: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading){
                
                //Deskripsi
                Text("Bandwidth didefinisikan sebagai jumlah informasi yang dapat mengalir melalui koneksi jaringan dalam periode waktu tertentu.")
                    .padding()
            }
            
            VStack(alignment: .leading) {
                Text("Analogi")
                    .padding()
                    .font(.title3)
                
                //Analogi
                Text("Bandwidth dianalogikan seperti jumlah lajur di jalan raya. Jalan raya besar dengan banyak jalur lalu lintas bergabung dengan jalan yang lebih kecil dengan jalur lalu lintas yang lebih sedikit. Jalan-jalan ini mengarah ke jalan yang lebih kecil dan lebih sempit, dan akhirnya ke jalan masuk rumah dan bisnis. Ketika mobil yang menggunakan sistem jalan raya sangat sedikit, setiap kendaraan dapat bergerak dengan bebas. Ketika lalu lintas bertambah, setiap kendaraan bergerak lebih lambat, terutama di jalan dengan lajur yang lebih sedikit. Ketika semakin banyak lalu lintas memasuki sistem jalan raya, bahkan jalan raya multijalur pun akan menjadi padat dan lambat. Jaringan data sangat mirip dengan sistem jalan raya, dengan paket data yang dianalogikan dengan mobil, dan bandwidth yang dianalogikan dengan jumlah jalur di jalan raya.")
                    .padding()
                
            }
            //Terminologi yang mau dijelaskan, passing data dari halaman sebelumnya
            .navigationBarTitle("Bandwidth", displayMode: .inline)
            Spacer()
        }
    }
}

func makeUIViewController () -> UINavigationController {
    let controller = UINavigationController()
    
    let searchController = UISearchController()
    searchController.searchBar.placeholder = "Search"
    controller.navigationBar.topItem?.searchController = searchController
    
    return controller
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Color {
    static let darkBlue = Color(red: 00 / 255, green: 17 / 255, blue: 67 / 255)
}

//extension Color {
//    static let darkBlue = Color(red: 00 / 255, green: 17 / 255, blue: 67 / 255)
//}
