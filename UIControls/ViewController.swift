//
//  ViewController.swift
//  UIControls
//
//  Created by Yannis De Cleene on 17/11/14.
//  Copyright (c) 2014 Yannis De Cleene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var spark: SparkModel = SparkModel()
    var selectedValueLabelOne: UILabel?
    var selectedValueLabelTwo: UILabel?
    var selectedValueLabelThree: UILabel?
    var sliderOne: UISlider!
    var sliderTwo: UISlider!
    var sliderThree: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1.0)
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        let screenHeight = UIScreen.mainScreen().bounds.size.height
        
        
        // Create button to do something
        let button = UIButton.buttonWithType(UIButtonType.Custom) as UIButton
        button.frame = CGRectMake((screenWidth - 200) / 2.0, (screenHeight - 200) / 2.0, 200, 200)
        button.setTitle("Move servo!", forState: UIControlState.Normal)
        button.titleLabel!.font = UIFont.boldSystemFontOfSize(22)
        button.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
        
        // Create the first slider
        self.sliderOne = UISlider(frame: CGRectMake((screenWidth - 280) / 2.0, 100, 280, 20))
        sliderOne.minimumValue = 0
        sliderOne.maximumValue = 255
        sliderOne.continuous = false
        sliderOne.value = 0
        sliderOne.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(sliderOne)
        
        // Create labels to display the min/max values
        var minLabel = UILabel(frame: CGRectMake(40, 60, 40, 40))
        minLabel.text = String (Int(sliderOne.minimumValue))
        minLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(minLabel)
        
        var maxLabel = UILabel(frame: CGRectMake(320, 60, 40, 40))
        maxLabel.text = String (Int(sliderOne.maximumValue))
        maxLabel.textColor = UIColor.whiteColor()
        self.view.addSubview(maxLabel)
        
        // Create the second and the third slider, no min and max labels needed
        self.sliderTwo = UISlider(frame: CGRectMake((screenWidth - 280) / 2.0, 150, 280, 20))
        sliderTwo.minimumValue = 0
        sliderTwo.maximumValue = 255
        sliderTwo.continuous = false
        sliderTwo.value = 0
        sliderTwo.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(sliderTwo)
        
        self.sliderThree = UISlider(frame: CGRectMake((screenWidth - 280) / 2.0, 200, 280, 20))
        sliderThree.minimumValue = 0
        sliderThree.maximumValue = 255
        sliderThree.continuous = false
        sliderThree.value = 0
        sliderThree.addTarget(self, action: "sliderValueDidChange:", forControlEvents: .ValueChanged)
        self.view.addSubview(sliderThree)
        
        // Create labels to display selected value
        self.selectedValueLabelOne = UILabel(frame: CGRectMake((screenWidth) / 2.0, 60, 40, 40))
        self.selectedValueLabelOne!.text = String(Int(sliderOne.value))
        self.selectedValueLabelOne!.textColor = UIColor.whiteColor()
        self.view.addSubview(selectedValueLabelOne!)
        
        self.selectedValueLabelTwo = UILabel(frame: CGRectMake((screenWidth) / 2.0, 110, 40, 40))
        self.selectedValueLabelTwo!.text = String(Int(sliderTwo.value))
        self.selectedValueLabelTwo!.textColor = UIColor.whiteColor()
        self.view.addSubview(selectedValueLabelTwo!)
        
        self.selectedValueLabelThree = UILabel(frame: CGRectMake((screenWidth) / 2.0, 160, 40, 40))
        self.selectedValueLabelThree!.text = String(Int(sliderThree.value))
        self.selectedValueLabelThree!.textColor = UIColor.whiteColor()
        self.view.addSubview(selectedValueLabelThree!)
        
        
        // Create switch to turn something, like a LED, on/off
        var customSwitch = UISwitch(frame: CGRectMake((screenWidth - 50) / 2.0, 400, 50, 30))
        customSwitch.setOn(true, animated: true)
        customSwitch.addTarget(self, action: "stateChanged:", forControlEvents: .ValueChanged)
        self.view.addSubview(customSwitch)
    }
    
    func sliderValueDidChange(slider: UISlider)
    {
        self.selectedValueLabelOne!.text = String(Int(sliderOne.value))
        self.selectedValueLabelTwo!.text = String(Int(sliderTwo.value))
        self.selectedValueLabelThree!.text = String(Int(sliderThree.value))
        self.spark.sendJSONpost("rgb", parameters: "\(Int(sliderOne.value)),\(Int(sliderTwo.value)),\(Int(sliderThree.value))")
    }
    
    func pressed(sender: UIButton!)
    {
        println("pressed button")
    }
    
    func stateChanged(switchState: UISwitch) {
        if switchState.on {
            self.spark.sendJSONpost("led", parameters: "l1,HIGH")
        } else {
            self.spark.sendJSONpost("led", parameters: "l1,LOW")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

