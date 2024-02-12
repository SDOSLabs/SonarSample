//
//  AppDatePicker.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 13/10/22.
//

import SwiftUI

struct AppDatePicker: View {
    @Binding private var date: Date
    
    init(date: Binding<Date>) {
        self._date = date
    }
    
    private let dateFormat: DateFormatter = {
        var dateFormat = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy"
        return dateFormat
    }()
    
    var body: some View {
        DatePicker("", selection: $date, in: ...Date(), displayedComponents: .date)
            .datePickerStyle(.compact)
            .overlay(
                Rectangle()
                    .fill(Color.white)
                    .allowsHitTesting(false)
            )
            .overlay {
                HStack {
                    Text(Calendar.current.isDateInToday(date) ? "Selecciona" : dateFormat.string(from: date))
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "calendar")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .topLeading)
                        .foregroundColor(.gray)
                }
                .allowsHitTesting(false)
                
                
            }
        
        .foregroundColor(Calendar.current.isDateInToday(date) ? Assets.Color.black58.opacity(0.7) : Assets.Color.black90)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(AppTextFieldStyle(.plain))
    }
}

struct AppDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AppDatePicker(date: .constant(Date()))
            AppDatePicker(date: .constant(Date(timeIntervalSinceNow: 60*60*60*4)))
        }
    }
}
