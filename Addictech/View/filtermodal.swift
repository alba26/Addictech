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
            .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke( Color.black, lineWidth: 2))
    }
}


struct filtermodal: View {
    var body: some View {
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
                    Text("Computer")
                }).modifier(FilterButton())
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Website")
                        
                }).modifier(FilterButton())
            }
            
            
        }
        .padding(.horizontal, 25.0)
        .frame(width: 330, height: 400.0)
        .offset(y: -125)

        
    }
}

struct filtermodal_Previews: PreviewProvider {
    static var previews: some View {
        filtermodal()
    }
}
