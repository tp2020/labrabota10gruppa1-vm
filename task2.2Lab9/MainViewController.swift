//
//  MainViewController.swift
//  2.1Lab9
//
//  Created by Ivan on 14.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class MainViewController : UIViewController{
    
       var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
override func viewDidLoad() {
       super.viewDidLoad()
        RegView.isHidden=true;
       // Do any additional setup after loading the view.
       
       
   }
   @IBAction func LoginInputField(_ sender: Any) {
   }
   
@IBAction func ButtonLoginCLicked(_ sender: Any) {
    var searchRequest = NSFetchRequest<User>(entityName: "User");
    
    searchRequest.predicate=NSPredicate(format: "login == %@ && password == %@", LoginAuth.text!, PassAuth.text!);
    
    do{
    let foundUser = try  appDelegate.persistentContainer.viewContext.fetch(searchRequest);
    
    
    
    if(foundUser.count>0)
    {
              performSegue(withIdentifier: "FromStartToMain", sender: self);
    }
    }
    catch{
        print(error);
    }
}

   @IBAction func StetSwitch(_ sender: Any) {
       if(LOginRegSwitch.selectedSegmentIndex==1){
           RegView.isHidden=false;
       }
       else{
           RegView.isHidden=true;
       }
       
   }
   @IBOutlet weak var LoginInput: UITextField!
   @IBAction func RegConfButton(_ sender: Any) {
    
    var searchRequest = NSFetchRequest<User>(entityName: "User");
    
    searchRequest.predicate=NSPredicate(format: "login == %@ && password == %@", LoginAuth.text!, PassAuth.text!);
    
    do{
    var foundUser = try appDelegate.persistentContainer.viewContext.fetch(searchRequest);
    
    
    
    if(foundUser.count == 0)
    {

    
     var     newObject     = NSEntityDescription.insertNewObject(forEntityName: "Users", into: appDelegate.persistentContainer.viewContext) as NSManagedObject
    
    newObject.setValue(LoginReg.text!,     forKey:     "login");
        newObject.setValue(PassReg.text!,     forKey:     "password");
        
    try appDelegate.persistentContainer.viewContext.save();
    
       performSegue(withIdentifier: "FromStartToMain", sender: self);
    }
    }
    catch{
        print(error);
    }
    
   }
   @IBOutlet weak var RegView: UIView!
   @IBOutlet weak var PasswordInputField: UITextField!
   @IBOutlet weak var LoginReg: UITextField!
     @IBOutlet weak var LoginAuth: UITextField!
     @IBOutlet weak var PassAuth: UITextField!
   
   @IBOutlet weak var PassReg: UITextField!
   @IBOutlet weak var EmailReg: UITextField!
   @IBOutlet weak var RepPassReg: UITextField!
   @IBOutlet weak var LOginRegSwitch: UISegmentedControl!
    
    
}
