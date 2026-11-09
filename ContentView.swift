
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

  
