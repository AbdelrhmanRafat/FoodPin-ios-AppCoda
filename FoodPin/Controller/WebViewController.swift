//
//  WebViewController.swift
//  FoodPin
//
//  Created by Macbook on 05/12/2020.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
   
    @IBOutlet var webview: WKWebView!
    
    var targetUrl = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        if let url = URL(string: targetUrl){
            let request = URLRequest(url: url)
            webview.load(request)
        }
        // Do any additional setup after loading the view.
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
