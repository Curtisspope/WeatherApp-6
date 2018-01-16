import UIKit

class MainController: BaseController ,UITableViewDelegate,UITableViewDataSource{
 
    

  
  //connected properties from storyboard
  @IBOutlet private weak var weatherTypeIconImageView: UIImageView!

  @IBOutlet private weak var weatherTempLabel: UILabel!

  @IBOutlet private weak var cityLabel: UILabel!

  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    //first launch detection
    if self.defaultsHelper.appHasBeenLaunchedBefore() != true {
      self.defaultsHelper.writeStoredTemp(temp: 0)
      self.defaultsHelper.writeStoredMeasuments(measuments: 0)
    } else {
      let storedLocation = self.defaultsHelper.readStoredLocation()
      
      //getting data on second launch
      GetWeatherRequest.fire(params: storedLocation.city) { (receivedData) in
        self.setData(object: receivedData)
      }
    }
  }
  
  //updating screen appearance after config usage
  func updateView() {
    let storedLocation = self.defaultsHelper.readStoredLocation()
    GetWeatherRequest.fire(params: storedLocation.city) { (receivedData) in
      self.setData(object: receivedData)
    }
  }
  
  //setting outlets values
  func setData(object: WeatherObject) {
    weatherTypeIconImageView.image = UIImage(named: "weather/\(String(describing: (object.weather![0].icon)!))")
    weatherTypeIconImageView.imageFromServerURL(urlString: "http://openweathermap.org/img/w/\((object.weather![0].icon)!).png")
    

    
    weatherTempLabel.text = self.tempValue == 0 ? DegreeConverter.getCelsius(kelvinTemp: Double((object.main?.temp)!)) : DegreeConverter.getFahrenheit(kelvinTemp: Double((object.main?.temp)!))
    
    
    cityLabel.text       = String(describing: (object.cityName)!)
    
   
  }
  
  //moving to location selection screen
  @IBAction func tapSelectLocation(_ sender: Any) {
    self.performSegue(withIdentifier: "ShowSearch", sender: self)
  }
  
  //moving to settings screen
  @IBAction func tapSettings(_ sender: Any) {
    self.performSegue(withIdentifier: "ShowSettings", sender: nil)
  }
    
    
    
    //MARK: - TableView DS & Delegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        let Titlelbl = cell.viewWithTag(201) as! UILabel
        let Detaillbl =  cell.viewWithTag(202) as! UILabel
        
        Titlelbl.text = "Hello"
        Detaillbl.text = "World"
        
        
        return cell
    }
  
}

