//
//  Request.swift
//  swift-pm-samplePackageDescription
//
//  Created by Satoshi Nagasaka on 2017/12/15.
//

import Foundation
import SwiftyJSON

public final class GitHub {

    public enum Result<V,E> {

        case success(V)
        case failure(E)

        var isFailure: Bool {

            if case .failure = self {
                return true
            }
            return false
        }
    }

    public enum Error: Swift.Error {
        case request
        case jsonParse
        case unexpected

        public var localizedDescription: String {
            switch self {
            case .request:
                return "request failed"
            case .jsonParse:
                return "json parsing failed"
            case .unexpected:
                return "unexpected error"
            }
        }
    }

    public static func requestRepositories(q: String) -> Result<[String], GitHub.Error> {

        var result: Result<[String], GitHub.Error>?

        let semaphore = DispatchSemaphore(value: 0)
        let url = URL(string: "https://api.github.com/search/repositories?q=\(q)&sort=stars&order=desc")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in

            guard let data = data else {

                result = .failure(.request)
                return
            }
            do {

                let json = try JSON(data: data)
                let repositories = json["items"].arrayValue.map({ "\($0["name"].stringValue)" })
                result = .success(repositories)
            } catch {

                result = .failure(.jsonParse)
                return
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()

        guard let successResponse = result else {
            return .failure(.unexpected)
        }

        return successResponse
    }
}
