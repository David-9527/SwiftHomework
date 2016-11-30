//
//  ViewController.swift
//  StopWatch
//
//  Created by Damon on 2016/11/24.
//  Copyright © 2016年 damon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	// MARK: - view
	@IBOutlet weak var playBtn: UIButton!
	@IBOutlet weak var pauseBtn: UIButton!
	@IBOutlet weak var timeLabel: UILabel!
	
	// MARK: - private variable
	private var counter = 0.0
	private var timer:Timer? = Timer()
	
	
	// MARK: - life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		reset()
	}
	
	override var preferredStatusBarStyle : UIStatusBarStyle {
		return UIStatusBarStyle.lightContent
	}
	
	// MARK: - event response
	@IBAction func resetButtonDidTouch(_ sender: UIButton) {
		reset()
	}
	
	@IBAction func playButtonDidTouch(_ sender: UIButton) {
		timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
		
		switchButtonEnable()
	}
	
	@IBAction func pauseButtonDidTouch(_ sender: UIButton) {
		resetTimer()
		switchButtonEnable()
	}
	
	func updateTimer() {
		counter += 0.1
		timeLabel.text = String(format: "%.1f", counter)
	}
	
	// MARK: - private method
	private func reset() {
		resetTimer()
		counter = 0
		
		timeLabel.text = String(counter)
		
		playBtn.isEnabled  = true
		pauseBtn.isEnabled = false
	}
	
	private func resetTimer() {
		if let timer = timer , timer.isValid {
			timer.invalidate()
			self.timer = nil
		}
	}
	
	private func switchButtonEnable() {
		pauseBtn.isEnabled = !pauseBtn.isEnabled
		playBtn.isEnabled  = !playBtn.isEnabled
	}
	
}
