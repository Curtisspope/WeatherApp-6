import UIKit

struct todoObject {
    var Time:String?
    var Place:String?
    var Event:String?
}


class MainController: BaseController ,UITableViewDelegate,UITableViewDataSource{
 
    

  
  //connected properties from storyboard
  @IBOutlet private weak var weatherTypeIconImageView: UIImageView!

  @IBOutlet private weak var weatherTempLabel: UILabel!
    
     @IBOutlet private weak var weatherHeaderLabel: UILabel!

  @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet weak var weatherHolderView: UIView!
    
    
    @IBOutlet weak var todoTableView: UITableView!
    
    
    //misc properties
    
    var todoArray = [todoObject]()
    
    

  
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
        setupArray()
        todoTableView.reloadData()
        
    }
    // adding those cool rounded corner to the Temp box
    adjustViewCorners()
  }
  
    func setupArray(){
        //adding things to the array so that we have things to do, removing them all first
        if todoArray.count == 0{
        todoArray.append(todoObject(Time: "12:00 PM", Place: "Pier 39", Event: "Kayaking"))
        todoArray.append(todoObject(Time: "1:00 PM", Place: "Downtown San Jose", Event: "Rock N Roll Run 2018"))
        todoArray.append(todoObject(Time: "3:00 PM", Place: "Fremont,CA", Event: "Hike Mission Peak"))
        todoArray.append(todoObject(Time: "5:00 PM", Place: "San Jose Museum of Art", Event: "Museum Tour"))
        
        }
    }
    
    func adjustViewCorners(){
        //add rounded corners
        weatherHolderView.layer.cornerRadius = 12
        
        
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
    
        weatherHeaderLabel.text = object.weather![0].header
    let weatherDegree:String = self.tempValue == 0 ? DegreeConverter.getCelsius(kelvinTemp: Double((object.main?.temp)!)) : DegreeConverter.getFahrenheit(kelvinTemp: Double((object.main?.temp)!))
    
    
    weatherTempLabel.text = "\(weatherDegree)°"
    
    
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
     return todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        let Titlelbl = cell.viewWithTag(201) as! UILabel
        let Detaillbl =  cell.viewWithTag(202) as! UILabel
        
        
        let temptodoObject:todoObject = todoArray[indexPath.row]
        
        Titlelbl.text = temptodoObject.Event
            
        Detaillbl.text = "\(String(describing: temptodoObject.Place!)) at \(String(describing:  temptodoObject.Time!))"
        
        
        return cell
    }
  
}

