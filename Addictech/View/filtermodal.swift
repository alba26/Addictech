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
            .accentColor(Color("DarkBlue"))
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke( Color.black, lineWidth: 1.5))
    }
}


struct filtermodal: View {
    @Environment(\.presentationMode) private var presentationMode
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
                
                HStack(){
                    
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
            .frame(width: UIScreen.main.bounds.width)
            .offset(x: -50,y: -230)
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(leading:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }) {Text("Cancel")
                                        .foregroundColor(Color("navy blue"))},
                                trailing:
                                    HStack{
                                        Button(action: {
                                            
                                            
                                        }) {
                                            Text("Apply").foregroundColor(Color("navy blue"))}
                                        Button(action: {
                                            
                                        }) {
                                            Image(systemName: "arrow.clockwise").foregroundColor(Color("navy blue"))}
                                    }
                                   )
        }
        
    }
}

struct filtermodal_Previews: PreviewProvider {
    static var previews: some View {
        filtermodal()
            .preferredColorScheme(.dark)
    }
}
