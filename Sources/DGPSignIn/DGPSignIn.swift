//
//  File.swift
//  
//
//  Created by Daniel Gallego Peralta on 16/2/21.
//

import Foundation

import UIKit

public protocol DGPSignInDelegate: class {
    
    /// Login Pressed with validate data. Waiting for Success or error
    /// - Parameters:
    ///   - DGPSignIn: Class Sign In
    ///   - username: name user
    ///   - password: password
    func dgp_SignIn(_ DGPSignIn: DGPSignIn, didSelectLoginWithUsername username: String, password: String)
    
    
    /// Register pressed with validate data. Waiting for Success or error
    /// - Parameters:
    ///   - DGPSignIn: Class Sign In
    ///   - username: name user
    ///   - email: email of the user
    ///   - password: password
    func dgp_SignIn(_ DGPSignIn: DGPSignIn, didSelectRegisterWithUsername username: String, email: String, password: String)
}
public class DGPSignIn: UINavigationController {
    
    private let loginVC: DGPLoginViewController!
    private var registerVC: DGPRegisterViewController!
    
    //MARK: - Life cicle
    
    public convenience init(delegate: DGPSignInDelegate) {
        self.init(configuration: DGPLoginConfig.shared, delegate: delegate)
    }
    
    public required init(configuration: DGPLoginConfig, delegate: DGPSignInDelegate) {
        DGPLoginConfig.shared = configuration
        loginVC = DGPLoginViewController()
        registerVC = DGPRegisterViewController()
        super.init(nibName: nil, bundle: nil)
        
        loginVC.didPressRegister = goToRegister
        loginVC.delegate = delegate
        registerVC.delegate = delegate
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [loginVC]
    }
    
    private func goToRegister() {
        self.pushViewController(registerVC!, animated: true)
    }
    
    
    /// Error trying to make Sign in
    /// - Parameter errorMessage: Description error to be show
    public func didLoginError(with errorMessage: String) {
        loginVC.didLoginError(with: errorMessage)
    }
    
    /// Error trying to make Sign up
    /// - Parameter errorMessage: Description error to be show
    public func didRegisterError(with errorMessage: String) {
        registerVC.didRegisterError(with: errorMessage)
    }
}
