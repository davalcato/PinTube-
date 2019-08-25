//
//  SignUpController.swift
//  PinTube
//
//  Created by Daval Cato on 8/25/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
    
    // MARK: Properties
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "logo")
        return iv
    }()
    
    lazy var emailContainView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "ic_mail_outline_white_2x"), emailTextField)
    }()
    
    lazy var usernameContainView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "account"), usernameTextField)
    
    }()
    
    lazy var passwordContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view , #imageLiteral(resourceName: "ic_lock_outline_white_2x"), passwordTextField)
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlacolder: "Email", isSecureTextEntry: false)
    }()
    
    lazy var usernameTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlacolder: "Username", isSecureTextEntry: false)
        
    }()
    
        lazy var passwordTextField: UITextField = {
            let tf = UITextField()
            return tf.textField(withPlacolder: "Password", isSecureTextEntry: true)
    
    }()
        
        let loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("LOG IN", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
            button.setTitleColor(UIColor.mainBlue(), for: .normal)
            button.backgroundColor = .white
            button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
            button.layer.cornerRadius = 5
            return button
    
    
    }()
        
        let dontHaveAccountButton: UIButton = {
            let button = UIButton(type: .system)
            let attributedTitle = NSMutableAttributedString(string: "Don't have an account", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
            attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
            button.setAttributedTitle(attributedTitle, for: .normal)
            button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
            return button
            
    }()
        
        // MARK: Init
        
        override func viewDidLoad() {
            super.viewDidLoad
        }
        
        // MARK: Selectors
        
        @objc func handleLogin() {
            print("Handle sign up..")
            
        }
        
        @objc func handleShowLogin() {
            navigationController?.popViewController(animated: true)
        }

}
