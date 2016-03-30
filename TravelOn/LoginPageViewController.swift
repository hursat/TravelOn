//
//  LoginPageViewController.swift
//  TravelOn
//
//  Created by Hursat Demir on 24.03.2016.
//  Copyright © 2016 Demir LLC. All rights reserved.
//

import UIKit

class LoginPageViewController: UIViewController {

    @IBOutlet weak var txtUserEmail: UITextField!
    @IBOutlet weak var txtUserPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(sender: UIButton) {
        
        let userEmail = txtUserEmail.text;
        let userPass = txtUserPass.text;
        
        //kontrol yap
        if(!userEmail!.isEmpty && !userPass!.isEmpty){
            
            let dbHandler: DatabaseHandler = DatabaseHandler();
            let result = dbHandler.userLogin(userEmail!, userPassword: userPass!);
            
            if(result){
                //diğer sayfaya geç
            }else{
                let alert = UIAlertController(title: "Incorrect", message: "You have entered incorrect E-Mail or Password.", preferredStyle: UIAlertControllerStyle.Alert);
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil);
                
                alert.addAction(okAction);
                
                self.presentViewController(alert, animated: true, completion: nil);
                return;
            }
        }else{
            
            let alert = UIAlertController(title: "Incorrect", message: "Please fill all the required fields", preferredStyle: UIAlertControllerStyle.Alert);
            
            let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil);
            
            alert.addAction(okAction);
            
            self.presentViewController(alert, animated: true, completion: nil);
            return;
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
