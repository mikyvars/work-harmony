//
//  LogsDateSelectorView.swift
//  WorkAndHarmony
//
//  Created by Apprenant 39 on 13/12/2024.
//

import SwiftData
import SwiftUI

struct DateSelectorView: View {
    @Query var results: [Result]
    @Binding var selectedDate: Date
    @State var showDatePicker: Bool = false
    
    func lastFourDays() -> [Date] {
        var dates: [Date] = []
        let calendar = Calendar.current
        let currentDate = Date()
        
        dates.append(currentDate)
        
        for i in 1...3 {
            if let previousDay = calendar.date(byAdding: .day, value: -i, to: currentDate) {
                dates.append(previousDay)
            }
        }
        
        return dates.reversed()
    }
    
    func resultExists(for date: Date) -> Bool {
        return results.contains { result in
            Calendar.current.isDate(result.date, inSameDayAs: date)
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter.string(from: date)
    }
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("Background"))
                    .frame(maxWidth: .infinity)
                
                HStack(alignment: .top, spacing: 15) {
                    Button(action: {
                        withAnimation() {
                            showDatePicker.toggle()
                        }
                    }, label: {
                        DateSelectorIconView(icon: "calendar", label: "")
                    })
                    
                    ForEach(lastFourDays(), id: \.self) { date in
                        let resultsExists = resultExists(for: date)
                        
                        if(resultsExists) {
                            Button(action: {
                                selectedDate = date
                            }, label: {
                                DateSelectorIconView(
                                    icon: "bolt.fill",
                                    label: formatDate(date)
                                )
                            })
                        } else if(Calendar.current.isDateInToday(date)) {
                            Button(action: {
                                selectedDate = date
                            }, label: {
                                DateSelectorIconView(
                                    icon: "bolt",
                                    label: formatDate(date)
                                )
                            })
                        } else {
                            DateSelectorIconView(
                                icon: "bolt",
                                label: formatDate(date)
                            )
                            .opacity(0.5)
                        }
                    }
                    .foregroundStyle(.black)
                }
                .padding(.vertical, 20)
            }
            
            if showDatePicker {
                DatePicker("", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(.graphical)
                    .transition(.move(edge: .top))
                    .background(Color("Background"))
                    .zIndex(-1)
            }
        }
    }
}

#Preview {
    DateSelectorView(selectedDate: .constant(Date()))
        .padding()
}
