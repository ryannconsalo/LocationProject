//
//  AddActivityViewController.swift
//  iXLocationProject
//
//  Created by Ryann Consalo on 2017/06/05.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit

class AddActivityViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBAction func cancelActivity(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    var delegate: AddActivityDelegate?
    var newActivity: Activity?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addActivity(_ sender: Any) {
        
        newActivity?.name = nameTextField.text!
        newActivity?.description = descriptionTextView.text
        delegate?.didSaveActivity(activity: newActivity!)
        if (locationTextField != nil && dateTextField != nil && nameTextField != nil && descriptionTextView != nil) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
