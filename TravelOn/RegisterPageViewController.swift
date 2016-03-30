//
//  RegisterPageViewController.swift
//  TravelOn
//
//  Created by Hursat Demir on 24.03.2016.
//  Copyright © 2016 Demir LLC. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var txtUserEmail: UITextField!
    @IBOutlet weak var txtUserPassword: UITextField!
    @IBOutlet weak var txtRepeatPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        
        let newUserEmail = txtUserEmail.text;
        let newUserPassword = txtUserPassword.text;
        let repeatPassword = txtRepeatPassword.text;
        
        if(!newUserEmail!.isEmpty && !newUserPassword!.isEmpty &&
            !repeatPassword!.isEmpty)
        {
            if(newUserPassword == repeatPassword){
                
                //bilgileri kaydet
                
                let dbHandler: DatabaseHandler = DatabaseHandler();
                
                dbHandler.registerUser(newUserEmail!, newUserPassword: newUserPassword!);
                
                let alert = UIAlertController(title: "Success", message: "Your account has been created. Please Login", preferredStyle: UIAlertControllerStyle.Alert);
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default){ action in
                    self.dismissViewControllerAnimated(true, completion: nil);
                };
                
                alert.addAction(okAction);
                
                self.presentViewController(alert, animated: true, completion: nil);
                return;

                
            }else{
                let alert = UIAlertController(title: "Incorrect", message: "Passwords do not match", preferredStyle: UIAlertControllerStyle.Alert);
                
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
