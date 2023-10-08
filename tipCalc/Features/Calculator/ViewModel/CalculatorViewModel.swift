//
//  CalculatorViewModel.swift
//  tipCalc
//
//  Created by gikwegbu on 08/10/2023.
//

import SwiftUI

class CalcViewModel: ObservableObject {
	
	 init() {
		
	}
	
	@Published var billInput: String = "" {
		didSet {
			splitBill()
		}
	}
	@Published var billTip: Int = 10
	@Published var splitInto: Int = 1
	@Published var splitTotal: Double = 0
	
	
	func updateTip(action:Bool)  {
		if action ==  true {
			self.billTip += 1
		} else {
			if(self.billTip > 1) {
				self.billTip -= 1
			}
			
		}
		splitBill() // Re-calculates the split again
	}
	
	func updateSplitter(action:Bool)  {
		
		if action ==  true {
			self.splitInto += 1
		} else {
			if(self.splitInto > 1) {
				self.splitInto -= 1
			}
			
		}
		self.splitBill()  // Re-calculates the split again
	}
	
	func splitBill() {
		if (self.billInput.count > 0) { // Only run when Bill is entered
			let amt = (Int(self.billInput) ?? 0)
			let _percent = (self.billTip * amt) / 100
			
			self.splitTotal = Double((amt + _percent) / self.splitInto)
		} else {
			self.splitTotal = 0
		}
		
	}
}
