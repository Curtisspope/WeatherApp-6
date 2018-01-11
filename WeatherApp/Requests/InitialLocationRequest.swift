import Foundation
import Alamofire

//request used to search initial users location without geocoding, not used for zip codes, was made to do initial search before entering any data

class InitialLocationRequest {
  
  class func fire(completion: @escaping (_ parameter: [String]) -> Void) {
    Alamofire.request("http://ip-api.com/json", method: .get) //api
      .validate(statusCode: 200..<300)
      .responseJSON { response in
        if let status = response.response?.statusCode {
          switch status {
          case 200:
            var location: [String] = []
            if let retrivedData = response.result.value as? [String: Any] {
              if let cityValue = retrivedData["city"] { //city data
                location.append(cityValue as! String)
              }
              if let countryValue = retrivedData["countryCode"] { //country data
                location.append(countryValue as! String)
              }
              
              completion(location)
            }
          default:
            break
          }
        }
    }
  }
  
}
