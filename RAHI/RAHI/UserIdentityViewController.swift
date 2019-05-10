//
//  UserIdentityViewController.swift
//  RAHI
//
//  Created by Anupa Arora on 5/6/19.
//  Copyright © 2019 RAHI@UCSF_PARAS_ARORA. All rights reserved.
//

import Foundation
import UIKit
import Foundation
import Parse
import TextFieldEffects

class UserIdentityViewController: UIViewController
{
	let currentUser = PFUser.current()
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
	}
	
	func saveData()
	{
		currentUser?.saveInBackground(block: { (success: Bool, error: Error?) in
			if success
			{
				print("succesful motherfuckers")
			}
			else
			{
				print(LocalizedError.self)
			}
		})
	}
	
	@IBAction func asylumSeekerCardButton(_ sender: Any)
	{
		currentUser!["status"] = "asylum seeker"
		saveData()
	}
	
	@IBAction func professionalCardButton(_ sender: Any)
	{
		currentUser!["status"] = "professional"
		saveData()
	}
	
	@IBAction func interestedPersonCardButton(_ sender: Any)
	{
		currentUser!["status"] = "regular"
		saveData()
	}
	
	
}
