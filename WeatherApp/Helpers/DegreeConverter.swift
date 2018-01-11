import Foundation

//degree converter to process data, works both ways

class DegreeConverter {
  
  class func getCelsius(kelvinTemp: Double) -> String {
    let celsiusTemp = kelvinTemp - 273.15
    
    return String(format: "%.0f", celsiusTemp)
  }
  
  class func getFahrenheit(kelvinTemp: Double) -> String {
    let fahrenheitTemp = 1.8 * (kelvinTemp - 273) + 32
    
    return String(format: "%.0f", fahrenheitTemp)
  }
  
}
