//
//  ConfigLoader.swift
//  WM_SDK
//
//  Created by Qingzhou Wang on 15/5/19.
//

import Foundation

public typealias JSONDictionary = [String: Any?]

private class _ConfigLoaderClass {}

struct ConfigLoader {

    static func load() throws -> JSONDictionary {
        return try loadFile(name: "APIKey")
    }

    private static func loadFile(name: String, withExtension fileType: String = "plist", bundle: Bundle = .main) throws -> JSONDictionary {
        guard let url = bundle.url(forResource: name, withExtension: fileType) ?? Bundle(for: _ConfigLoaderClass.self).url(forResource: name, withExtension: fileType) else {
            print("File not found")
            return [:]
        }

        if let dictionary = NSDictionary(contentsOf: url) as? JSONDictionary {
            return dictionary
        } else {
            // Throw error
            return [:]
        }
    }
}
