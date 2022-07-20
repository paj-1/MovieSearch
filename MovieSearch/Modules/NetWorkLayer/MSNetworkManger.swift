//
//  MSNetworkManger.swift
//  MovieSearch
//

import Foundation

enum MSNetworkManagerError: Error {
    case msBadResponse(URLResponse?)
    case msBadData
    case msBadLocalUrl
    case msNoDataFound
}

enum URLEndPoint : String {
    case searchMovie = "s"
}

let api = "https://www.omdbapi.com/?"
let accessKey = ""

class MSNetworkManger {
    static var shared = MSNetworkManger()
    private var images = NSCache<NSString, NSData>()
    let session: URLSession
    
    private init() {
        let config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    /**
     - Network request to get the data from the API
     */
    
    func getData<T: Decodable>(query: String, endPoint : URLEndPoint, type: T.Type , completion: @escaping (T?, Error?)->Void) {
        
        var urlComponents = URLComponents(string: api)!
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: "ebf5fb72"),
            URLQueryItem(name: endPoint.rawValue, value: query),
            
        ]
        
        let url = urlComponents.url!
        let req = URLRequest(url: url)
        
        
        let task = session.dataTask(with: req) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, MSNetworkManagerError.msBadResponse(response))
                return
            }
            
            guard let data = data else {
                completion(nil, MSNetworkManagerError.msBadData)
                return
            }
            
            do {
                let response1 = try JSONDecoder().decode(T.self, from: data)
                completion(response1, nil)
            } catch _ {
                completion(nil, MSNetworkManagerError.msNoDataFound)
            }
        }
        
        task.resume()
    }
    
    /**
     - Network request to get the image from the API and cache it
     */
    
    private func download(imageURL: URL, completion: @escaping (Data?, Error?) -> (Void)) {
        if let imageData = images.object(forKey: imageURL.absoluteString as NSString) {
            print("using cached images")
            completion(imageData as Data, nil)
            return
        }
        
        let task = session.downloadTask(with: imageURL) { localUrl, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                completion(nil, MSNetworkManagerError.msBadResponse(response))
                return
            }
            
            guard let localUrl = localUrl else {
                completion(nil, MSNetworkManagerError.msBadLocalUrl)
                return
            }
            
            do {
                let data = try Data(contentsOf: localUrl)
                self.images.setObject(data as NSData, forKey: imageURL.absoluteString as NSString)
                completion(data, nil)
            } catch let error {
                completion(nil, error)
            }
        }
        
        task.resume()
    }
    
    func image(imagePath: String, completion: @escaping (Data?, Error?) -> (Void)) {
        let url = URL(string: imagePath)!
        download(imageURL: url, completion: completion)
    }
    
    
}
