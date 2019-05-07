//
//  ViewController.swift
//  RAHI
//
//  Created by Anupa Arora on 5/6/19.
//  Copyright © 2019 RAHI@UCSF_PARAS_ARORA. All rights reserved.
//

import UIKit
import Foundation
import Parse
import TextFieldEffects

class ViewController: UIViewController
{
	

	@IBOutlet weak var signInUsernameField: HoshiTextField!
	@IBOutlet weak var signInPasswordField: HoshiTextField!
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		signInUsernameField.text = ""
		signInPasswordField.text = ""
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
		let loggedInViewController = storyBoard.instantiateViewController(withIdentifier: "UserIdentityViewController") as! UserIdentityViewController
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
	
	@IBAction func signIn(_ sender: Any)
	{
		let sv = UIViewController.displaySpinner(onView: self.view)
		PFUser.logInWithUsername(inBackground: signInUsernameField.text!, password: signInPasswordField.text!) { (user, error) in
			UIViewController.removeSpinner(spinner: sv)
			if user != nil
			{
				self.loadHomeScreen()
			}
			else
			{
				if let descrip = error?.localizedDescription{
					self.displayErrorMessage(message: (descrip))
				}
			}
		}
	}
	
	
	
}

