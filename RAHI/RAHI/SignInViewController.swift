//
//  SignInViewController.swift
//  RAHI
//
//  Created by Anupa Arora on 5/6/19.
//  Copyright © 2019 RAHI@UCSF_PARAS_ARORA. All rights reserved.
//

// NOTE: THIS IS ACTUALLY THE SIGN UP VIEW CONTROLLER BUT I'M JUST AN IDIOT AND NAMED IT INCORRECTLY AND REALLY DON'T WANT TO GO BACK AND CHANGE THE NAME FOR IT IN EVERY FILE ETC.

import Foundation
import Parse
import UIKit
import TextFieldEffects

class SignInViewController: UIViewController
{
	@IBOutlet weak var signUpEmailField: HoshiTextField!
	@IBOutlet weak var signUpUsernameField: HoshiTextField!
	@IBOutlet weak var signUpPasswordField: HoshiTextField!
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		signUpEmailField.text = ""
		signUpUsernameField.text = ""
		signUpPasswordField.text = ""
	}
	
	override func viewDidAppear(_ animated: Bool)
	{
		let currentUser = PFUser.current()
		if currentUser != nil
		{
			loadHomeScreen()
		}
	}
	
	func loadHomeScreen()
	{
		let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "LoggedInViewController") as! LoggedInViewController
		self.present(loggedInViewController, animated: true, completion: nil)
	}
	
	func displayErrorMessage(message:String)
	{
		let alertView = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
		let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
		}
		alertView.addAction(OKAction)
		if let presenter = alertView.popoverPresentationController
		{
			presenter.sourceView = self.view
			presenter.sourceRect = self.view.bounds
		}
		self.present(alertView, animated: true, completion:nil)
	}
	
	@IBAction func signUp(_ sender: Any)
	{
		let user = PFUser()
		
		user.username = signUpUsernameField.text
		user.password = signUpPasswordField.text
		user.email = signUpEmailField.text
		
		let sv = UIViewController.displaySpinner(onView: self.view)
		user.signUpInBackground { (success, error) in
			UIViewController.removeSpinner(spinner: sv)
			if success{
				self.loadHomeScreen()
			}else{
				if let descrip = error?.localizedDescription{
					self.displayErrorMessage(message: descrip)
				}
			}
		}
	}
	
}
