//
//  ViewController.swift
//  converter
//
//  Created by christophe milliere on 19/08/2018.
//  Copyright © 2018 christophe milliere. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ui_outputPouceLabel: UILabel!
    @IBOutlet weak var ui_outputCentimeterLabel: UILabel!
    @IBOutlet weak var ui_outputMeterLabel: UILabel!
    @IBOutlet weak var inputValueField: UITextField!
    @IBOutlet weak var ui_inputValueType: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func inputValueChanged() {
        convertInputValue()
    }
    @IBAction func inputValueTypeChanged() {
        convertInputValue()
    }
    
    
    func getInputMeterValue() -> Double? {
        let inputMeters:Double?
        
        if let inputString: String = inputValueField.text, let inputDouble: Double = Double(inputString) {
            switch ui_inputValueType.selectedSegmentIndex{
            case 0:
                inputMeters = inputDouble
            case 1 :
                inputMeters = UnitLength.centimeters.converter.baseUnitValue(fromValue: inputDouble)
            case 2:
                inputMeters = UnitLength.inches.converter.baseUnitValue(fromValue: inputDouble)
            default:
                inputMeters = nil
            }
        } else {
            inputMeters = nil
        }
        
        return inputMeters
    }
    func convertInputValue() {
        if let inputMeter = getInputMeterValue() {
            ui_outputMeterLabel.text = "\(inputMeter) M"
            ui_outputPouceLabel.text = "\(UnitLength.inches.converter.baseUnitValue(fromValue: inputMeter)) pouces"
            ui_outputCentimeterLabel.text = "\(UnitLength.centimeters.converter.baseUnitValue(fromValue: inputMeter)) cm"
        } else {
            ui_outputMeterLabel.text = ""
            ui_outputPouceLabel.text = ""
            ui_outputCentimeterLabel.text = ""
        }
    }
    
}

