//
//  File.swift
//  
//
//  Created by Daniel Gallego Peralta on 16/2/21.
//

import UIKit
import DGPLibrary

internal class DGPRegisterView: UIView {
    
    public let buttonRegister: UIButton
    public let textfieldUsername : UITextField
    public let textfieldPassword : UITextField
    public let textfieldRepeatPassword: UITextField
    public let textfieldEmail: UITextField
    
    override init(frame: CGRect) {
        buttonRegister = UIButton(frame: .zero)
        textfieldUsername = UITextField()
        textfieldPassword = UITextField()
        textfieldRepeatPassword = UITextField()
        textfieldEmail = UITextField()
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = DGPLoginConfig.shared.mainBackgroundColor
        
        let viewUserData = UIView()
        let viewDataPassword = UIView()
        
        let viewUsername = UIView()
        let viewSeparator = UIView()
        let viewEmail = UIView()
        
        let viewPassword = UIView()
        let viewSeparatorPassword = UIView()
        let viewRepeatPassword = UIView()
        
        viewUserData.translatesAutoresizingMaskIntoConstraints = false
        viewDataPassword.translatesAutoresizingMaskIntoConstraints = false
        viewUsername.translatesAutoresizingMaskIntoConstraints = false
        viewEmail.translatesAutoresizingMaskIntoConstraints = false
        viewSeparator.translatesAutoresizingMaskIntoConstraints = false
        viewPassword.translatesAutoresizingMaskIntoConstraints = false
        viewRepeatPassword.translatesAutoresizingMaskIntoConstraints = false
        viewSeparatorPassword.translatesAutoresizingMaskIntoConstraints = false
       
        textfieldEmail.translatesAutoresizingMaskIntoConstraints = false
        textfieldUsername.translatesAutoresizingMaskIntoConstraints = false
        textfieldPassword.translatesAutoresizingMaskIntoConstraints = false
        textfieldRepeatPassword.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(viewUserData)
        addSubview(viewDataPassword)
        addSubview(buttonRegister)
        
        viewUserData.addSubview(viewUsername)
        viewUserData.addSubview(viewSeparator)
        viewUserData.addSubview(viewEmail)
        
        viewDataPassword.addSubview(viewPassword)
        viewDataPassword.addSubview(viewSeparatorPassword)
        viewDataPassword.addSubview(viewRepeatPassword)
        
        viewUsername.addSubview(textfieldUsername)
        viewEmail.addSubview(textfieldEmail)
        viewPassword.addSubview(textfieldPassword)
        viewRepeatPassword.addSubview(textfieldRepeatPassword)
        
        
        NSLayoutConstraint.activate( [
            viewUserData.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            viewUserData.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            viewUserData.heightAnchor.constraint(equalToConstant: 128.0),
            viewUserData.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60),
            
            viewSeparator.heightAnchor.constraint(equalToConstant: 1),
            viewSeparator.centerYAnchor.constraint(equalTo: viewUserData.centerYAnchor),
            viewSeparator.leadingAnchor.constraint(equalTo: viewUserData.leadingAnchor),
            viewSeparator.trailingAnchor.constraint(equalTo: viewUserData.trailingAnchor),
            
            viewUsername.topAnchor.constraint(equalTo: viewUserData.topAnchor),
            viewUsername.trailingAnchor.constraint(equalTo: viewUserData.trailingAnchor),
            viewUsername.leadingAnchor.constraint(equalTo: viewUserData.leadingAnchor),
            viewUsername.bottomAnchor.constraint(equalTo: viewSeparator.topAnchor),
            
            viewEmail.topAnchor.constraint(equalTo: viewSeparator.bottomAnchor),
            viewEmail.trailingAnchor.constraint(equalTo: viewUserData.trailingAnchor),
            viewEmail.leadingAnchor.constraint(equalTo: viewUserData.leadingAnchor),
            viewEmail.bottomAnchor.constraint(equalTo: viewUserData.bottomAnchor),
            
            
            
            viewDataPassword.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            viewDataPassword.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            viewDataPassword.heightAnchor.constraint(equalToConstant: 128.0),
            viewDataPassword.topAnchor.constraint(equalTo: viewUserData.bottomAnchor, constant: 40),
            
            viewSeparatorPassword.heightAnchor.constraint(equalToConstant: 1),
            viewSeparatorPassword.centerYAnchor.constraint(equalTo: viewDataPassword.centerYAnchor),
            viewSeparatorPassword.leadingAnchor.constraint(equalTo: viewDataPassword.leadingAnchor),
            viewSeparatorPassword.trailingAnchor.constraint(equalTo: viewDataPassword.trailingAnchor),
            
            viewPassword.topAnchor.constraint(equalTo: viewDataPassword.topAnchor),
            viewPassword.trailingAnchor.constraint(equalTo: viewDataPassword.trailingAnchor),
            viewPassword.leadingAnchor.constraint(equalTo: viewDataPassword.leadingAnchor),
            viewPassword.bottomAnchor.constraint(equalTo: viewSeparatorPassword.topAnchor),
            
            viewRepeatPassword.topAnchor.constraint(equalTo: viewSeparatorPassword.bottomAnchor),
            viewRepeatPassword.trailingAnchor.constraint(equalTo: viewDataPassword.trailingAnchor),
            viewRepeatPassword.leadingAnchor.constraint(equalTo: viewDataPassword.leadingAnchor),
            viewRepeatPassword.bottomAnchor.constraint(equalTo: viewDataPassword.bottomAnchor),
            
            
            buttonRegister.topAnchor.constraint(equalTo: viewDataPassword.bottomAnchor, constant: 40),
            buttonRegister.heightAnchor.constraint(equalToConstant: 40),
            buttonRegister.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            
            textfieldUsername.topAnchor.constraint(equalTo: viewUsername.topAnchor),
            textfieldUsername.trailingAnchor.constraint(equalTo: viewUsername.trailingAnchor, constant: -20),
            textfieldUsername.leadingAnchor.constraint(equalTo: viewUsername.leadingAnchor, constant: 20),
            textfieldUsername.bottomAnchor.constraint(equalTo: viewUsername.bottomAnchor),
            
            textfieldEmail.topAnchor.constraint(equalTo: viewEmail.topAnchor),
            textfieldEmail.trailingAnchor.constraint(equalTo: viewEmail.trailingAnchor, constant: -20),
            textfieldEmail.leadingAnchor.constraint(equalTo: viewEmail.leadingAnchor, constant: 20),
            textfieldEmail.bottomAnchor.constraint(equalTo: viewEmail.bottomAnchor),
            
            textfieldPassword.topAnchor.constraint(equalTo: viewPassword.topAnchor),
            textfieldPassword.trailingAnchor.constraint(equalTo: viewPassword.trailingAnchor, constant: -20),
            textfieldPassword.leadingAnchor.constraint(equalTo: viewPassword.leadingAnchor, constant: 20),
            textfieldPassword.bottomAnchor.constraint(equalTo: viewPassword.bottomAnchor),
            
            textfieldRepeatPassword.topAnchor.constraint(equalTo: viewRepeatPassword.topAnchor),
            textfieldRepeatPassword.trailingAnchor.constraint(equalTo: viewRepeatPassword.trailingAnchor, constant: -20),
            textfieldRepeatPassword.leadingAnchor.constraint(equalTo: viewRepeatPassword.leadingAnchor, constant: 20),
            textfieldRepeatPassword.bottomAnchor.constraint(equalTo: viewRepeatPassword.bottomAnchor),
            

          
        ])
        
