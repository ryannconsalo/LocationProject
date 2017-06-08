//
//  AddActivityViewController.swift
//  iXLocationProject
//
//  Created by Ryann Consalo on 2017/06/05.
//  Copyright © 2017 Ryann Consalo. All rights reserved.
//

import UIKit
import Alamofire

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
    var newActivity : Activity?
    
    
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
        
         Alamofire.request("https://ixlocationproject.firebaseio.com/activities.json", method: .post, parameters: newActivity?.toJSON(), encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case.success(let _):
                self.delegate?.didSaveActivity(activity: self.newActivity!)
                self.dismiss(animated: true, completion: nil)
            case .failure: break
            }
        }
        
        
        
        if (nameTextField.text?.isEmpty)! {
            let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            let alertController = UIAlertController(title: "Error", message: "Please enter some text", preferredStyle: .alert)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        else {
            let newActivity = Activity(name: nameTextField.text, description: descriptionTextView.text)
            delegate?.didSaveActivity(activity: newActivity!)
            self.dismiss(animated: true, completion: nil)
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
