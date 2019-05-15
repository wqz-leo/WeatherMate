//
//  Config.swift
//  WM_SDK
//
//  Created by Qingzhou Wang on 11/5/19.
//

import Foundation

public struct Config: Decodable {

    public var appid: String

    enum CodingKeys: CodingKey {
        case appid
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        appid = try container.decode(String.self, forKey: .appid)
    }

    public static func load() -> Config? {
        do {
            let dictionary = try ConfigLoader.load()
            let data = try JSONSerialization.data(withJSONObject: dictionary, options: [])
            return try JSONDecoder().decode(Config.self, from: data)
        } catch {
            print("Error loading config")
            return nil
        }
    }
}
