//
//  ContentView.swift
//  Addictech
//
//  Created by Adhitya Laksamana Bayu Adrian on 03/06/21.
//

import SwiftUI
var test = "testing"
struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0 ..< 40) { item in
                Text("Hello, World!")
                //.padding()
            }
        }
        .navigationTitle("Addictech")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
