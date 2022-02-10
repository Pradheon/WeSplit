//
//  ContentView.swift
//  JoshanRai-WeSplit
//
//  Created by Joshan Rai on 1/26/22.
//
//  This app made following the "100 Days of SwiftUI" curiculum by Paul Hudson at https://www.hackingwithswift.com/100/swiftui
//


import SwiftUI

var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
    let currencyCode = Locale.current.currencyCode ?? "USD"
    return FloatingPointFormatStyle<Double>.Currency(code: currencyCode)
}

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var nPeople = 2
    @State private var tipPercentage = 15
    @FocusState private var amountIsFocus: Bool
    
    //let tipPercentages = [0, 10, 15, 20, 25]
    
    var totalPerPerson: Double {
        let peopleCount = Double(nPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var checkTotal: Double {
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        
        return grandTotal
    }
    
    var tipPerPerson: Double {
        let peopleCount = Double(nPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let tipPerPerson = tipValue / peopleCount
        
        return tipPerPerson
    }
    
    var tipTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        
        return tipValue
    }
    
    var body: some View {
        NavigationView {
            Form {
                
                // Check Amount Section
                Section {
                    TextField("Amount", value: $checkAmount, format: currencyFormat)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocus)
                } header: {
                    Text("Check Amount")
                }
                .navigationTitle("WeSplit")
                
                // Tip Percentage Section
                Section {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0..<101) {
                            Text($0, format: .percent)
                        }
                    }
                    //.pickerStyle(.segmented)
                }
                
                // Number of People Section
                Section {
                    Picker("Number of People", selection: $nPeople) {
                        ForEach(2..<101) {
                            Text("\($0) people")
                        }
                    }
                }
                
                // Tip per Person Section
                Section {
                    Text(tipPerPerson, format: currencyFormat)
                } header: {
                    Text("Tip Amount per Person")
                }
                
                // Tip Total Section
                Section {
                    Text(tipTotal, format: currencyFormat)
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                } header: {
                    Text("Tip Total")
                }
                
                // Amount per Person Section
                Section {
                    Text(totalPerPerson, format: currencyFormat)
                } header: {
                    Text("Check Amount per Person")
                }
                
                // Check Total Section
                Section {
                    Text(checkTotal, format: currencyFormat)
                        .foregroundColor(tipPercentage == 0 ? .red : .black)
                } header: {
                    Text("Check Total")
                }
            }
        }.toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                
                Button("Done") {
                    amountIsFocus = false
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
