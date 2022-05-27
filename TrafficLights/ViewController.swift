//
//  ViewController.swift
//  TrafficLights
//
//  Created by Julia Romanenko on 05.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var toggleButton: UIButton!
    
    private let minAlpha = 0.3
    private let maxAlpha = 1.0
    
    private var colorTagState = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        redLightView.alpha = minAlpha
        yellowLightView.alpha = minAlpha
        greenLightView.alpha = minAlpha
        
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.width / 2
        toggleButton.layer.cornerRadius = 10.0
        
        toggleButton.setTitle("START", for: .normal)
    }

    @IBAction func switchTrafficLights() {
        toggleButton.setTitle("NEXT", for: .normal)
                
        switch colorTagState {
            
        case redLightView.tag:
            redLightView.alpha = maxAlpha
            greenLightView.alpha = minAlpha
            colorTagState = yellowLightView.tag
            
        case yellowLightView.tag:
            yellowLightView.alpha = maxAlpha
            redLightView.alpha = minAlpha
            colorTagState = greenLightView.tag
            
        default:
            greenLightView.alpha = maxAlpha
            yellowLightView.alpha = minAlpha
            colorTagState = redLightView.tag
        }
    }
}

