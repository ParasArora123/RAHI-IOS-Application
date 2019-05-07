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
	
	@IBAction func asylumSeekerCardButton(_ sender: Any)
	{
		currentUser!["status"] = "asylum"
	}
	
	@IBAction func professionalCardButton(_ sender: Any)
	{
		currentUser!["status"] = "professional"
	}
	
	@IBAction func interestedPersonCardButton(_ sender: Any)
	{
		currentUser!["status"] = "regular"
	}
	
	
}
