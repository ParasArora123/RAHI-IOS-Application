//
//  LoggedInViewController.swift
//  RAHI
//
//  Created by Anupa Arora on 5/6/19.
//  Copyright © 2019 RAHI@UCSF_PARAS_ARORA. All rights reserved.
//

import Foundation
import Parse
import UIKit

class LoggedInViewController: UIViewController
{
	override func viewDidLoad()
	{
		super.viewDidLoad()
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
	
	func loadLoginScreen()
	{
		let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
		self.present(viewController, animated: true, completion: nil)
	}
	
	@IBAction func logoutOfApp(_ sender: Any)
	{
		let sv = UIViewController.displaySpinner(onView: self.view)
		PFUser.logOutInBackground { (error: Error?) in
			UIViewController.removeSpinner(spinner: sv)
			if (error == nil)
			{
				self.loadLoginScreen()
			}
			else
			{
				if let descrip = error?.localizedDescription
				{
					self.displayErrorMessage(message: descrip)
				}
				else
				{
					self.displayErrorMessage(message: "error logging out")
				}
			}
		}
	}
	
}
