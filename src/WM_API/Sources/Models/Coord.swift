//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Coord: APIModel {

    public var lon: Double

    public var lat: Double

    public init(lon: Double, lat: Double) {
        self.lon = lon
        self.lat = lat
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        lon = try container.decode("lon")
        lat = try container.decode("lat")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encode(lon, forKey: "lon")
        try container.encode(lat, forKey: "lat")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Coord else { return false }
      guard self.lon == object.lon else { return false }
      guard self.lat == object.lat else { return false }
      return true
    }

    public static func == (lhs: Coord, rhs: Coord) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
