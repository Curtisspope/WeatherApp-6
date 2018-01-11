import Foundation

//distance converter, used to show wind speed

class DistanceConverter  {
  class func meterPerSecondToMilesPerHour(value: Float) -> String {
    let result = Double(value) * 2.236936284
    
    return String(format: "%.0f", result)
  }
}
