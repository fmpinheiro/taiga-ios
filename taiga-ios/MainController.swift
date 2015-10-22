//
//  MainController.swift
//  taiga-ios
//
//  Created by Rhonan Carneiro on 21/10/15.
//  Copyright © 2015 Taiga. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("TODO: List projects using this auth token: \(user.authToken!) 😎")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func setUser(user: User){
        self.user = user
    }
}
    