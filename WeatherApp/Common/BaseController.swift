import UIKit

class BaseController: UIViewController {
  
  var defaultsHelper = DefaultsHelper()
  
  var tempValue: Int {
    get {
      return defaultsHelper.readStoredTemp()
    }
  }
  
  var measureValue: Int {
    get {
      return defaultsHelper.readStoredMeasuments()
    }
  }
  
}
