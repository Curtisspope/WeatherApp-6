import Foundation
import UIKit

//collection of prepared alerts for all cases

class Alerts {
  
  static func showNoConnectionErrorMessage() {
    let alert = UIAlertController(title: "No connection", message: "Check your internet connection.", preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
  }
  
  static func showLocationNotFound() {
    let alert = UIAlertController(title: "Location not found.", message: "Please check location and try again.", preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
    UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
  }
  
  static func showCustomErrorMessage(title: String, message: String, button: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: button, style: UIAlertActionStyle.default, handler: nil))
    UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
  }
  
}

