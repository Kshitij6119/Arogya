import SwiftUI

struct FitnessView: View {
    // Sample data properties
    @State private var steps: Int = 7560
    @State private var calories: Double = 1345
    @State private var distance: Double = 5.2
    @State private var heartRate: Int = 72
    
    // BMI properties
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var feet: String = ""
    @State private var inches: String = ""
    @State private var heightUnit: String = "cm" // Default to cm
    @State private var bmi: Double? = nil
    @State private var bmiCategory: String = ""

    // Sample daily progress data
    let dailySteps: [Double] = [3000, 4000, 5000, 4500, 7000, 7560, 8000]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                
                // Fitness Tracker Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("Daily Fitness Goals")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    HStack(spacing: 30) {
                        // Steps Progress Ring
                        ProgressRingView(progress: 0.75, title: "Steps", value: "\(steps)", color: .blue)

                        // Calories Progress Ring
                        ProgressRingView(progress: 0.60, title: "Calories", value: String(format: "%.1f", calories), color: .green)

                        // Distance Progress Ring
                        ProgressRingView(progress: 0.80, title: "Distance", value: String(format: "%.1f km", distance), color: .orange)
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                // Daily Progress Graph Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("Daily Steps Progress")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    LineGraphView(data: dailySteps)
                        .frame(height: 200)
                        .padding(.horizontal)
                }
                .padding(.vertical)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // BMI Calculator Section
                VStack(alignment: .leading, spacing: 20) {
                    Text("BMI Calculator")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)

                    // Weight Input (in kg)
                    TextField("Enter weight (kg)", text: $weight)
                        .keyboardType(.decimalPad)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                        .padding(.horizontal)

                    // Height Unit Picker (feet/inches or cm)
                    Picker("Height Unit", selection: $heightUnit) {
                        Text("Feet/Inches").tag("feet")
                        Text("Centimeters").tag("cm")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)

                    // Conditional Height Input
                    if heightUnit == "feet" {
                        HStack {
                            TextField("Feet", text: $feet)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)

                            TextField("Inches", text: $inches)
                                .keyboardType(.numberPad)
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                        }
                        .padding(.horizontal)
                    } else {
                        TextField("Enter height (cm)", text: $height)
                            .keyboardType(.decimalPad)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }

                    // Calculate BMI Button
                    Button(action: calculateBMI) {
                        Text("Calculate BMI")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }

                    // BMI Result Display
                    if let bmi = bmi {
                        VStack(alignment: .leading) {
                            Text("Your BMI: \(String(format: "%.2f", bmi))")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.horizontal)

                            Text(bmiCategory)
                                .font(.headline)
                                .foregroundColor(.secondary)
                                .padding(.horizontal)
                        }
                        .padding(.vertical)
                    }
                }
                .padding(.vertical)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
                
                Spacer()
            }
            .padding()
        }
        .background(Color(.systemBackground).edgesIgnoringSafeArea(.all))
        .foregroundColor(.primary)
        .navigationBarTitle("Fitness Tracker", displayMode: .inline)
    }
    
    // BMI Calculation function
    func calculateBMI() {
        guard let weight = Double(weight) else {
            return
        }
        
        var heightInMeters: Double = 0
        
        // Convert height to meters
        if heightUnit == "feet" {
            guard let feetValue = Double(feet), let inchesValue = Double(inches) else {
                return
            }
            let totalInches = (feetValue * 12) + inchesValue
            heightInMeters = totalInches * 0.0254 // 1 inch = 0.0254 meters
        } else if heightUnit == "cm", let heightValue = Double(height) {
            heightInMeters = heightValue / 100 // Convert cm to meters
        }
        
        guard heightInMeters > 0 else {
            return
        }
        
        let bmiValue = weight / (heightInMeters * heightInMeters)
        self.bmi = bmiValue
        
        // Determine the BMI category
        if bmiValue < 18.5 {
            bmiCategory = "Underweight"
        } else if bmiValue >= 18.5 && bmiValue < 24.9 {
            bmiCategory = "Normal weight"
        } else if bmiValue >= 25 && bmiValue < 29.9 {
            bmiCategory = "Overweight"
        } else {
            bmiCategory = "Obese"
        }
    }
}

// LineGraphView to show the progress as a line graph
struct LineGraphView: View {
    var data: [Double]

    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let width = geometry.size.width
                let height = geometry.size.height
                let maxValue = data.max() ?? 1
                
                let points = data.enumerated().map { index, value in
                    CGPoint(x: CGFloat(index) / CGFloat(data.count - 1) * width,
                            y: height - (CGFloat(value) / CGFloat(maxValue) * height))
                }

                path.move(to: points.first ?? .zero)
                for point in points {
                    path.addLine(to: point)
                }
            }
            .stroke(Color.blue, lineWidth: 2)
            .background(Color.gray.opacity(0.1))
        }
    }
}

struct ProgressRingView: View {
    var progress: CGFloat
    var title: String
    var value: String
    var color: Color

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                    .frame(width: 80, height: 80)

                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(color, lineWidth: 10)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 80, height: 80)
                    .overlay(
                        Text(value)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(color)
                    )
            }
            Text(title)
                .font(.headline)
                .foregroundColor(color)
        }
    }
}

struct FitnessView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessView()
            .preferredColorScheme(.dark) // Preview in dark mode
        FitnessView()
            .preferredColorScheme(.light) // Preview in light mode
    }
}
