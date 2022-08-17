//
//  LoginController.swift
//  Instagram-Swift
//
//  Created by hakkı can şengönül on 15.08.2022.
//

import UIKit

class LoginController: UIViewController {
    // MARK: - PROPERTIES
    private let iconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Instagram_logo_white")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let emailTextField : UITextField = {
        let textField = CustomTextField(placeHolder: "Email")
        textField.keyboardType = .emailAddress
        textField.keyboardAppearance = .dark
        return textField
    }()
    private let passwordTextField : UITextField = {
        let textField = CustomTextField(placeHolder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    private var stackView = UIStackView()
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.loginAndRegisterButton(withSetTitle: "Log In")
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let forgotPasswordButton : UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(withFirstPart: "Forgot your password?", withSecondPart: "Get help signing in.")
        return button
    }()
    private let dontHaveAccountButton : UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(withFirstPart: "Don't have an account?", withSecondPart: "Sign Up")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
    }
}

// MARK: - HELPERS
extension LoginController{
    private func setup(){
        navigationController?.navigationBar.barStyle = .black
        configureGradientLayer()
        //iconImageView Setup
        view.addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        //stackView Setup
        stackView = UIStackView(arrangedSubviews: [emailTextField,passwordTextField,loginButton,forgotPasswordButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //dontHaveAccountButton Setup
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.translatesAutoresizingMaskIntoConstraints = false
    }
    private func layout(){
        //iconImageView Layout
        NSLayoutConstraint.activate([
            iconImage.heightAnchor.constraint(equalToConstant: 80),
            iconImage.widthAnchor.constraint(equalToConstant: 120),
            iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
        ])
        //stackView Layout
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32)
            
        ])
        //dontHaveAccountButton Layout
        NSLayoutConstraint.activate([
            
            dontHaveAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dontHaveAccountButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }
}
// MARK: - ACTIONS
extension LoginController{
    @objc func handleShowSignUp(sender: UIButton){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
        
    }
}
