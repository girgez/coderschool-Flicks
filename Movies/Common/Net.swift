//
//  Net.swift
//  Movies
//
//  Created by GIRGEZ on 10/11/16.
//  Copyright © 2016 GIRGEZ. All rights reserved.
//

import Foundation
import SystemConfiguration
import  UIKit

class Net {
    // d99e352cd5504b9d1aa0d540e0c594f1
    static let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
    static let urlMoviesPlaying = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
    static let urlMoviesTopRate = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=\(apiKey)")
    
    static func loadMovies(type: Int, callback: @escaping (_ movies: [NSDictionary])->Void) {
        let url: URL?
        
        if type == 1 {
            url = urlMoviesPlaying
        } else {
            url = urlMoviesTopRate
        }
        
        let request = URLRequest(
            url: url!,
            cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData,
            timeoutInterval: 10)
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        let task: URLSessionDataTask =
            session.dataTask(with: request,
                             completionHandler: { (dataOrNil, response, error) in
                                if let data = dataOrNil {
                                    if let responseDictionary = try! JSONSerialization.jsonObject(
                                        with: data, options:[]) as? NSDictionary {
                                        if let movies = responseDictionary["results"] as? [NSDictionary] {
                                            callback(movies)
                                        }
                                    }
                                }
            })
        task.resume()
    }
    
    static func urlSmallPoster(posterPath: String?) -> URL? {
        if posterPath != nil {
            return URL(string: "https://image.tmdb.org/t/p/w75\(posterPath!)")
        }
        
        return nil
    }
    
    static func urlMediumPoster(posterPath: String?) -> URL? {
        if posterPath != nil {
            return URL(string: "https://image.tmdb.org/t/p/w160\(posterPath!)")
        }
        
        return nil
    }
    
    static func urlLargePoster(posterPath: String?) -> URL? {
        if posterPath != nil {
            return URL(string: "https://image.tmdb.org/t/p/w342\(posterPath!)")
        }
        
        return nil
    }
    
    static var isConnectedNetwork: Bool {
        get {
            var zeroAddress = sockaddr_in(sin_len: 0, sin_family: 0, sin_port: 0, sin_addr: in_addr(s_addr: 0), sin_zero: (0, 0, 0, 0, 0, 0, 0, 0))
            zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
            zeroAddress.sin_family = sa_family_t(AF_INET)
            
            let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
                $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                    SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
                }
            }
            
            var flags: SCNetworkReachabilityFlags = SCNetworkReachabilityFlags(rawValue: 0)
            if SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) == false {
                return false
            }
            
            let isReachable = flags == .reachable
            let needsConnection = flags == .connectionRequired
            
            return isReachable && !needsConnection
        }
    }
}
