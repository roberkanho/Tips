//
//  ViewController.swift
//  Tips
//
//  Created by Nan Chen on 4/12/15.
//  Copyright (c) 2015 Nan Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billamountText: UILabel!

    
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var darkShade: UIView!
    
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var tipperpersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "0.00"
        totalLabel.text = "$0.00"
        tipperpersonLabel.text = "0.00"
        peopleField.text = "1"
        
        UIView.animateWithDuration(0.3, delay: 0.8, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: nil, animations: { () -> Void in
            self.card.frame.origin.y = 120
        }, completion: nil)
    
    }

    @IBAction func onGotItBtn(sender: AnyObject) {
        UIView.animateWithDuration(0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: nil, animations: { () -> Void in
            self.card.frame.origin.y = 580
        }) { (Bool) -> Void in
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                self.darkShade.alpha = 0
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
       
        var tipPercentages = [0.15, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var eachperson = total / NSString(string: peopleField.text).doubleValue
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipperpersonLabel.text = "$\(eachperson)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        tipperpersonLabel.text = String(format: "$%.2f", eachperson)
        
        self.billamountText.alpha = 0
        
    }


    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

