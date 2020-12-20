//
//  BookSerachManager.swift
//  BookScanner
//
//  Created by Tharindu Darshana on 18/12/20.
//

import Foundation


class BooksSearchManager {
    
    func getBookInfo(isbn: String, completion: @escaping (Books) -> Void){
        /*
         Configure session, choose between:
            * defautSessionConfiguration
            * ephemeralSessionConfiguration
            * backgroundSessionConfigurationWithIdentifire
         And set session-wide properties, such as: HTTPAdditionalHeaders,
         HTTPCookieAcceptPolicy, requestCachePolicy or timeoutIntervalForRequest.
         */
        let sessionConfig = URLSessionConfiguration.default
        
        /* Create session, and optionally set a URLSessionDeligate */
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
        
        /*Create the Request:
            ISBN (GET https://www.google.com/books/vi/volumes)
        */
        guard var url = URL(string: "https://www.google.com/books/vi/volumes") else {return}
        let urlParams = [
            "q": "isbn:\(isbn)"
        ]
        url = url.appendingQueryParameters(urlParams)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        /*Start a new Task*/
        
        let task = session.dataTask(with: request, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) -> Void in
            if(error == nil){
                // Success
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session taask succeeded: HTTP \(statusCode)")
                
                // JSON parsing
                guard let jsonData = data else {
                    return
                }
                
                do {
                    let bookData = try JSONDecoder().decode(Books.self, from: jsonData)
                    completion(bookData)
                } catch{
                    print(error)
                }
                
            } else {
                // Faliure
                print("URL Session task failed. %@", error!.localizedDescription)
            }
        })
        
        task.resume()
        session.finishTasksAndInvalidate()
    }
}
