import UIKit

class SearchController: BaseController,
                        UITextFieldDelegate {
  
  //the only textfield outlet
  @IBOutlet private weak var zipTextField: UITextField!
  
  //going back
  @IBAction func tapBack(_ sender: Any) {
    self.dismiss(animated: true, completion: nil)
  }
  
  //method to hide keyboard when tap DONE
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    zipTextField.resignFirstResponder()
    
    return true
  }
  
  //method takes zip code and searches location
  private func searchData() {
    GetWeatherRequest.fire(params: zipTextField.text!) { (object) in
      if let presenter = self.presentingViewController as? MainController {
        presenter.setData(object: object) //sets the found location on main screen
        self.dismiss(animated: true, completion: nil) //goes back to main screen if succefully found location
      }
    }
  }
  
  @IBAction func tapDone(_ sender: Any) {
    searchData() //initiates the search with separate DONE button
  }
  
}
