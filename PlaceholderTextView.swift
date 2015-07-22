//
//  MTTextView.swift
//  MiddleTon
//
//  Created by Vijay on 4/21/15.
//  Copyright (c) 2015 MT. All rights reserved.
//

import UIKit

// MARK: - Class -

@IBDesignable class PlaceholderTextView: UITextView {

	// MARK: - Properties -
	
	@IBInspectable var placeholder : String?
	@IBInspectable var placeholderColor : UIColor?

	var isShowingPlaceholder = true
	var previousTextColor : UIColor?
	
	// MARK: - NSObject -
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		autocapitalizationType = UITextAutocapitalizationType.Sentences
		
		if count(text) == 0 {
			showPlaceholder()
		}
	}
	
	// MARK: - UIView -
	
	override func layoutSubviews() {
		super.layoutSubviews()
		textContainerInset = UIEdgeInsetsMake(10, 10, 5, 10)
	}
	
	// MARK: - UIControl -

	override func becomeFirstResponder() -> Bool {
		if isShowingPlaceholder == true {
			hidePlaceholder()
		}
		return super.becomeFirstResponder()
	}
	
	override func resignFirstResponder() -> Bool {
		
		if count(text) == 0 {
			showPlaceholder()
		}
		return super.resignFirstResponder()
	}

	// MARK: - UITextView -
	
	override var text : String! {
		set(newValue){
			if isShowingPlaceholder == true {
				hidePlaceholder()
			}
			super.text = newValue
		}
		get {
			return super.text
		}
	}
	
	// MARK: - Convenience
	
	private func showPlaceholder() {
		isShowingPlaceholder = true
		previousTextColor = (textColor != nil) ? textColor : UIColor.whiteColor()
		super.text = placeholder
		super.textColor = placeholderColor
	}
	
	private func hidePlaceholder() {
		isShowingPlaceholder = false
		super.text = ""
		super.textColor = previousTextColor
	}

}















