import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

//base request to get weather by zip.

class GetWeatherRequest {
  
  class func fire(params: String, completion: @escaping (_ parameter: WeatherObject) -> Void) {
    if Reachability.isConnectedToNetwork() == true { //checks internet connectivity
      
      let defaultsHelper = DefaultsHelper() //takes helper for processing stored zip
      
      let urlParams = [ //prepares params for request
        "zip": params,
        "APPID": ApiData.apiKey,
        ]
      
      Alamofire.request(ApiData.mainUrl, method: .get, parameters: urlParams)
        .validate(statusCode: 200..<300)
        .responseObject { (response: DataResponse<WeatherObject>) in
          if let status = response.response?.statusCode { //process server response
            switch status {
            case 200:
              completion(response.result.value!) //passes data to main screen
              defaultsHelper.writeStoredLocation(object: (city: params, country: "United States")) //stores data to userDefaults
              break
            case 403:
              break
            case 422:
              break
            default:
              break
            }
          }
      }
    } else {
      Alerts.showNoConnectionErrorMessage() //show alert when no connection is available
    }
  }
  
}
