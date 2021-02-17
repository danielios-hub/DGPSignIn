//
//  DGPLoginViewController.swift
//  LoginFramework
//
//  Created by Daniel Gallego Peralta on 16/2/21.
//

import UIKit
import DGPLibrary
import DGPExtensionCore

internal class DGPLoginViewController: UIViewController {

    //MARK: - Instance properties
    
    let spinner = SpinnerViewController()
    internal var delegate: DGPSignInDelegate?
    
    public var loginView: DGPLoginView! {
        guard self.isViewLoaded else {
            return nil
        }
        return (view as! DGPLoginView)
    }
    
    var didPressRegister : (() -> Void)?
    
    //MARK: - Life cicle
    
    override func loadView(){
        view = DGPLoginView(frame: .zero)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
        super.touchesBegan(touches, with: event)
    }
    
    // MARK: setup
    
    private func setup() {
        loginView.buttonLogin.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)
        loginView.buttonRegister.addTarget(self, action: #selector(actionRegister), for: .touchUpInside)
        loginView.textfieldUsername.delegate = self
        loginView.textfieldPassword.delegate = self
        loginView.buttonRegister.addTarget(self, action: #selector(actionRegister), for: .touchUpInside)
    }
    
    // MARK: actions
    
    @IBAction func actionLogin() {
        let valid = validData()
        
        if valid.error {
            view.makeToast(valid.msg, position: .center)
            return
        }
        
        let username = loginView.textfieldUsername.text!
        let password = loginView.textfieldPassword.text!
        showLoader()
        
        guard let nav = self.navigationController as? DGPSignIn else {
            return
        }
        delegate?.dgp_SignIn(nav, didSelectLoginWithUsername: username, password: password)
    }
    
    func actionRegister() {
        didPressRegister?()
    }
    
    internal func didLoginError(with errorMessage: String) {
        hideLoader()
        view.makeToast(errorMessage, position: .center)
    }
    
    //MARK: - Utils
    
    func validData() -> (error: Bool, msg: String) {
        if loginView.textfieldUsername.text!.utf8.count < DGPLoginConfig.shared.minLengthUsername || loginView.textfieldPassword.text!.utf8.count < DGPLoginConfig.shared.minLengthPassword {
            return (true, DGPLoginConfig.shared.textData.errorLogin)
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

//MARK: UITextFieldDelegate

extension DGPLoginViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            loginView.textfieldPassword.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}


