//
//  ContentView.swift
//  JoshanRai-WeSplit
//
//  Created by Joshan Rai on 1/26/22.
//
//  This app made following the "100 Days of SwiftUI" curiculum by Paul Hudson at https://www.hackingwithswift.com/100/swiftui
//


import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var nPeople = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                }.navigationTitle("WeSplit")
                
                Picker("Number of people", selection: $nPeople) {
                    ForEach(2..<100) {
                        Text("\($0) people")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
