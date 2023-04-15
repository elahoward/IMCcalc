//
//  ViewController.swift
//  IMCcalc
//
//  Created by Ela Howard on 2023-04-14.
//  Copyright © 2023 Ela Howard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ControlCalc = ControlCalc()
    var BMIvalue:String
    var BMIvalue = "0.0"
    
    @IBOutlet weak var TailleSlider: UISlider!
    @IBOutlet weak var PoidsSlider: UISlider!
    @IBOutlet weak var lblTaille: UILabel!
    @IBOutlet weak var lblPoids: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sTaille(_ sender: UISlider) {
        let taille = String(format:"%.2f", sender.value)
        lblTaille.text = "\(taille) m"
    }
    
    @IBAction func sPoids(_ sender: UISlider) {
        let poids = String(format:"%.0f", sender.value)
             lblPoids.text = "\(poids) m"
    }
    
    @IBAction func CalculPress(_ sender: UIButton) {
        let fTaille = TailleSlider.value
           
        let fPoids = PoidsSlider.value
        
        let BMI=fPoids/(fTaille*fTaille)
        BMIvalue=String(format: "%.1", BMI)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="goToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.BMIvalue = BMIvalue
        }
    }
    
}


