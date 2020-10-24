//
//  WeekDaysView.swift
//  Remind Diet
//
//  Created by Arthur Rodrigues on 14/10/20.
//  Copyright © 2020 Arthur Rodrigues. All rights reserved.
//

import SwiftUI

struct WeekDaysView: View {
    
    @State var selectedDays: [Frequency] = []
    
    var body: some View {
        ForEach(Frequency.allCases, id: \.self) { day in
            DayCell(day: day, isSelected: self.selectedDays.contains(day)) {
                if self.selectedDays.contains(day) {
                    self.selectedDays.removeAll(where: { $0 == day })
                }
                else {
                    self.selectedDays.append(day)
                }
            } // DayCell
        } // ForEach
    }
}

struct DayCell: View {
    var day: Frequency
    var isSelected: Bool
    var action: () -> Void
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(day.rawValue)
                if isSelected {
                    Spacer()
                    Image(systemName: "checkmark").foregroundColor(.green)
                }
            }
        }
        
    }
}

struct WeekDaysView_Previews: PreviewProvider {
    static var previews: some View {
        WeekDaysView()
    }
}
