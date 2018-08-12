//
//  ViewController.swift
//  Get Request
//
//  Created by Taha Magdy on 8/12/18.
//  Copyright © 2018 Taha Magdy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sendRequestButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func sendRequestAction(_ sender: Any) {
        
        // Hide the button
        self.sendRequestButton.isHidden = true
        
        // send the request
        getImageFromInternet()

    } // end sendRequestAction
    
    
    func getImageFromInternet() {
        
        let urlString = "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg"
        let imageURL = URL(string: urlString)
        
        // NOTE: request is called task in iOS
        let request_task = URLSession.shared.dataTask(with: imageURL!) {
            (data, response, error) in
            print("Reqeust is DONE")
            
            if error == nil{
                let downloadedImage = UIImage(data: data!)
                
                DispatchQueue.main.async {
                    self.imageView.image = downloadedImage
                }

            } else {
                print("There is an error")
            }
            
        }
        
        // NOTE: DO NOT FORGET TO START THE REQUEST
        request_task.resume()
            

        
        
    } // end getImageFromInternet
    
}








