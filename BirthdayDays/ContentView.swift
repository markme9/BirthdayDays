//
//  ContentView.swift
//  BirthdayDays
//
//  Created by mark me on 1/7/23.
//

import SwiftUI

struct ContentView: View {
    // Create state variables to store the user's input
    @State private var birthYear: String = ""
    @State private var birthMonth: String = ""
    @State private var result: String = ""
    @State var daysUntilNextBirthday: Int = 0
    
    // Create a Date object for the current date
    let currentDate = Date()
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Know")
                .font(.system(size: 60, weight: .heavy, design: .serif))
                .foregroundColor(Color.green)
                .offset(y: -50)
                .padding(.leading)
            
            Text("Your next")
                .font(.system(size: 60, weight: .heavy, design: .serif))
                .foregroundColor(Color.yellow)
                .offset(y: -50)
                .padding(.leading)
            
            Text("Birthday's")
                .font(.system(size: 60, weight: .heavy, design: .serif))
                .foregroundStyle(LinearGradient(colors: [.purple, .red], startPoint: .leading, endPoint: .trailing))
                .offset(y: -50)
                .padding(.leading)
            
            Text("days : \(daysUntilNextBirthday)")
                .font(.system(size: 60, weight: .heavy, design: .serif))
                .foregroundStyle(LinearGradient(colors: [.red, .blue, .purple, .yellow, .orange], startPoint: .leading, endPoint: .trailing))
                .offset(y: -50)
                .padding(.leading)
            
            
            // Add text fields for the user to enter their birth year and month
            VStack {
                TextField("Enter your birth year", text: $birthYear)
                    .padding()
                    .keyboardType(.numberPad)
                    .frame(height: 50)
                    .background(Color(UIColor.magenta).opacity(0.3))
                    .cornerRadius(15)
                    .offset(y: -80)
                    .padding(.bottom, 5)
                TextField("Enter your birth month", text: $birthMonth)
                    .padding()
                    .keyboardType(.numberPad)
                    .frame(height: 50)
                    .background(Color(UIColor.magenta).opacity(0.3))
                    .cornerRadius(15)
                    .offset(y: -80)
                
                // Add a button to trigger the calculation of the birthday
                
                Button(action: {
                    // Convert the user's input to integers and set default value
                    
                    let year = Int(self.birthYear) ?? 2022
                    let month = Int(self.birthMonth) ?? 01
                    
                    // Create a Date object for the person's birthday
                    
                    let birthday = DateComponents(calendar: .current, year: year, month: month, day: 1).date!
                    
                    // Calculate the number of days until the next birthday
                    
                    let nextBirthday = Calendar.current.nextDate(after: self.currentDate, matching: DateComponents(month: month, day: 1), matchingPolicy: .nextTime)!
                    
                    daysUntilNextBirthday = Calendar.current.dateComponents([.day], from: self.currentDate, to: nextBirthday).day!
                    
                    // Update the text label with the countdown in days
                    
                    self.result = "\(daysUntilNextBirthday)"
                }) {
                    Text("Sumbit")
                        .font(.title.bold())
                        .buttonBorderShape(.roundedRectangle)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color(UIColor.magenta))
                        .foregroundStyle(Color.white)
                        .cornerRadius(15)
                }
                
                .offset(y: -80)
                .padding(.top)
                
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
