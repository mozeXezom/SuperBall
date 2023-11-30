//
//  OnGameService.swift
//  SuperBall
//
//

import Foundation

enum ContributionFinalStatus {
    case url(URL?)
    case error
    case classic
}

final class OnGameService: NSObject, URLSessionTaskDelegate {
    typealias ContributionStatus = (isDistinct: Bool, distinctURL: URL?, errorOccurred: Error?)
    
    private var requestContributed: Bool = false
    private var contributedUrl: URL?
    
    func prepareContributionRequest(forURL url: URL, completion: @escaping (ContributionStatus) -> Void) {
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = 5
        
        let session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: nil)
        
        var request = URLRequest(url: url)
        request.httpMethod = "HEAD"
        
        let task = session.dataTask(with: request) { [weak self] _, response, error in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                if let error = error {
                    completion((false, nil, error))
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse,
                   (300...399).contains(httpResponse.statusCode) {
                    self.handleSuccessResponse(httpResponse)
                    completion((true, self.contributedUrl, nil))
                } else {
                    completion((false, nil, nil))
                }
            }
        }
        task.resume()
    }
    
    private func handleSuccessResponse(_ httpResponse: HTTPURLResponse) {
        requestContributed = true
        contributedUrl = httpResponse.url
    }
}

extension OnGameService {
    func urlSession(_ session: URLSession, task: URLSessionTask, willPerformHTTPRedirection response: HTTPURLResponse, newRequest request: URLRequest, completionHandler: @escaping (URLRequest?) -> Void) {
        handleSuccessResponse(response)
        completionHandler(nil)
    }
}
