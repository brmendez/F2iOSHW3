//
//  DetailViewController.swift
//  groupPractice2
//
//  Created by Brian Mendez on 8/18/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBAction func photoButton(sender: UIButton) {
        
        var pickerController = UIImagePickerController
        info[UIImagePickerControllerOriginalImage]
        
//        resignFirstResponder()
    }
    
    
    
    var personSegue : Person!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.firstNameTextField.text = self.personSegue.firstName
        self.lastNameTextField.text = self.personSegue.lastName
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.personSegue.firstName = self.firstNameTextField.text
        self.personSegue.lastName = self.lastNameTextField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
