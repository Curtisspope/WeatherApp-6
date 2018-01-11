import Foundation

//time converter, converts UNIX time to 24h and AmPm formats, used to show proper sunrise/sunset

class TimeConverter {
  
  class func getTime24h(unixTime: Int) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    dateFormatter.timeZone = TimeZone.current
    let date = Date(timeIntervalSince1970: Double(unixTime))
    let output = dateFormatter.string(from: date)
    
    return output
  }
  
  class func getTimeAMPM(unixTime: Int) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "h:mm a"
    dateFormatter.amSymbol = "AM"
    dateFormatter.pmSymbol = "PM"
    dateFormatter.timeZone = TimeZone.current
    let date = Date(timeIntervalSince1970: Double(unixTime))
    let output = dateFormatter.string(from: date)
    
    return output
  }
  
}