        viewUserData.backgroundColor = .white
        viewDataPassword.backgroundColor = .white
        
        viewUserData.clipsToBounds = true
        viewUserData.layer.cornerRadius = 8
        
        viewDataPassword.clipsToBounds = true
        viewDataPassword.layer.cornerRadius = 8
        
        buttonRegister.clipsToBounds = true
        buttonRegister.layer.cornerRadius = 8
        
        viewSeparator.backgroundColor = UIColor.silver
        viewSeparatorPassword.backgroundColor = .silver 
        
        let textData = DGPLoginConfig.shared.textData
        buttonRegister.setTitle(textData.buttonRegister, for: .normal)
        buttonRegister.titleLabel?.font = DGPLoginConfig.shared.actionFont
        buttonRegister.backgroundColor = UIColor.mimosa
        buttonRegister.setTitleColor(.white, for: .normal)
        
        textfieldUsername.placeholder = textData.placeholderUsername
        textfieldPassword.placeholder = textData.placeholderPassword
        textfieldEmail.placeholder = textData.placeholderEmail
        textfieldRepeatPassword.placeholder = textData.placeholderRepeatPassword
        
        textfieldUsername.tag = 0
        textfieldEmail.tag = 1
        textfieldPassword.tag = 2
        textfieldRepeatPassword.tag = 3
        
        textfieldUsername.font = DGPLoginConfig.shared.textfieldFont
        textfieldEmail.font = DGPLoginConfig.shared.textfieldFont
        textfieldPassword.font = DGPLoginConfig.shared.textfieldFont
        textfieldRepeatPassword.font = DGPLoginConfig.shared.textfieldFont
        
        textfieldPassword.isSecureTextEntry = true
        textfieldRepeatPassword.isSecureTextEntry = true
    }
}
