//
//  calcScreen.swift
//  tipCalc
//
//  Created by gikwegbu on 07/10/2023.
//

import SwiftUI
import Combine
struct calcScreen: View {
	@StateObject var vm: CalcViewModel = CalcViewModel()
	
	
    var body: some View {
				ScrollView{
					VStack(spacing: 20) {
						Text("Bill total")
							.foregroundColor(.gray)
							.font(.headline)
							.padding(.leading, 20)
							.frame(maxWidth: .infinity, alignment: .leading)

						
						TextField("0.00", text: $vm.billInput)
							.keyboardType(.numberPad)
							.onReceive(Just(vm.billInput)) {newVal in
								let _filtered = newVal.filter {"0123456789".contains($0) }
								if _filtered != newVal {
									self.vm.billInput = _filtered
								}
							}
							.font(.largeTitle)
							.padding(.leading, 20)
							.frame(height: 55)
							.frame(maxWidth: .infinity)
						
						Text("Tip")
							.foregroundColor(.gray)
							.font(.headline)
							.padding(.leading, 20)
							.frame(maxWidth: .infinity, alignment: .leading)

						//
						HStack {
							Text("\(vm.billTip)%")
								.font(.largeTitle)
								.padding(.leading, 20)
								.frame(height: 55)
							.frame(maxWidth: .infinity, alignment: .leading)
							
							Spacer()
							
							Button{
								vm.updateTip(action: false)
							} label: {
								Image(systemName: "minus")
									.foregroundColor(Color.purple)
									.font(.title2)
									.padding(5)
									.frame(width: 30, height: 30)
									.background(
										Color.purple.opacity(0.2).cornerRadius(100)
									)
							}
							Button{
								vm.updateTip(action: true)
							} label: {
								Image(systemName: "plus")
									.foregroundColor(Color.purple)
									.font(.title2)
									.padding(5)
									.frame(width: 30, height: 30)
									.background(
										Color.purple.opacity(0.2).cornerRadius(100)
									)
							}
						}
						.padding(.trailing, 20)
						
						// Result Card
						HStack{
							// Split
							VStack(alignment: .leading, spacing: 10) {
								Text("Split")
									.foregroundColor(.purple)
									.font(.headline)
									.frame(height: 55)
									.frame(maxWidth: .infinity, alignment: .leading)
								
								
								HStack(alignment: .center){
									Button{
										vm.updateSplitter(action: false)
									} label: {
										Image(systemName: "minus")
											.foregroundColor(Color.purple)
											.font(.title2)
											.padding(5)
											.frame(width: 30, height: 30)
											.background(
												Color.purple.opacity(0.2).cornerRadius(100)
											)
									}
									Text("\(vm.splitInto)")
										.font(.title)
										.foregroundColor(.purple)
										.bold()
										.padding(.horizontal, 5)
										.frame(height: 55)
									Button{
										vm.updateSplitter(action: true)
									} label: {
										Image(systemName: "plus")
											.foregroundColor(Color.purple)
											.font(.title2)
											.padding(5)
											.frame(width: 30, height: 30)
											.background(
												Color.purple.opacity(0.2).cornerRadius(100)
											)
									}
								}
							}
							// Split Total
							VStack(alignment: .leading, spacing: 10) {
								Text("Split total")
									.foregroundColor(.purple)
									.font(.headline)
									.padding(.leading, 20)
									.frame(height: 55)
									.frame(maxWidth: .infinity, alignment: .leading)
								
//								Text("\(vm.splitTotal)")
								Text(String(format: "%.2f", vm.splitTotal))
									.foregroundColor(.purple)
									.font(.largeTitle)
									.bold()
									.padding(.leading, 20)
									.frame(height: 55)
							}
						}
						.padding(.leading, 20)
						.padding(.vertical, 10)
						.background(Color.purple.opacity(0.09).cornerRadius(15))
						.padding(.horizontal, 20)
					}
				
			}
		}
}

struct calcScreen_Previews: PreviewProvider {
    static var previews: some View {
        calcScreen()
    }
}
