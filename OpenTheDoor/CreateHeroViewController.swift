//
//  CreateHeroViewController.swift
//  OpenTheDoor
//
//  Created by Daniel Hansson on 2016-05-10.
//  Copyright © 2016 Daniel Hansson. All rights reserved.
//

import UIKit

class CreateHeroViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var nameInputField: UITextField!

    @IBOutlet weak var heroLabel: UILabel!
    
    @IBOutlet weak var typePicker: UIPickerView!
    
    @IBOutlet weak var skillPicker: UIPickerView!
    
    var playerName: String = ""
    var playerType: String = ""
    var playerSkill: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typePicker.dataSource = self
        typePicker.delegate = self
        
        skillPicker.dataSource = self
        skillPicker.delegate = self
        
        typePicker.tag = 0
        skillPicker.tag = 1

        // Do any additional setup after loading the view.
    }

    @IBAction func go(sender: AnyObject) {
        playerName = nameInputField.text!
        let hero = Hero(name: playerName, type: playerType, skill: playerSkill)
        hero.printHeroDescription()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Delegates and data sources
    //MARK: Data Sources
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return typeData.count
        }
        return skillData.count
    }
    
    //MARK: Delegates
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return typeData[row]
        }
        return skillData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //heroLabel.text = typeData[row]
        if pickerView.tag == 0 {
            playerType = typeData[row]
        }else {
            playerSkill = skillData[row]
        }
        
        heroLabel.text = "\(playerType) \(nameInputField.text!) with \(playerSkill)"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
