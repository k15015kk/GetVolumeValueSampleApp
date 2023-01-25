//
//  ViewController.swift
//  MPVolumeViewSample
//
//  Created by Inoue Haruki on 2023/01/25.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet private weak var getVolumeButton: UIButton!
    @IBOutlet private weak var displayVolumeLabel: UILabel!
    
    // MARK: - OtherView
    private let volumeView: UIView = MPVolumeView(frame: CGRect.zero)
    
    // MARK: - Properties
    private var volume: Float = 0.0 {
        didSet {
            displayVolumeLabel.text = "Volume: \(volume)"
        }
    }
    
    // MARK: - LifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBAction
    @IBAction func getVolumeAction(_ sender: Any) {
        volume = self.getVolumeValue()
    }
    
}

extension ViewController {
    
    /// デバイスのボリューム値を取得します
    /// - Returns: デバイスのボリューム値
    func getVolumeValue() -> Float {
        
        var volume: Float = -1.0
        
        /// ボリュームスライダーの取得
        /// スライダーの取得ができなかった場合は -1.0 をそのまま返す
        guard let slider = volumeView.subviews.compactMap({$0 as? UISlider}).first else {
            return volume
        }
        
        // スライダーの値を格納して、値を関数から返す
        volume = slider.value
        return volume
    }
}

