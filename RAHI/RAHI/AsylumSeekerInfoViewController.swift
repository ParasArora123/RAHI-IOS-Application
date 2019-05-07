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
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
	}
	
	func setEqualToEmptyString()
	{
		fullNameField.text = ""
		countryOfOriginField.text = ""
		ageField.text = ""
		asylumSeekerOptionField.text = ""
		currentLocationField.text = ""
	}
	
	@IBAction func asylumInterest(_ sender: Any)
	{
		
	}
	
	@IBAction func researchInterest(_ sender: Any)
	{
		
	}
	
	@IBAction func medicalAidInterest(_ sender: Any)
	{
		
	}
	
	@IBAction func donationInterest(_ sender: Any)
	{
		
	}
	
	@IBAction func otherInterest(_ sender: Any)
	{
		
	}
	
	@IBAction func submitButton(_ sender: Any) {
	}
	
	
}
