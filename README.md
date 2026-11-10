BetterRest 🛌💤

An intelligent iOS application built with SwiftUI and Core ML that calculates the ideal bedtime based on desired wake-up times, amount of sleep needed, and daily coffee intake.

📱 About The Project

BetterRest is designed to solve a universal problem: When do I need to go to sleep? By leveraging Apple's Core ML framework, the app analyzes user habits—such as target wake-up hours, sleep duration goals, and daily coffee consumption—to predict the optimal time to fall asleep.

Originally inspired by classic iOS development challenges, this application demonstrates the seamless integration of machine learning models into clean, reactive SwiftUI interfaces.

🛠️ Built With

SwiftUI — Declarative UI framework for building modern iOS user experiences.

Core ML — Apple's machine learning framework used for on-device predictions.

Xcode / iOS SDK — Primary development environment and toolchain.


✨ Features

Smart Bedtime Prediction: Instant calculation of optimal sleep times using a trained machine learning model.

Customizable Inputs: Easily adjust wake-up times, sleep hours, and cups of coffee via intuitive steppers and date pickers.

Reactive Interface: Seamless UI updates as parameters change in real-time.

Lightweight & Fast: Runs entirely on-device with zero network latency or privacy concerns.


📂 Project Structure

BetterRest/
├── BetterRestApp.swift   # App entry point
├── ContentView.swift     # Main UI and calculation logic
├── BetterRest.mlmodel    # Core ML model for sleep prediction
└── Assets.xcassets/      # App icons and visual resources

