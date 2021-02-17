//
//  File.swift
//  
//
//  Created by Daniel Gallego Peralta on 16/2/21.
//

import UIKit
import DGPLibrary

internal class DGPRegisterViewController: UIViewController {
    
    //MARK: - Instance properties
    
    private let spinner = SpinnerViewController()
    public weak var delegate: DGPSignInDelegate?
    
    public var registerView: DGPRegisterView! {
        guard isViewLoaded else {
            return nil
        }
        return (view as? DGPRegisterView)
    }
    
    //MARK: - Life cicle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func loadView() {
        view = DGPRegisterView(frame: .zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    //MARK: - Setup
    
    private func setup() {
        let textData = DGPLoginConfig.shared.textData
        self.title = textData.appName
        
        self.navigationController?.navigationBar.barTintColor = DGPLoginConfig.shared.navigationBarColor
        self.navigationController?.navigationBar.tintColor = DGPLoginConfig.shared.navigationTintColor
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font : DGPLoginConfig.shared.titleFont,
            NSAttributedString.Key.foregroundColor : DGPLoginConfig.shared.navigationTintColor
        ]
        
        registerView.textfieldUsername.delegate = self
        registerView.textfieldEmail.delegate = self
        registerView.textfieldPassword.delegate = self
        registerView.textfieldRepeatPassword.delegate = self
        registerView.buttonRegister.addTarget(self, action: #selector(doRegister), for: .touchUpInside)
    }
    // MARK: actions

    @objc func doRegister() {
        let valid = validData()
        
        if valid.error {
            view.makeToast(valid.msg, position: .center)
            return
        }
        
        let username = registerView.textfieldUsername.text!
        let email = registerView.textfieldEmail.text!
        let password = registerView.textfieldPassword.text!
        
        guard let nav = navigationController as? DGPSignIn else {
            return
        }
        
        delegate?.dgp_SignIn(nav, didSelectRegisterWithUsername: username, email: email, password: password)
    }
    
    internal func didRegisterError(with errorMessage: String) {
        hideLoader()
        view.makeToast(errorMessage, position: .center)
    }
    
    //MARK: - Utils
    
    func validData() ->(error: Bool, msg: String) {
        let textData = DGPLoginConfig.shared.textData
        if registerView.textfieldUsername.text!.utf8.count < DGPLoginConfig.shared.minLengthUsername {
            return (true, textData.errorUsernameShort)
        }  else if !DGPSignInHelper.isValidEmail(registerView.textfieldEmail.text!) {
            return (true, textData.errorEmailFormat)
        } else if registerView.textfieldPassword.text!.utf8.count < DGPLoginConfig.shared.minLengthPassword  {
            return (true, textData.errorPasswordFormat)
        } else if registerView.textfieldPassword.text! != registerView.textfieldRepeatPassword.text! {
            return (true, textData.errorPasswordRepeat)
        } else  {
            return (false, "")
        }
    }
    
    func showLoader() {
        spinner.show(controller: self)
    }
    
    func hideLoader() {
        spinner.hide()
    }
    
}

//MARK: - Textfield Delegate

extension DGPRegisterViewController : UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            registerView.textfieldEmail.becomeFirstResponder()
        } else if textField.tag == 1 {
            registerView.textfieldPassword.becomeFirstResponder()
        } else if textField.tag == 2 {
            registerView.textfieldRepeatPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
}
