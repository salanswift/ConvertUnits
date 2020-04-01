//
//  ContentView.swift
//  ConvertUnits
//
//  Created by Arsalan Akhtar on 4/1/20.
//  Copyright © 2020 Arsalan Akhtar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	@State private var inputValue = ""
	@State private var inputUnit = 1
	@State private var outputUnit = 1
	
	var outPutValue: Double {
		let input = Measurement(value: Double(inputValue) ?? 0, unit: self.units[inputUnit])
		return input.converted(to: self.units[outputUnit]).value
	}
	
	
	let units = [UnitLength.inches, UnitLength.feet, UnitLength.meters]
	
	var body: some View {
		NavigationView {
			Form {
				Section(header:Text("Input")) {
					
					TextField("Value", text: $inputValue)
						.keyboardType(.decimalPad)
					
					Picker("Select Unit", selection: $inputUnit) {
						ForEach(0 ..< self.units.count) {
							Text(self.units[$0].symbol)
						}
					}.pickerStyle(SegmentedPickerStyle())
				}
				
				Section(header:Text("Output")) {
					
					Picker("Select Unit", selection: $outputUnit) {
						ForEach(0 ..< self.units.count) {
							Text(self.units[$0].symbol)
						}
					}.pickerStyle(SegmentedPickerStyle())
					
					Text("\(outPutValue, specifier: "%.2f")")
					
				}
				
			}.navigationBarTitle("Unit Convertor", displayMode: .inline)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}


