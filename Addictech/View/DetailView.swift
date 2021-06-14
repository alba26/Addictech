//
//  DetailView.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 09/06/21.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(sortDescriptors: [])
    private var favorites: FetchedResults<Favorite>
    let dictionary: Dictionary
    var textSpeech = TextToSpeech()

//    var isFavorite: FetchedResults<Favorite>.Element
    
    @State var isFavorite = UserDefaults.standard.bool(forKey: "Tap")
    
    var body: some View {
        
        List{
            Section(){
                HStack(spacing: 20.0){
                    Text(dictionary.keywords)
                        .font(.title)
                        .fontWeight(.bold)
                    Button(action: {
                        self.textSpeech.speak(keywords: dictionary.keywords)
                    }, label: {
                        Image(systemName: "speaker.wave.2.fill")
                    })
                    .buttonStyle(BorderlessButtonStyle())
                }
            }
            .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
            
            Section(header: Text("Tech Explanation")){
                
                HStack {
                    Text(dictionary.tech_explanation)
                    //                    Spacer()
                    //                    Button(action: {
                    //                        self.isFavorite.toggle()
                    //                        UserDefaults.standard.set(self.isFavorite, forKey: "Tap")
                    //                    }) {}
                    //
                    //                    if !isFavorite {
                    //                        Image (systemName: "star")
                    //                            .renderingMode(.original)
                    //                    } else {
                    //                        Image (systemName: "star.fill")
                    //                            .renderingMode(.original)
                    //                        let name = Notification.Name(rawValue: favoriteNotificationKey)
                    //                        NotificationCenter.default.post(name: name, object: nil)
                    //                    }
                }
            }
           
            
            Section(header: Text("Analogy")){
                Image("potrait_pic")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                
                Text(dictionary.analogy)
                    .font(.body)
                    .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/)
                    
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .navigationBarItems(trailing: Button(action: {
                self.isFavorite.toggle()
                updateFavorite()
            }, label: {
                if !isFavorite {
                    Image (systemName: "star")
                        .renderingMode(.template)
                } else {
                    Image (systemName: "star.fill")
                        .renderingMode(.original)
                }
            }))
        }
        
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle("", displayMode: .inline)
        
        
        //        ScrollView {
        //            VStack{
        //                Button(action: {
        //                    self.textSpeech.speak(keywords: dictionary.keywords)
        //                }, label: {
        //                    Text("Speaker")
        //                })
        //            }
        //            VStack(alignment: .leading, spacing: 15){
        //                Spacer()
        //                ZStack{
        //                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/21.0/*@END_MENU_TOKEN@*/)
        //                        .frame(height: 295.0)
        //                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
        //                    VStack(alignment: .leading, spacing: 5){
        //                        Text("Tech Explanation")
        //                            .font(.callout)
        //                            .bold()
        //                        Text(dictionary.tech_explanation)
        //                            .font(.footnote)
        //                    }
        //                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        //                }
        //
        //                VStack(alignment: .leading, spacing: 5){
        //                    ZStack{
        //                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/21.0/*@END_MENU_TOKEN@*/)
        //
        //                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
        //                        VStack(alignment: .leading, spacing: 5.0){
        //                            Text("Analogy")
        //                                .font(.callout)
        //                                .bold()
        //                            Text(dictionary.analogy)
        //                                .font(.footnote)
        //                        }
        //                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        //                    }
        //                }
        //            }
        //            .padding(.leading)
        //            .padding(.trailing)
        //
        //
        //        }
        //        .background(Color("Color"))
        //        .navigationBarTitle(dictionary.keywords, displayMode: .inline)
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unresolved Error: \(error)")
        }
    }
  
//    func updateFavorite(techterm: String, isFavorite: Bool) {
//        let newFavorite = Favorite(context: viewContext)
//        if isFavorite == false {
//            newFavorite.techTerm = dictionary.keywords
//            newFavorite.isFavorite = true
//        } else {
//            newFavorite.techTerm = nil
//            newFavorite.isFavorite = false
//        }
//
//        saveContext()
//    }
    
    func updateFavorite() {
        let newFavorite = Favorite(context: viewContext)
        if isFavorite == false {
            newFavorite.techTerm = dictionary.keywords
            newFavorite.isFavorite = true
        } else {
            newFavorite.techTerm = nil
            newFavorite.isFavorite = false
        }

        saveContext()
    }
    
//    func updateFavorite(_ favorites: FetchedResults<Favorite>.Element) {
//        let newFavorite = Favorite(context: viewContext)
//        if isFavorite == false {
//            newFavorite.techTerm = dictionary.keywords
//            newFavorite.isFavorite = true
//        } else {
//            newFavorite.techTerm = nil
//            newFavorite.isFavorite = false
//        }
//
//        saveContext()
//    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dictionary: Dictionary.example)
    }
}
