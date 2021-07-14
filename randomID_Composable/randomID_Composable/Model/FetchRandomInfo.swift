import Foundation
import Alamofire
import Combine

class FetchRandomInfo {
  static var shared = FetchRandomInfo()
  
  public init() {}
  
  let baseURL = "https://jsonplaceholder.typicode.com/todos/"
  
  func fetchData(completion: @escaping (_ result: Result<RandomInfo, NSError>) -> Void) {
    let convertURL = baseURL+"\(randomDataIndex())"
    AF.request(convertURL, method: .get, encoding: JSONEncoding.default)
      .responseJSON { response in
        switch response.result {
        case .success(let value):
          do {
            let data = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
            let randomInfo = try JSONDecoder().decode(RandomInfo.self, from: data)
            completion(Result.success(randomInfo))
          } catch {
            completion(Result.failure(decodingError(convertURL: convertURL, responseValue: value, underlying: error)))
          }
        case .failure(let error):
          completion(Result.failure(networkError(convertURL: convertURL, underlying: error)))
        }
      }
  }
  
  func fetch() -> AnyPublisher<Result<RandomInfo, NSError>, Never> {
    return AnyPublisher<Result<RandomInfo, NSError>, Never>.create({ [unowned self] subscriber in
      self.fetchData(completion: { randomInfo in
        subscriber.send(randomInfo)
        subscriber.send(completion: .finished)
      })
      return AnyCancellable({})
    })
  }
  
  fileprivate func randomDataIndex() -> Int {
    return Int.random(in: 1...100)
  }
}

fileprivate func networkError(convertURL: String, underlying: Error) -> NSError {
  return NSError(domain: "FetchRandomInfo", code: 1, userInfo: [
    "identifier": "FetchRandomInfo.networkError",
    "convertURL": convertURL,
    NSUnderlyingErrorKey: underlying,
  ])
}

fileprivate func decodingError(convertURL: String, responseValue: Any, underlying: Error) -> NSError {
  return NSError(domain: "FetchRandomInfo", code: 2, userInfo: [
    "identifer": "FetchRandomInfo.decodingError",
    "convertURL": convertURL,
    "responseValue": responseValue,
    NSUnderlyingErrorKey: underlying,
  ])
}
