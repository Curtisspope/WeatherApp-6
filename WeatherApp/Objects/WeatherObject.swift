//
//  WeatherObject.swift
//
//  Created by CPOPE on 08/01/2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

//mappable weather object
//all vars are made according JSON from server
//serialization keys are used to rename fields for more convenient usage

public final class WeatherObject: Mappable {

  private struct SerializationKeys {
    static let main       = "main"
    static let cityName   = "name"
    static let id         = "id"
    static let weather    = "weather"
    static let dt         = "dt"
    static let base       = "base"
    static let sys        = "sys"
    static let cod        = "cod"
    static let visibility = "visibility"
    static let wind       = "wind"
  }

  public var main       : Main?
  public var cityName   : String?
  public var id         : Int?
  public var weather    : [Weather]?
  public var dt         : Int?
  public var base       : String?
  public var sys        : Sys?
  public var cod        : Int?
  public var visibility : Int?
  public var wind       : Wind?

  public required init?(map: Map) {}

  public func mapping(map: Map) {
    main       <- map[SerializationKeys.main]
    cityName   <- map[SerializationKeys.cityName]
    id         <- map[SerializationKeys.id]
    weather    <- map[SerializationKeys.weather]
    dt         <- map[SerializationKeys.dt]
    base       <- map[SerializationKeys.base]
    sys        <- map[SerializationKeys.sys]
    cod        <- map[SerializationKeys.cod]
    visibility <- map[SerializationKeys.visibility]
    wind       <- map[SerializationKeys.wind]
  }

}

public final class Main: Mappable {
  
  private struct SerializationKeys {
    static let humidity = "humidity"
    static let tempMin  = "temp_min"
    static let tempMax  = "temp_max"
    static let temp     = "temp"
    static let pressure = "pressure"
  }
  
  public var humidity : Int?
  public var tempMin  : Float?
  public var tempMax  : Float?
  public var temp     : Float?
  public var pressure : Int?
  
  public required init?(map: Map) {}
    
  public func mapping(map: Map) {
    humidity  <- map[SerializationKeys.humidity]
    tempMin   <- map[SerializationKeys.tempMin]
    tempMax   <- map[SerializationKeys.tempMax]
    temp      <- map[SerializationKeys.temp]
    pressure  <- map[SerializationKeys.pressure]
  }
  
}

public final class Sys: Mappable {
  
  private struct SerializationKeys {
    static let sunset  = "sunset"
    static let sunrise = "sunrise"
    static let country = "country"
  }
  
  public var sunset  : Int?
  public var sunrise : Int?
  public var country : String?
  
  public required init?(map: Map) {}

  public func mapping(map: Map) {
    sunset  <- map[SerializationKeys.sunset]
    sunrise <- map[SerializationKeys.sunrise]
    country <- map[SerializationKeys.country]
  }
  
}

public final class Weather: Mappable {
  
  private struct SerializationKeys {
    static let icon             = "icon"
    static let header           = "main"
    static let description      = "description"
  }
  
  public var icon: String?
  public var header: String?
  public var description: String?
  
  public required init?(map: Map) {}
  
  public func mapping(map: Map) {
    icon        <- map[SerializationKeys.icon]
    header      <- map[SerializationKeys.header]
    description <- map[SerializationKeys.description]
  }
  
}

public final class Wind: Mappable {
  
  private struct SerializationKeys {
    static let speed = "speed"
    static let deg   = "deg"
  }
  
  public var speed : Float?
  public var deg   : Int?
  
  public required init?(map: Map) {}
  
  public func mapping(map: Map) {
    speed <- map[SerializationKeys.speed]
    deg   <- map[SerializationKeys.deg]
  }
  
}
