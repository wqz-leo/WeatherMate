//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class ForecastSummary: APIModel {

    public var city: City?

    /** Number of lines returned by this API call */
    public var cnt: Int?

    public var cod: String?

    public var message: Double?

    public init(city: City? = nil, cnt: Int? = nil, cod: String? = nil, message: Double? = nil) {
        self.city = city
        self.cnt = cnt
        self.cod = cod
        self.message = message
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        city = try container.decodeIfPresent("city")
        cnt = try container.decodeIfPresent("cnt")
        cod = try container.decodeIfPresent("cod")
        message = try container.decodeIfPresent("message")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(city, forKey: "city")
        try container.encodeIfPresent(cnt, forKey: "cnt")
        try container.encodeIfPresent(cod, forKey: "cod")
        try container.encodeIfPresent(message, forKey: "message")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? ForecastSummary else { return false }
      guard self.city == object.city else { return false }
      guard self.cnt == object.cnt else { return false }
      guard self.cod == object.cod else { return false }
      guard self.message == object.message else { return false }
      return true
    }

    public static func == (lhs: ForecastSummary, rhs: ForecastSummary) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
