//
//  DetailViewController.swift
//  groupPractice2
//
//  Created by Brian Mendez on 8/18/14.
//  Copyright (c) 2014 Brian Mendez. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,  UINavigationControllerDelegate{
    
    var personSegue : Person!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!

//MARK: Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileImage.image = UIImage(named: "turtleDefault.jpg")
        self.firstNameTextField.text = self.personSegue.firstName
        self.lastNameTextField.text = self.personSegue.lastName
        }
    
    override func viewWillAppear(animated: Bool) {
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.personSegue.firstName = self.firstNameTextField.text
        self.personSegue.lastName = self.lastNameTextField.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    MARK: Camera
    @IBAction func selectPicture(sender: AnyObject) {
        self.revealCamera()
    }
    
    
    func revealCamera(){
        var imagePickerController = UIImagePickerController()
        
        
        imagePickerController.delegate = self
        //checks for camera
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.allowsEditing = true
        
        //shows camera view
        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
//MARK: Image Picker
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        var editedImage = info[UIImagePickerControllerEditedImage] as UIImage
        self.personSegue.image = editedImage
        self.profileImage.image = editedImage
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController!) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }

}
