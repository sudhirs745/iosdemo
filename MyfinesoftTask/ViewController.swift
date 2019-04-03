//
//  ViewController.swift
//  MyfinesoftTask
//
//  Created by Karthik on 4/1/19.
//  Copyright © 2019 Slyly Infotech. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var userNameTxtField: UITextField!
    @IBOutlet var passwordTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //Mark:- Alert Controller Function
    func alertcontroller(title:String,message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
        }
        alert.addAction(ok)
        self.present(alert, animated: false, completion: nil)
    }
    
    
    //Mark:- Validation Function for Email
    func emailValidation(_ checkString: String) -> Bool {
        
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: checkString)
        return result
        
    }


    @IBAction func loginBtnClickked(_ sender: UIButton) {
        
        if emailValidation(userNameTxtField.text!) {
            
            if passwordTxtField.text != "" {
                
                var params = String()
                params = params.appendingFormat("username=%@&password=%@", userNameTxtField.text!,passwordTxtField.text!)
            
                    let url = "http://203.76.249.210:4700/talentcruz-api/appuser/login"
                    let urlObj = URL(string: url)
                    var request = URLRequest(url: urlObj!)
                    request.httpMethod = "POST"
                    request.httpBody = params.data(using: .utf8)
                
                let download = URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
                    
                    DispatchQueue.main.async(execute: {
                    
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print(json)
                        
                        self.alertcontroller(title: "Login ", message: "Successfully logined")

                    }
                        
                    catch {
                        
                    }
                        
                    })
                    
                }
                
                download.resume()
                    
            
            
                
            }
            else {
                alertcontroller(title: "Oops", message: "Please enter password Text")
            }
            
        }
        else {
            alertcontroller(title: "Oops", message: "Please enter Valid Email address")
        }
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        userNameTxtField.resignFirstResponder()
        passwordTxtField.resignFirstResponder()
        
        return true
        
    }
    
    
    

}

