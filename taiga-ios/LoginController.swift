//
//  ViewController.swift
//  taiga-ios
//
//  Created by Rhonan Carneiro on 08/10/15.
//  Copyright © 2015 Taiga. All rights reserved.
//

import UIKit
import Alamofire

class LoginController: UIViewController {

    let LOGIN_URL = "https://api.taiga.io/api/v1/auth"
    
    @IBOutlet weak var lblUsername: UITextField!
    @IBOutlet weak var lblPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func doLogin(sender: AnyObject) {
        if(lblUsername.hasText() && lblPassword.hasText()){
            Alamofire.request(.POST, LOGIN_URL, parameters : ["type": "normal", "username": lblUsername.text!, "password": lblPassword.text!], encoding: .JSON).responseObject { (response: Response<User, NSError>) in
                let user: User = response.result.value! as User
                if user.authToken != nil {
                    let view: UIViewController = self.storyboard?.instantiateViewControllerWithIdentifier("main") as! MainController
                    (view as! MainController).setUser(user)
                    self.presentViewController(view, animated:true, completion:nil)
                } else {
                    print("TODO: Let the user know that the login failed")
                }
            }
        }
    }

}

