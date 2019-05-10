//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class CurrentWeather: WeatherSummary {

    /** City geo location */
    public var coord: Coord

    public var weather: Weather

    public var main: Main

    /** City ID */
    public var id: Int

    /** City name */
    public var name: String

    /** Internal parameter */
    public var base: String?

    /** Internal parameter */
    public var cod: Int?

    public var sys: Sys?

    public init(coord: Coord, weather: Weather, main: Main, id: Int, name: String, clouds: Clouds? = nil, dt: DateTime? = nil, rain: Rain? = nil, snow: Snow? = nil, wind: Wind? = nil, base: String? = nil, cod: Int? = nil, sys: Sys? = nil) {
        self.coord = coord
        self.weather = weather
        self.main = main
        self.id = id
        self.name = name
        self.base = base
        self.cod = cod
        self.sys = sys
        super.init(clouds: clouds, dt: dt, rain: rain, snow: snow, wind: wind)
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        coord = try container.decode("coord")
        weather = try container.decode("weather")
        main = try container.decode("main")
        id = try container.decode("id")
        name = try container.decode("name")
        base = try container.decodeIfPresent("base")
        cod = try container.decodeIfPresent("cod")
        sys = try container.decodeIfPresent("sys")
        try super.init(from: decoder)
    }

    public override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(coord, forKey: "coord")
        try container.encode(weather, forKey: "weather")
        try container.encode(main, forKey: "main")
        try container.encode(id, forKey: "id")
        try container.encode(name, forKey: "name")
        try container.encodeIfPresent(base, forKey: "base")
        try container.encodeIfPresent(cod, forKey: "cod")
        try container.encodeIfPresent(sys, forKey: "sys")
        try super.encode(to: encoder)
    }

    override public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? CurrentWeather else { return false }
      guard self.coord == object.coord else { return false }
      guard self.weather == object.weather else { return false }
      guard self.main == object.main else { return false }
      guard self.id == object.id else { return false }
      guard self.name == object.name else { return false }
      guard self.base == object.base else { return false }
      guard self.cod == object.cod else { return false }
      guard self.sys == object.sys else { return false }
      return super.isEqual(to: object)
    }
}