//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

public class Weather: APIModel {

    /** Weather condition within the group */
    public var description: String?

    /** Weather icon id */
    public var icon: String?

    /** Weather condition id */
    public var id: Int?

    /** Group of weather parameters (Rain, Snow, Extreme etc.) */
    public var main: String?

    public init(description: String? = nil, icon: String? = nil, id: Int? = nil, main: String? = nil) {
        self.description = description
        self.icon = icon
        self.id = id
        self.main = main
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: StringCodingKey.self)

        description = try container.decodeIfPresent("description")
        icon = try container.decodeIfPresent("icon")
        id = try container.decodeIfPresent("id")
        main = try container.decodeIfPresent("main")
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: StringCodingKey.self)

        try container.encodeIfPresent(description, forKey: "description")
        try container.encodeIfPresent(icon, forKey: "icon")
        try container.encodeIfPresent(id, forKey: "id")
        try container.encodeIfPresent(main, forKey: "main")
    }

    public func isEqual(to object: Any?) -> Bool {
      guard let object = object as? Weather else { return false }
      guard self.description == object.description else { return false }
      guard self.icon == object.icon else { return false }
      guard self.id == object.id else { return false }
      guard self.main == object.main else { return false }
      return true
    }

    public static func == (lhs: Weather, rhs: Weather) -> Bool {
        return lhs.isEqual(to: rhs)
    }
}
