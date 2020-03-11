//
//  ViewController.swift
//  MapClient
//
//  Created by zino-mac on 2020/03/11.
//  Copyright © 2020 zino-mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var t_lat: UITextField!
    @IBOutlet weak var t_lng: UITextField!
    @IBOutlet weak var t_content: UITextField!

    
    //HTTP POST 요청을 시도하자!!
    @IBAction func btnClick(_ sender: Any) {
        
        let url = URL(string: "http://localhost:9999/regist")
        
        var request = URLRequest(url: url!)
        
        //딕셔너리
        let params = [
          "lati":t_lat.text!,
          "longi":t_lng.text!,
          "content":t_content.text!
        ]
        
          request.httpMethod="post"
        
          request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
          request.addValue("application/json", forHTTPHeaderField: "Accept")

          do{
          request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
          }catch{
              print(error)
          }
          
          //비동기 요청
          let urlSession = URLSession.shared
        
          let task = urlSession.dataTask(with: request, completionHandler: {
              (data, response,error) in
          })
          
          task.resume()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

