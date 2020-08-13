//
//  HTTPClient.swift
//  BNetNote
//
//  Created by Alexander on 13.08.2020.
//

import Alamofire
import Foundation

enum HTTPErrors: Error {
    case parsingError
}

class HTTPClient {
    func post<T: Decodable>(url: String,
                            headers: HTTPHeaders?,
                            parameters: [String: Any]?,
                            completionHandler: @escaping(Result<T, HTTPErrors>) -> Void) {
        AF.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .responseData { data in
                switch data.result {
                case .failure(let error):
                    print(error)
                case .success(let responseData):
                    do {
                        let jsonDecoder = JSONDecoder()
                        let decodedResponseData = try jsonDecoder.decode(T.self, from: responseData)
                        completionHandler(.success(decodedResponseData))
                    } catch (let err) {
                        print(err)
                        completionHandler(.failure(.parsingError))
                    }
                }
        }
    }
}
