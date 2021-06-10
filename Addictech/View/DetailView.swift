//
//  DetailView.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 09/06/21.
//

import SwiftUI

struct DetailView: View {
    let dictionary: Dictionary
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15){
                Spacer()
                VStack(alignment: .leading, spacing: 5){
                    Text("Tech Explanation")
                        .font(.callout)
                        .bold()
                    Text(dictionary.tech_explanation)
                        .font(.footnote)
                }
                Divider()
                VStack(alignment: .leading, spacing: 5){
                    Text("Analogy")
                        .font(.callout)
                        .bold()
                    Text(dictionary.analogy)
                        .font(.footnote)
                }
            }
            .padding(.leading)
            .padding(.trailing)
           
        }
        
        .navigationBarTitle(dictionary.keywords)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(dictionary: Dictionary.example)
    }
}
