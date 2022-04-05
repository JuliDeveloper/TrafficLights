//
//  ViewController.swift
//  TrafficLights
//
//  Created by Julia Romanenko on 05.04.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redLightsView: UIView!
    @IBOutlet var yellowLightsView: UIView!
    @IBOutlet var greenLightsView: UIView!
    @IBOutlet var toggleButton: UIButton!
    
    let minAlpha = 0.3
    let maxAlpha = 1.0
    let circleRadius = 50.0
    let buttonRadius = 10.0
    
    var colorTagState = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        redLightsView.alpha = minAlpha
        yellowLightsView.alpha = minAlpha
        greenLightsView.alpha = minAlpha
        
        redLightsView.layer.cornerRadius = circleRadius
        yellowLightsView.layer.cornerRadius = circleRadius
        greenLightsView.layer.cornerRadius = circleRadius
        toggleButton.layer.cornerRadius = buttonRadius
        
        toggleButton.setTitle("START", for: .normal)
    }

    @IBAction func switchTrafficLights() {
        toggleButton.setTitle("NEXT", for: .normal)
                
        switch colorTagState {
            
        case redLightsView.tag:
            redLightsView.alpha = maxAlpha
            greenLightsView.alpha = minAlpha
            colorTagState = yellowLightsView.tag
            
        case yellowLightsView.tag:
            yellowLightsView.alpha = maxAlpha
            redLightsView.alpha = minAlpha
            colorTagState = greenLightsView.tag
            
        case greenLightsView.tag:
            greenLightsView.alpha = maxAlpha
            yellowLightsView.alpha = minAlpha
            colorTagState = redLightsView.tag
            
        default:
            break
        }
    }
}

