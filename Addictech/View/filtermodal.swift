//
//  filtermodal.swift
//  Addictech
//
//  Created by Helen I H on 10/06/21.
//

import SwiftUI

struct FilterButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .padding(12.0)
            .accentColor(Color("navy blue"))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke( Color.black, lineWidth: 1.5))
    }
}


struct filtermodal: View {
    init() {
        UINavigationBar.appearance().backgroundColor = .white
        UINavigationBar.appearance().barTintColor = .white
    }
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 20.0){
                Text("Sort")
                    .font(.body)
                    .fontWeight(.semibold)
                
                HStack{
                    
                    Button(action: {}, label: {
                        Text("Ascending")
                    }).modifier(FilterButton())
                    
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Descending")
                    }).modifier(FilterButton())
                    
                }
                
                Text("Category")
                    .font(.body)
                    .fontWeight(.semibold)
                
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("ML")
                    }).modifier(FilterButton())
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Devices")
                    }).modifier(FilterButton())
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Network")
                        
                    }).modifier(FilterButton())
                }
                
                
            }
            //        .padding(.horizontal, 25.0)
            //        .frame(width: 330, height: 400.0)
            .offset(y: -125)
            .navigationTitle("Search Filter").navigationBarTitleDisplayMode(/*@START_MENU_TOKEN@*/.inline/*@END_MENU_TOKEN@*/)
            .navigationBarItems(leading:
                                    
                                    Button(action: {
                                        
                                    }) {Text("Refresh")
                                        .foregroundColor(Color("navy blue"))},
                                trailing:
                                    Button(action: {
                                        
                                    }) {
                                        Text("Apply").foregroundColor(Color("navy blue"))})
        }
        
    }
}

struct filtermodal_Previews: PreviewProvider {
    static var previews: some View {
        filtermodal()
    }
}
