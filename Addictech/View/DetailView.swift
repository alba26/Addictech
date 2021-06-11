//
//  DetailView.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 09/06/21.
//

import SwiftUI

struct DetailView: View {
    let dictionary: Dictionary
    var textSpeech = TextToSpeech()
    @State private var isFavorite = UserDefaults.standard.bool(forKey: "Tap")
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
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Section(header: Text("Tech Explanation")){
                
                HStack {
                    Text(dictionary.tech_explanation)
                    Spacer()
                    Button(action: {
                        self.isFavorite = true
                        UserDefaults.standard.set(self.isFavorite, forKey: "Tap")
                    }, label: {
                        Image(systemName: "star")
                    })
                }
            }
            
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Section(header: Text("Analogy")){
                Image("potrait_pic")
                    .resizable()
                    .scaledToFit()
                    .padding(.top)
                
                Text(dictionary.analogy)
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
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
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dictionary: Dictionary.example)
    }
}
