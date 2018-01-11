import Foundation

//separate wrapper for user defauts. used to store data between app launches.

class DefaultsHelper {
  
  private var defaults = UserDefaults.standard
  
  func appHasBeenLaunchedBefore() -> Bool {
    if defaults.bool(forKey: "appHasBeenLaunchedBefore") == true {
      return true
    } else {
      defaults.set(true, forKey: "appHasBeenLaunchedBefore")
    }
    return false
  }
  
  func readStoredLocation() -> (city: String, country: String) {
    var city = ""
    var country = ""
    
    if defaults.value(forKey: "city") != nil && (defaults.value(forKey: "city") as! String).count > 0 {
      city = defaults.value(forKey: "city") as! String
    }
    
    if defaults.value(forKey: "country") != nil && (defaults.value(forKey: "country") as! String).count > 0 {
      country = defaults.value(forKey: "country") as! String
    }
    
    return (city: city, country: country)
  }
  
  func writeStoredLocation(object: (city: String, country: String)) {
    defaults.set(object.city, forKey: "city")
    defaults.set(object.country, forKey: "country")
  }
  
  func writeStoredTemp(temp: Int) {
    defaults.set(temp, forKey: "storedTemp")
  }
  
  func writeStoredMeasuments(measuments: Int) {
    defaults.set(measuments, forKey: "storedMeasuments")
  }
  
  func readStoredTemp() -> Int {
    return defaults.value(forKey: "storedTemp") as! Int
  }
  
  func readStoredMeasuments() -> Int {
    return defaults.value(forKey: "storedMeasuments") as! Int
  }
  
}
