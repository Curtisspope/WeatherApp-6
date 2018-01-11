import UIKit

class SettingsController: BaseController {
  
  //segment control outlets
  @IBOutlet private weak var tempSegmentedControl: UISegmentedControl!
  @IBOutlet private weak var measuresSegmentedControl: UISegmentedControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    //initial segments setup according to stored data
    tempSegmentedControl.selectedSegmentIndex = self.defaultsHelper.readStoredTemp()
    measuresSegmentedControl.selectedSegmentIndex = self.defaultsHelper.readStoredMeasuments()
  }
  
  @IBAction func tapBack(_ sender: Any) {
    //going back and saving segments values
    self.defaultsHelper.writeStoredTemp(temp: tempSegmentedControl.selectedSegmentIndex)
    self.defaultsHelper.writeStoredMeasuments(measuments: measuresSegmentedControl.selectedSegmentIndex)
    
    if let presenter = self.presentingViewController as? MainController {
      presenter.updateView() //updating main screen according to new settings
    }
    self.dismiss(animated: true, completion: nil)
  }
  
}
