//
//  File.swift
//  
//
//  Created by Daniel Gallego Peralta on 16/2/21.
//

import UIKit
import DGPLibrary

class DGPLoginView: UIView {
    
    public let buttonLogin: UIButton
    public let buttonRegister: UIButton
    public let textfieldUsername : UITextField
    public let textfieldPassword : UITextField
    
    override init(frame: CGRect) {
        buttonLogin = UIButton(frame: .zero)
        buttonRegister = UIButton(frame: .zero)
        textfieldUsername = UITextField()
        textfieldPassword = UITextField()
        super.init(frame: frame)
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = DGPLoginConfig.shared.mainBackgroundColor
        
        let viewUserData = UIView()
        let viewUsername = UIView()
        let viewSeparator = UIView()
        let viewPassword = UIView()
        let viewRegister = UIView()
       
        let labelRegister = UILabel()
        let iconRegister = UIImageView()
        
        viewUserData.translatesAutoresizingMaskIntoConstraints = false
        viewUsername.translatesAutoresizingMaskIntoConstraints = false
        viewSeparator.translatesAutoresizingMaskIntoConstraints = false
        viewPassword.translatesAutoresizingMaskIntoConstraints = false
        viewRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonLogin.translatesAutoresizingMaskIntoConstraints = false
        labelRegister.translatesAutoresizingMaskIntoConstraints = false
        textfieldUsername.translatesAutoresizingMaskIntoConstraints = false
        textfieldPassword.translatesAutoresizingMaskIntoConstraints = false
        iconRegister.translatesAutoresizingMaskIntoConstraints = false
        buttonRegister.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(viewUserData)
        addSubview(viewRegister)
        addSubview(buttonRegister)
        addSubview(buttonLogin)
        
        viewUserData.addSubview(viewUsername)
        viewUserData.addSubview(viewSeparator)
        viewUserData.addSubview(viewPassword)
        viewUsername.addSubview(textfieldUsername)
        viewPassword.addSubview(textfieldPassword)
        viewRegister.addSubview(labelRegister)
        viewRegister.addSubview(iconRegister)
        
        NSLayoutConstraint.activate( [
            viewUserData.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            viewUserData.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            viewUserData.heightAnchor.constraint(equalToConstant: 128.0),
            viewUserData.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -100),
            
            viewSeparator.heightAnchor.constraint(equalToConstant: 1),
            viewSeparator.centerYAnchor.constraint(equalTo: viewUserData.centerYAnchor),
            viewSeparator.leadingAnchor.constraint(equalTo: viewUserData.leadingAnchor),
            viewSeparator.trailingAnchor.constraint(equalTo: viewUserData.trailingAnchor),
            
            viewUsername.topAnchor.constraint(equalTo: viewUserData.topAnchor),
            viewUsername.trailingAnchor.constraint(equalTo: viewUserData.trailingAnchor),
            viewUsername.leadingAnchor.constraint(equalTo: viewUserData.leadingAnchor),
            viewUsername.bottomAnchor.constraint(equalTo: viewSeparator.topAnchor),
            
            viewPassword.topAnchor.constraint(equalTo: viewSeparator.bottomAnchor),
            viewPassword.trailingAnchor.constraint(equalTo: viewUserData.trailingAnchor),
            viewPassword.leadingAnchor.constraint(equalTo: viewUserData.leadingAnchor),
            viewPassword.bottomAnchor.constraint(equalTo: viewUserData.bottomAnchor),
            
            buttonLogin.topAnchor.constraint(equalTo: viewUserData.bottomAnchor, constant: 40),
            buttonLogin.heightAnchor.constraint(equalToConstant: 40),
            buttonLogin.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            buttonLogin.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            viewRegister.heightAnchor.constraint(equalToConstant: 60),
            viewRegister.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            viewRegister.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewRegister.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            labelRegister.leadingAnchor.constraint(equalTo: viewRegister.leadingAnchor, constant: 20),
            labelRegister.centerYAnchor.constraint(equalTo: viewRegister.centerYAnchor),
            labelRegister.bottomAnchor.constraint(equalTo: viewRegister.bottomAnchor, constant: 5),
            
            textfieldUsername.topAnchor.constraint(equalTo: viewUsername.topAnchor),
            textfieldUsername.trailingAnchor.constraint(equalTo: viewUsername.trailingAnchor, constant: -20),
            textfieldUsername.leadingAnchor.constraint(equalTo: viewUsername.leadingAnchor, constant: 20),
            textfieldUsername.bottomAnchor.constraint(equalTo: viewUsername.bottomAnchor),
            
            textfieldPassword.topAnchor.constraint(equalTo: viewPassword.topAnchor),
            textfieldPassword.trailingAnchor.constraint(equalTo: viewPassword.trailingAnchor, constant: -20),
            textfieldPassword.leadingAnchor.constraint(equalTo: viewPassword.leadingAnchor, constant: 20),
            textfieldPassword.bottomAnchor.constraint(equalTo: viewPassword.bottomAnchor),
            
            iconRegister.trailingAnchor.constraint(equalTo: viewRegister.trailingAnchor, constant: -20),
            iconRegister.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: labelRegister.trailingAnchor, multiplier: 8),
            iconRegister.centerYAnchor.constraint(equalTo: viewRegister.centerYAnchor),
            
            buttonRegister.topAnchor.constraint(equalTo: viewRegister.topAnchor),
            buttonRegister.trailingAnchor.constraint(equalTo: viewRegister.trailingAnchor),
            buttonRegister.leadingAnchor.constraint(equalTo: viewRegister.leadingAnchor),
            buttonRegister.bottomAnchor.constraint(equalTo: viewRegister.bottomAnchor),
        ])
        
        viewUserData.backgroundColor = .white
        
        viewUserData.clipsToBounds = true
        viewUserData.layer.cornerRadius = 8
        
        buttonLogin.clipsToBounds = true
        buttonLogin.layer.cornerRadius = 8
        
        viewSeparator.backgroundColor = UIColor.silver
        
        let textData = DGPLoginConfig.shared.textData
        buttonLogin.setTitle(textData.buttonLogin, for: .normal)
        buttonLogin.titleLabel?.font = DGPLoginConfig.shared.actionFont
        buttonLogin.backgroundColor = UIColor.mimosa
        buttonLogin.setTitleColor(.white, for: .normal)
        
        textfieldUsername.placeholder = textData.placeholderUsername
        textfieldPassword.placeholder = textData.placeholderPassword
        
        textfieldUsername.tag = 0
        textfieldPassword.tag = 1
        
        viewRegister.backgroundColor = DGPLoginConfig.shared.secondaryBackgroundColor
        labelRegister.text = "register_button".localized
        iconRegister.image = UIImage(symbol: SFSymbol.arrowRight)
        iconRegister.tintColor = .white
        labelRegister.textColor = .white
        labelRegister.text = textData.buttonRegister
        
        textfieldUsername.font = DGPLoginConfig.shared.textfieldFont
        textfieldPassword.font = DGPLoginConfig.shared.textfieldFont
    }
}
