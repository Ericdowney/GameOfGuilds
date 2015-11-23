//
//  AddGuildViewController.swift
//  Guilds
//
//  Created by Downey, Eric on 11/22/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import UIKit

public class AddGuildViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var guildLogic: GuildsViewLogic?
    
    @IBOutlet weak var guildImage: ImageView!
    @IBOutlet weak var guildName: UITextField!
    @IBOutlet weak var guildDescription: UITextView!
    
    let imagePicker = UIImagePickerController()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if self.guildLogic == nil {
            let wrapper = (UIApplication.sharedApplication().delegate as! AppDelegate).parseWrapper
            self.guildLogic = GuildsViewLogic(wrapper: wrapper)
        }
        self.navigationItem.title = "Create New Guild"
        self.configureImagePicker()
    }
    
    public override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.configureGestures()
    }
    
    public override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.removeGestures()
    }
    
    // MARK: - Configure
    
    private func configureGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: "usePhoto:")
        self.guildImage.addGestureRecognizer(tapGesture)
    }
    
    private func removeGestures() {
        self.guildImage.removeGestureRecognizer(self.guildImage.gestureRecognizers![0])
    }
    
    private func configureImagePicker() {
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.allowsEditing = false
    }
    
    // MARK: - Actions
    
    func usePhoto(sender: AnyObject) {
        self.presentViewController(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func createGuild(sender: AnyObject) {
        self.guildLogic?.createGuild(self.guildName.text!, description: self.guildDescription.text!, image: self.guildImage.image!) {
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    // MARK: - Image Picker
    
    public func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.guildImage.image = image.imageWithImage(scaledToSize: CGSize(width: 300, height: 300))
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}