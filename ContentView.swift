
import SwiftUI
import CoreML
import Foundation

struct ContentView: View {


    @State private var coffeeAmount: Int = 1
    @State private var wakeUp: Date = ContentView.defaultWakeTime
    @State private var sleepAmount: Double = 8.0

  

    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0

        return Calendar.current.date(from: components) ?? .now
    }
    var recommendedBedtime: Date? {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents(
                [.hour, .minute],
                from: wakeUp
            )

            let hour = (components.hour ?? 0) * 3600
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(
                wake: Double(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )

            return wakeUp.addingTimeInterval(-prediction.actualSleep)

        } catch {
            return nil
        }
    }
    

  
