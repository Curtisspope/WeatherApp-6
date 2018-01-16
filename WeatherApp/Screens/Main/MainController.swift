import UIKit

class MainController: BaseController {

  
  //connected properties from storyboard
  @IBOutlet private weak var weatherTypeIconImageView: UIImageView!
  @IBOutlet private weak var weatherHeaderLabel: UILabel!
  @IBOutlet private weak var weatherDescriptionLabel: UILabel!
  @IBOutlet private weak var weatherTempLabel: UILabel!
  @IBOutlet private weak var weatherTempMeasureImageView: UIImageView!
  @IBOutlet private weak var weatherTempRangeLabel: UILabel!
  @IBOutlet private weak var weatherTempRangeMeasureImageView: UIImageView!
  //@IBOutlet private weak var humidityLabel: UILabel!
 // @IBOutlet private weak var pressureLabel: UILabel!
 // @IBOutlet private weak var windSpeedLabel: UILabel!
  //@IBOutlet private weak var winHeadingLabel: UILabel!
  @IBOutlet private weak var sunriseLabel: UILabel!
  @IBOutlet private weak var sunsetLabel: UILabel!
  @IBOutlet private weak var cityLabel: UILabel!
  @IBOutlet private weak var countryLabel: UILabel!
  
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
    
   // weatherHeaderLabel.text = object.weather![0].header
   // weatherDescriptionLabel.text = object.weather![0].description
    
    weatherTempLabel.text = self.tempValue == 0 ? DegreeConverter.getCelsius(kelvinTemp: Double((object.main?.temp)!)) : DegreeConverter.getFahrenheit(kelvinTemp: Double((object.main?.temp)!))
    
    //weatherTempMeasureImageView.image = self.tempValue == 0 ? UIImage(named: "interface/celcius") : UIImage(named: "interface/fahreinheit")
   // weatherTempRangeMeasureImageView.image = self.tempValue == 0 ? UIImage(named: "interface/celcius") : UIImage(named: "interface/fahreinheit")

    //weatherTempRangeLabel.text = self.tempValue == 0 ? DegreeConverter.getCelsius(kelvinTemp: Double((object.main?.tempMin)!)) + "   " + DegreeConverter.getCelsius(kelvinTemp: Double((object.main?.tempMax)!)) : DegreeConverter.getFahrenheit(kelvinTemp: Double((object.main?.tempMin)!)) + "   " + DegreeConverter.getFahrenheit(kelvinTemp: Double((object.main?.tempMax)!))
    
//    humidityLabel.text   = String(describing: (object.main?.humidity)!) + "%"
//    pressureLabel.text   = String(describing: (object.main?.pressure)!) + " Pressure hPa"
//    windSpeedLabel.text  = self.measureValue == 0 ? String(describing: (object.wind?.speed)!) + " m/s" : DistanceConverter.meterPerSecondToMilesPerHour(value: (object.wind?.speed)!) + " Wind Speed mph"
//    winHeadingLabel.text = String(describing: (object.wind?.deg)!) + " °"
    
    //sunriseLabe
//    sunriseLabel.text    = self.measureValue == 0 ? TimeConverter.getTime24h(unixTime: (object.sys?.sunrise)!) : TimeConverter.getTimeAMPM(unixTime: (object.sys?.sunrise)!)
//    sunsetLabel.text     = self.measureValue == 0 ? TimeConverter.getTime24h(unixTime: (object.sys?.sunset)!) : TimeConverter.getTimeAMPM(unixTime: (object.sys?.sunset)!)
//
    cityLabel.text       = String(describing: (object.cityName)!)
    
    //print(object.sys.to)
//    countryLabel.text    = CountryHelper.getCountryName(isoCode: (object.sys?.country)!)
  }
  
  //moving to location selection screen
  @IBAction func tapSelectLocation(_ sender: Any) {
    self.performSegue(withIdentifier: "ShowSearch", sender: self)
  }
  
  //moving to settings screen
  @IBAction func tapSettings(_ sender: Any) {
    self.performSegue(withIdentifier: "ShowSettings", sender: nil)
  }
  
}

