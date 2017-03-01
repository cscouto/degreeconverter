//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Tiago Henrique on 2/28/17.
//  Copyright © 2017 Tiago Henrique. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var celsiusLbl: UILabel!
    @IBOutlet var fahrenTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsius()
    }
    
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahreinValue: Measurement<UnitTemperature>?{
        didSet{
            updateCelsius()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>?{
        if let fahreinValue = fahreinValue {
            return fahreinValue.converted(to: .celsius)
        }else{
            return nil
        }
    }
    
    func updateCelsius(){
        if let celsiusValue = celsiusValue{
            celsiusLbl.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        }else{
            celsiusLbl.text = "???"
        }
    }
    
    @IBAction func finishEditingTextField(_ textField: UITextField){
        if let text = textField.text, let value = Double(text){
            fahreinValue = Measurement(value: value, unit: .fahrenheit)
        }else{
            fahreinValue = nil
        }
    }
    
    @IBAction func dissmisKeyboard(_ sender: UITapGestureRecognizer){
        fahrenTextField.resignFirstResponder()
    }
    
    

}

