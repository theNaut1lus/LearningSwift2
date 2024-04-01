//
//  ContentView.swift
//  LearningSwift2
//
//  Created by Sidak Singh Aulakh on 26/3/2024.
//

import SwiftUI

struct ContentView: View {
    @State var step = 22
    @State var color: Color = .gray
    @State var date: Date = Date()
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(color)
                .ignoresSafeArea()
            VStack {
                Text("Stepper, ColorPicker and DatePicker View")
                    .foregroundStyle(.regularMaterial)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.black)
                //for each range thingy example
                ForEach(0...5, id:\.self) {
                    i in Text(String(i))
                }
                Stepper(value: $step, in: 0...5) {
                    Text(String(step))
                }
                ColorPicker("Color Picker", selection: $color)
                DatePicker("Pick a Date", selection: $date, displayedComponents: .date)
                Text(DateFormatter.localizedString(from: date, dateStyle: .full, timeStyle: .short))
                Text(DateFormatter.month.string(from: date))
            }
        }
    }
}
extension DateFormatter {
    static var month: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }
}

#Preview {
    ContentView()
}
