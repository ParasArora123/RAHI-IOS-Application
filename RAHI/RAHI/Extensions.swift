//
//  Extensions.swift
//  RAHI
//
//  Created by Anupa Arora on 5/6/19.
//  Copyright © 2019 RAHI@UCSF_PARAS_ARORA. All rights reserved.
//

import Foundation
import UIKit
import Parse

extension UIViewController
{
	class func displaySpinner(onView : UIView) -> UIView
	{
		let spinnerView = UIView.init(frame: onView.bounds)
		spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
		let ai = UIActivityIndicatorView.init(style: .whiteLarge)
		ai.startAnimating()
		ai.center = spinnerView.center
		
		DispatchQueue.main.async {
			spinnerView.addSubview(ai)
			onView.addSubview(spinnerView)
		}
		
		return spinnerView
	}
	
	class func removeSpinner(spinner :UIView)
	{
		DispatchQueue.main.async {
			spinner.removeFromSuperview()
		}
	}
}
