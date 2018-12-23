//
//  ViewController.swift
//  MemeMe v1.0
//
//  Created by Muhammad El-Badawy on 12/17/18.
//  Copyright © 2018 Muhammad El-Badawy. All rights reserved.
//

import UIKit

struct Meme {
    var topText:String
    var bottomText:String
    var originalImage:UIImage
    var memedImage:UIImage
}
class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate,UITextFieldDelegate {

    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var bottomTextfield: UITextField!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    let memeTextDelegate=MemeTextDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        bottomTextfield.delegate = memeTextDelegate
        topTextField.delegate = memeTextDelegate
        
        initTextField()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        unsubscribeFromKeyboardNotifications()
    }
    

    func initTextField(){
        topTextField.text="TOP"
        topTextField.textAlignment = .center
        
        bottomTextfield.text="BOTTOM"
        bottomTextfield.textAlignment = .center
        
        
        let memeTextAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: UIColor.black /* TODO: fill in appropriate UIColor */,
            NSAttributedString.Key.foregroundColor: UIColor.white /* TODO: fill in appropriate UIColor */,
            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
            NSAttributedString.Key.strokeWidth: -2.0 /* TODO: fill in appropriate Float */
        ]
        
        topTextField.defaultTextAttributes = memeTextAttributes
        bottomTextfield.defaultTextAttributes = memeTextAttributes
    }
    
    @IBAction func pickImageFromAlbum(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageView.image = image
        saveButton.isEnabled = true
        dismiss(animated: true, completion: nil)
        

    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickFromCamera(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @objc func subscribeToKeyboardNotifications() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    func unsubscribeFromKeyboardNotifications() {
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification:Notification) {
        
        view.frame.origin.y -= getKeyboardHeight(notification)
    }
    
    @objc func keyboardWillHide(_ notification:Notification) {
        view.frame.origin.y = 0
    }
    func getKeyboardHeight(_ notification:Notification) -> CGFloat {
        
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue // of CGRect
        return keyboardSize.cgRectValue.height
    }
    
    func generateMemedImage() -> UIImage {
        
        // Hide toolbar and navbar
        toolBar.isHidden = true
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        // Show toolbar and navbar
        toolBar.isHidden = false
        
        return memedImage
    }
    
    
    @IBAction func saveMemeImage(_ sender: Any) {
        let memedImage=generateMemedImage()
        let meme = Meme(topText: topTextField.text!, bottomText: bottomTextfield.text!, originalImage: imageView.image!, memedImage: memedImage)
        
        let controller = UIActivityViewController(activityItems: [meme] , applicationActivities: nil)
        present(controller,animated: true,completion: nil)
    }
    
}

