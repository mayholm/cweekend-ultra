//
//  RegisterEmailAccountViewController.swift
//  Ultra
//
//  Created by Pär Majholm on 5/12/18.
//  Copyright © 2018 Pär Majholm. All rights reserved.
//

import UIKit
import Firebase

class RegisterEmailAccountViewController: UIViewController {

    public weak var completionDelegate: RegisterEmailAccountViewControllerCompletionDelegate?
    public var usersDatabaseReference: DatabaseReference?

    @IBOutlet private var emailField: UITextField!
    @IBOutlet private var passwordField: UITextField!
    @IBOutlet private var createAccountButton: UIButton!
    @IBOutlet private var errorLabel: UILabel!

    private var takenEmail: String? = "jopp"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
    }

    @IBAction private func didTapCreateAccountButton(_ sender: UIButton) {
        createAccountButton.setTitle("Creating account ...", for: .normal)
        createAccountButton.isEnabled = false
        usersDatabaseReference?.observeSingleEvent(of: .value) { snapshot in
            guard let email = self.emailField.text,
                let password = self.passwordField.text,
                let users = snapshot.value as? [String: AnyObject] else {
                fatalError()
            }
            // check if user with same email exist
            var userExists = false
            for (_, value) in users {
                guard let user = value as? [String: AnyObject],
                    let email = user["email"] as? String else {
                    fatalError()
                }
                if email == email {
                    userExists = true
                    break
                }
            }
            if !userExists {
                self.usersDatabaseReference?.childByAutoId().setValue(["email": email, "password": password])
                self.completionDelegate?.emailAccountViewControllerDidComplete(self)
            } else {
                self.didFindThatUserExists()
            }
        }
    }

    private func didFindThatUserExists() {
        updateEmailTaken(email: emailField.text ?? "")
    }

    private func updateEmailTaken(email: String) {
        if takenEmail == email {
            errorLabel.isHidden = false
            errorLabel.text = "There is already an account with that email"
        } else {
            errorLabel.isHidden = true
        }
    }
}

extension RegisterEmailAccountViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let oldString = textField.text, let swiftRange = Range(range, in: oldString) else {
            return true
        }
        let newString = oldString.replacingCharacters(in: swiftRange, with: string)
        updateEmailTaken(email: newString)
        return true
    }
}
protocol RegisterEmailAccountViewControllerCompletionDelegate: class {
    func emailAccountViewControllerDidComplete(_: RegisterEmailAccountViewController)
}
