//
//  CustomWaveView.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 31/07/2022.
//

import UIKit

class CustomWaveView: UIView {
    
    // MARK: - Properties
    private let firstLayer = CAShapeLayer()
    private let secondLayer = CAShapeLayer()
    
    private let percentLabel = UILabel()
    
    private var firstColor: UIColor = .clear
    private var secondColor: UIColor = .clear
    
    private let twoP: CGFloat = .pi * 2
    private var offset: CGFloat = 0.0
    
    private let width = 200.0
    
    var showSingleWave = false
    private var start = false
    
    var progress: CGFloat = 0.0
    var waveHeight: CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomWaveView {
    
    private func setupViews() {
        bounds = CGRect(x: 0.0, y: 0.0, width: min(width, width), height: min(width, width))
        clipsToBounds = true
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = width / 2
        layer.masksToBounds = true
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        
        waveHeight = 8.0
        
        firstColor = .cyan
        secondColor = .cyan.withAlphaComponent(0.4)
        
        createFirstLayer()
        
        if !showSingleWave {
            createSecondLayer()
        }
        
        createPercentLabel()
    }
    
    private func createPercentLabel() {
        percentLabel.font = UIFont.boldSystemFont(ofSize: 35)
        percentLabel.textAlignment = .center
        percentLabel.text = ""
        percentLabel.textColor = .darkGray
        addSubview(percentLabel)
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        percentLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func createSecondLayer() {
        secondLayer.frame = bounds
        secondLayer.anchorPoint = .zero
        secondLayer.fillColor = secondColor.cgColor
        layer.addSublayer(secondLayer)
    }
    
    private func createFirstLayer() {
        firstLayer.frame = bounds
        firstLayer.anchorPoint = .zero
        firstLayer.fillColor = firstColor.cgColor
        layer.addSublayer(firstLayer)
    }
    
    func percentAnimation() {
        let animation = CABasicAnimation(keyPath: "opacity")
        animation.duration = 1.5
        animation.fromValue = 0.0
        animation.toValue = 1.0
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        
        percentLabel.layer.add(animation, forKey: nil)
    }
    
    func setupProgress(_ _progress: CGFloat) {
        progress = _progress
        
        percentLabel.text = String(format: "%ld%%", NSNumber(value: Float(_progress * 100)).intValue)
        
        let top: CGFloat = _progress * bounds.size.height
        firstLayer.setValue(width-top, forKeyPath: "position.y")
        secondLayer.setValue(width-top, forKeyPath: "position.y")
        
        if !start {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.startAnimation()
            }
        }
    }
    
    private func startAnimation() {
        start = true
        waterWaveAnimation()
    }
    
    private func waterWaveAnimation() {
        let _width = bounds.size.width
        let _height = bounds.size.height
        
        let bezier = UIBezierPath()
        let path = CGMutablePath()
        
        let startOffsetY = waveHeight * CGFloat(sinf(Float(offset * twoP / _width)))
        var originOffsetY: CGFloat = 0.0
        
        path.move(to: CGPoint(x: 0.0, y: startOffsetY), transform: .identity)
        bezier.move(to: CGPoint(x: 0.0, y: startOffsetY))
        
        for i in stride(from: 0.0, to: _width * 1000, by: 1) {
            originOffsetY = waveHeight * CGFloat(sinf(Float(twoP / _width * i + offset * twoP / _width)))
            bezier.addLine(to: CGPoint(x: i, y: originOffsetY))
        }
        
        bezier.addLine(to: CGPoint(x: _width * 1000, y: originOffsetY))
        bezier.addLine(to: CGPoint(x: _width * 1000, y: _height))
        bezier.addLine(to: CGPoint(x: 0.0, y: _height))
        bezier.addLine(to: CGPoint(x: 0.0, y: startOffsetY))
        bezier.close()
        
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.duration = 2.0
        animation.fromValue = -_width * 0.5
        animation.toValue = -_width - _width * 0.5
        animation.repeatCount = .infinity
        animation.isRemovedOnCompletion = false
        
        firstLayer.fillColor = firstColor.cgColor
        firstLayer.path = bezier.cgPath
        firstLayer.add(animation, forKey: nil)
        
        if !showSingleWave {
            let bezier = UIBezierPath()
            
            let startOffsetY = waveHeight * CGFloat(sinf(Float(offset * twoP / _width)))
            var originOffsetY: CGFloat = 0.0
            
            path.move(to: CGPoint(x: 0.0, y: startOffsetY), transform: .identity)
            bezier.move(to: CGPoint(x: 0.0, y: startOffsetY))
            
            for i in stride(from: 0.0, to: _width * 1000, by: 1) {
                originOffsetY = waveHeight * CGFloat(cosf(Float(twoP / _width * i + offset * twoP / _width)))
                bezier.addLine(to: CGPoint(x: i, y: originOffsetY))
            }
            
            bezier.addLine(to: CGPoint(x: _width * 1000, y: originOffsetY))
            bezier.addLine(to: CGPoint(x: _width * 1000, y: _height))
            bezier.addLine(to: CGPoint(x: 0.0, y: _height))
            bezier.addLine(to: CGPoint(x: 0.0, y: startOffsetY))
            bezier.close()
            
            secondLayer.fillColor = secondColor.cgColor
            secondLayer.path = bezier.cgPath
            secondLayer.add(animation, forKey: nil)
        }
    }
}
