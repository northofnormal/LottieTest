//
//  ViewController.swift
//  LottieTest
//
//  Created by mobility on 7/9/19.
//  Copyright © 2019 mobility. All rights reserved.
//

import Lottie
import SnapKit
import UIKit

class ViewController: UIViewController {
  
  let drinksButton = UIButton()
  let cycleButton = UIButton()
  let travelButton = UIButton()
  
  let drinksView = AnimationView(name: "drinks")
  let cycleView = AnimationView(name: "cycle")
  let travelView = AnimationView(name: "travel")
  var animationViews: [AnimationView] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    animationViews = [drinksView, cycleView]
    
    setButtons()
    setDrinksView()
    setCycleView()
    setTravelView()
  }
  
  func setButtons() {
    view.addSubview(drinksButton)
    drinksButton.backgroundColor = .gray
    drinksButton.setTitle("Drinks", for: .normal)
    
    drinksButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
    drinksButton.snp.makeConstraints { make in
      make.left.equalToSuperview().inset(20)
      make.top.equalToSuperview().inset(50)
      make.width.equalTo(75)
      make.height.equalTo(50)
    }
    
    view.addSubview(cycleButton)
    cycleButton.backgroundColor = .gray
    cycleButton.setTitle("Cycle", for: .normal)
    
    cycleButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
    cycleButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalToSuperview().inset(50)
      make.width.equalTo(75)
      make.height.equalTo(50)
    }
    
    view.addSubview(travelButton)
    travelButton.backgroundColor = .gray
    travelButton.setTitle("Travel", for: .normal)

    travelButton.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
    travelButton.snp.makeConstraints { make in
      make.right.equalToSuperview().inset(20)
      make.top.equalToSuperview().inset(50)
      make.width.equalTo(75)
      make.height.equalTo(50)
    }

  }
  
  func setDrinksView() {
    view.addSubview(drinksView)
    drinksView.alpha = 0
    drinksView.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }
  
  func setCycleView() {
    view.addSubview(cycleView)
    cycleView.alpha = 0
    cycleView.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }
  
  func setTravelView() {
    view.addSubview(travelView)
    travelView.alpha = 0
    travelView.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }
  
  @objc func buttonPressed(sender: UIButton) {
    switch sender {
    case drinksButton:
      showAnimation(view: drinksView)
      hideOtherViews(view: drinksView)
    case cycleButton:
      showAnimation(view: cycleView)
      hideOtherViews(view: cycleView)
    case travelButton:
      showAnimation(view: travelView)
      hideOtherViews(view: travelView)
    default:
      break
    }
  }
  
  func showAnimation(view: AnimationView) {
    view.alpha = 1
    view.loopMode = .loop
    view.play()
  }
  
  func hideOtherViews(view: AnimationView) {
    let otherViews = animationViews.filter { $0 != view }
    
    for view in otherViews {
      view.alpha = 0
      view.stop()
    }
  }
}

