//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension WMAPI.Weather {

    /** Get weather data based on different query */
    public enum GetCurrentWeather {

        public static let service = APIService<Response>(id: "getCurrentWeather", tag: "weather", method: "GET", path: "/weather", hasBody: false)

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** API key */
                public var appid: String

                /** city name and country code divided by comma, use ISO 3166 country codes */
                public var q: String?

                /** You can call by city ID. API responds with exact result.
List of city ID city.list.json.gz can be downloaded here http://bulk.openweathermap.org/sample/
 */
                public var id: String?

                /** Latitude of the location */
                public var lat: String?

                /** Longitude of the location */
                public var lon: String?

                /** Zip code. Please note if country is not specified then the search works for USA as a default. */
                public var zip: String?

                /** You can use lang parameter to get the output in your language. */
                public var lang: String?

                public init(appid: String, q: String? = nil, id: String? = nil, lat: String? = nil, lon: String? = nil, zip: String? = nil, lang: String? = nil) {
                    self.appid = appid
                    self.q = q
                    self.id = id
                    self.lat = lat
                    self.lon = lon
                    self.zip = zip
                    self.lang = lang
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetCurrentWeather.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(appid: String, q: String? = nil, id: String? = nil, lat: String? = nil, lon: String? = nil, zip: String? = nil, lang: String? = nil) {
                let options = Options(appid: appid, q: q, id: id, lat: lat, lon: lon, zip: zip, lang: lang)
                self.init(options: options)
            }

            public override var queryParameters: [String: Any] {
                var params: [String: Any] = [:]
                params["appid"] = options.appid
                if let q = options.q {
                  params["q"] = q
                }
                if let id = options.id {
                  params["id"] = id
                }
                if let lat = options.lat {
                  params["lat"] = lat
                }
                if let lon = options.lon {
                  params["lon"] = lon
                }
                if let zip = options.zip {
                  params["zip"] = zip
                }
                if let lang = options.lang {
                  params["lang"] = lang
                }
                return params
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = CurrentWeather

            /** OK */
            case status200(CurrentWeather)

            /** Invalid api key. */
            case status401(ServiceError)

            /** Not found. */
            case status404(ServiceError)

            /** Service error. */
            case defaultResponse(statusCode: Int, ServiceError)

            public var success: CurrentWeather? {
                switch self {
                case .status200(let response): return response
                default: return nil
                }
            }

            public var failure: ServiceError? {
                switch self {
                case .status401(let response): return response
                case .status404(let response): return response
                case .defaultResponse(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<CurrentWeather, ServiceError> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status200(let response): return response
                case .status401(let response): return response
                case .status404(let response): return response
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .status401: return 401
                case .status404: return 404
                case .defaultResponse(let statusCode, _): return statusCode
                }
            }

            public var successful: Bool {
                switch self {
                case .status200: return true
                case .status401: return false
                case .status404: return false
                case .defaultResponse: return false
                }
            }

            public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
                switch statusCode {
                case 200: self = try .status200(decoder.decode(CurrentWeather.self, from: data))
                case 401: self = try .status401(decoder.decode(ServiceError.self, from: data))
                case 404: self = try .status404(decoder.decode(ServiceError.self, from: data))
                default: self = try .defaultResponse(statusCode: statusCode, decoder.decode(ServiceError.self, from: data))
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
