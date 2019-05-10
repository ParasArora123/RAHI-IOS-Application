//
//  AsylumSeekerInfoViewController.swift
//  RAHI
//
//  Created by Anupa Arora on 5/7/19.
//  Copyright © 2019 RAHI@UCSF_PARAS_ARORA. All rights reserved.
//

import UIKit
import Foundation
import Parse
import TextFieldEffects

class AsylumSeekerInfoViewController: UIViewController
{
	
	@IBOutlet weak var fullNameField: YoshikoTextField!
	@IBOutlet weak var countryOfOriginField: YoshikoTextField!
	@IBOutlet weak var ageField: YoshikoTextField!
	@IBOutlet weak var asylumSeekerOptionField: YoshikoTextField!
	@IBOutlet weak var currentLocationField: YoshikoTextField!
	@IBOutlet weak var numberOfFamilyField: YoshikoTextField!
	
	let user = PFUser.current() // getting the current user so I can add stuff to database later
	
	var interestesArray = [String]()
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		setEqualToEmptyString()
		
	}
	
	// rather than sticking this all in viewDidLoad, created another method
	func setEqualToEmptyString()
	{
		fullNameField.text = ""
		countryOfOriginField.text = ""
		ageField.text = ""
		asylumSeekerOptionField.text = ""
		currentLocationField.text = ""
		numberOfFamilyField.text = ""
	}
	
	// a method to save data back to USER class of the databse
	func saveData()
	{
		user?.saveInBackground(block: { (success: Bool, error: Error?) in
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
	
	// test to see if the user correctly filled out the asylum seeker field or lots
	// of things could go wrong in the future
	func asylumSeekerFieldCheck() -> String
	{
		// .lowercased and .trimmingCharacters simply makes it lowercased and removes
		// all leading and lagging white space for me to check it
		if asylumSeekerOptionField.text!.lowercased().trimmingCharacters(in: .whitespaces) == "y" ||
			asylumSeekerOptionField.text!.lowercased().trimmingCharacters(in: .whitespaces) == "yes"
		{
			return "y"
		}
		else if asylumSeekerOptionField.text!.lowercased().trimmingCharacters(in: .whitespaces) == "n" || asylumSeekerOptionField.text!.lowercased().trimmingCharacters(in: .whitespaces) == "no"
		{
			return "n"
		}
		else
		{
			let alert = UIAlertController(title: "Asylum Seeker?", message: "Please indicate if you are currently an asylum seeker by either typing 'y', 'yes', 'n', or 'no'", preferredStyle: UIAlertController.Style.alert)
			
			alert.addAction(UIAlertAction(title: "Sounds Good!", style: UIAlertAction.Style.default, handler: nil))
			
			self.present(alert, animated: true, completion: nil)
			return "uh oh"
		}
	}
	
	// final submit button
	@IBAction func submitButton(_ sender: Any)
	{
		
		let asylumStatus = asylumSeekerFieldCheck() // now we have a string that is either y or n that we cna use in a standard way
		
		if asylumStatus != "uh oh"
		{
		
			user!["name"] = fullNameField.text
			user!["countryOfOrigin"] = countryOfOriginField.text
			user!["age"] = ageField.text
			user!["currentlySeekingAsylum"] = asylumStatus
			user!["currentLocation"] = currentLocationField.text
			user!["numberOfFamily"] = numberOfFamilyField.text
			
			saveData()
			addInterestTooArray() // need to resave here cause parse doesn't let you save array objects at the same time
		}
	}
	
	// All the code below allows us to add all of the things the user is interested in to the database
	func addInterestTooArray()
	{
		user?.addUniqueObjects(from: self.interestesArray, forKey: "interests")
		user?.saveInBackground()
	}
	
	@IBAction func asylumInterest(_ sender: Any)
	{
		self.interestesArray.append("asylum")
	}
	
	@IBAction func researchInterest(_ sender: Any)
	{
		self.interestesArray.append("research")
	}
	
	@IBAction func medicalAidInterest(_ sender: Any)
	{
		self.interestesArray.append("medical")
	}
	
	@IBAction func donationInterest(_ sender: Any)
	{
		self.interestesArray.append("donation")
	}
	
	@IBAction func otherInterest(_ sender: Any)
	{
		self.interestesArray.append("other")
	}
	
}
