
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
     var body: some View {
        NavigationStack {
            Form {

                // Recommended Bedtime

                Section {
                    VStack(spacing: 12) {

                        Text("YOUR RECOMMENDED BEDTIME")
                            .font(.headline)
                            .foregroundStyle(.secondary)

                        if let bedtime = recommendedBedtime {
                            Text(
                                bedtime.formatted(
                                    date: .omitted,
                                    time: .shortened
                                )
                            )
                            .font(
                                .system(
                                    size: 48,
                                    weight: .bold,
                                    design: .rounded
                                )
                            )
                            .foregroundStyle(.blue)
                            .minimumScaleFactor(0.6)
                            .lineLimit(1)

                        } else {
                            Text("Unable to calculate")
                                .font(.title2)
                                .foregroundStyle(.red)
                        }

                        Text("Your ideal time to go to sleep")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 25)
                }
                
            Section("Wake Up Time") {
                    DatePicker(
                        "When do you want to wake up?",
                        selection: $wakeUp,
                        displayedComponents: .hourAndMinute
                    )
                }

              

                Section("Sleep Amount") {
                    Stepper(
                        "\(sleepAmount.formatted()) hours",
                        value: $sleepAmount,
                        in: 4...12,
                        step: 0.25
                    )
                }

               

                Section("Daily Coffee Intake") {

                    Picker(
                        "Number of cups",
                        selection: $coffeeAmount
                    ) {
                        ForEach(1...20, id: \.self) { amount in
                            Text("\(amount) cup(s)")
                                .tag(amount)
                        }
                    }
                    .pickerStyle(.menu)
                }
            }
            .navigationTitle("BetterRest")
        }
    }
}



#Preview {
    ContentView()
}


    

  
