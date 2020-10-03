//
//  TrailerViewController.swift
//  Flix Codepath
//
//  Created by John Jakobsen on 10/3/20.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController, WKUIDelegate {
    var movieID: String!
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webView.uiDelegate = self
        let url = URL(string: "https://api.themoviedb.org/3/movie/" + String(movieID) + "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print("ERROR:" + error.localizedDescription)
           } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            print(dataDictionary)
            let results = dataDictionary["results"] as! [[String: Any]]
            let mytID = results[0]["key"] as! String
            let movieURL = URL(string: "https://www.youtube.com/watch?v=" + mytID)
            print(movieURL)
            let movieReq = URLRequest(url: movieURL!)
            self.webView.load(movieReq)
           }
        }
        task.resume()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
