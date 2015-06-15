//
//  RegisterPickNameViewController.swift
//  Yep
//
//  Created by NIX on 15/3/16.
//  Copyright (c) 2015年 Catch Inc. All rights reserved.
//

import UIKit

class RegisterPickNameViewController: UIViewController {

    @IBOutlet weak var pickNamePromptLabel: UILabel!

    @IBOutlet weak var nameTextField: UnderLineTextField!
    
    @IBOutlet weak var nextButton: BorderButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = NSLocalizedString("Sign up", comment: "")

        pickNamePromptLabel.text = NSLocalizedString("What's your name?", comment: "")
        
        nextButton.setTitle(NSLocalizedString("Next", comment: ""), forState: .Normal)
        nextButton.backgroundColor = UIColor.yepTintColor()

        nameTextField.delegate = self
        nameTextField.addTarget(self, action: "textFieldDidChange:", forControlEvents: .EditingChanged)
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        nextButton.enabled = false
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        nameTextField.becomeFirstResponder()
    }

    // MARK: Actions

    func textFieldDidChange(textField: UITextField) {
        nextButton.enabled = !textField.text.isEmpty
    }

    @IBAction func back(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func next(sender: UIButton) {
        showRegisterPickMobile()
    }

    private func showRegisterPickMobile() {
        let nickname = nameTextField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet());
        YepUserDefaults.nickname.value = nickname

        performSegueWithIdentifier("showRegisterPickMobile", sender: nil)
    }
}

extension RegisterPickNameViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if !textField.text.isEmpty {
            showRegisterPickMobile()
        }

        return true
    }
}