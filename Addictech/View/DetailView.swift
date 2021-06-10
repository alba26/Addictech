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
    var body: some View {
        ScrollView {
            VStack{
                Button(action: {
                    self.textSpeech.speak(keywords: dictionary.keywords)
                }, label: {
                    Text("Speaker")
                })
            }
            VStack(alignment: .leading, spacing: 15){
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/21.0/*@END_MENU_TOKEN@*/)
                        .frame(height: 295.0)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    VStack(alignment: .leading, spacing: 5){
                        Text("Tech Explanation")
                            .font(.callout)
                            .bold()
                        Text(dictionary.tech_explanation)
                            .font(.footnote)
                    }
                }
                
                VStack(alignment: .leading, spacing: 5){
                    ZStack{
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Corner Radius@*/21.0/*@END_MENU_TOKEN@*/)
                            .frame(height: 295.0)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                        VStack(alignment: .leading, spacing: 5.0){
                            Text("Analogy")
                                .font(.callout)
                                .bold()
                            Text(dictionary.analogy)
                                .font(.footnote)
                        }
                    }
                }
            }
            .padding(.leading)
            .padding(.trailing)
            
            
        }.background(Color("Color"))
        
        
        .navigationBarTitle(dictionary.keywords)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dictionary: Dictionary.example)
    }
}
