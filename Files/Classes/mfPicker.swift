//
//  mfPicker.swift
//  mfPickerComponent
//
//  Created by Mohammad Firoozi on 5/19/20.
//  Copyright © 2020 Mohammad Firouzi. All rights reserved.
//

import Foundation
import UIKit

public class mfPicker: UIView {
    
    public weak var delegate        : mfPickerDelegate? = nil
    
    
    // MARK: - constants
    private var parentView          = UIView()
    private var vwHeaderHeight      = CGFloat(50)
    private var vwMainHeight        = CGFloat(300)
    private var cnsMainToBottom     = NSLayoutConstraint()
    
    
    // MARK: - views
    public var vwMain               = UIView()
    public var vwHeader             = UIView()
    public var lblTitle             = UILabel()
    public var btnSubmit            = UIButton()
    public var btnCancel            = UIButton()
    public var vwBody               = UIView()
    public var picker               = UIPickerView()
    
    
    // MARK: - initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    public init() {
        super.init(frame: .zero)
        prepareViews()
        prepareFunctionality()
    }
    
    
    // MARK: - settingUp views
    private func prepareViews(){
        cnsMainToBottom = self.bottomAnchor.constraint(equalTo: vwMain.bottomAnchor)
        
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        vwHeader.backgroundColor = .lightGray
        vwBody.backgroundColor = .white
        
        lblTitle.text = "select item"
        lblTitle.font = UIFont.systemFont(ofSize: 17)
        lblTitle.textColor = .black
        lblTitle.textAlignment = .center
        
        btnSubmit.setTitle("submit", for: .normal)
        btnSubmit.setTitleColor(.black, for: .normal)
        btnSubmit.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        btnCancel.setTitle("cancel", for: .normal)
        btnCancel.setTitleColor(.black, for: .normal)
        btnCancel.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        vwHeader.addSubview(lblTitle)
        vwHeader.addSubview(btnSubmit)
        vwHeader.addSubview(btnCancel)
        vwBody.addSubview(picker)
        vwMain.addSubview(vwHeader)
        vwMain.addSubview(vwBody)
        self.addSubview(vwMain)
        
        vwHeader.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        btnSubmit.translatesAutoresizingMaskIntoConstraints = false
        btnCancel.translatesAutoresizingMaskIntoConstraints = false
        vwBody.translatesAutoresizingMaskIntoConstraints = false
        picker.translatesAutoresizingMaskIntoConstraints = false
        vwMain.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([vwHeader.topAnchor.constraint(equalTo: vwMain.topAnchor, constant: 0),
                                     vwHeader.leadingAnchor.constraint(equalTo: vwMain.leadingAnchor, constant: 0),
                                     vwHeader.trailingAnchor.constraint(equalTo: vwMain.trailingAnchor, constant: 0),
                                     vwHeader.heightAnchor.constraint(equalToConstant: vwHeaderHeight)])
        
        NSLayoutConstraint.activate([vwBody.topAnchor.constraint(equalTo: vwHeader.bottomAnchor, constant: 0),
                                     vwBody.leadingAnchor.constraint(equalTo: vwMain.leadingAnchor, constant: 0),
                                     vwBody.trailingAnchor.constraint(equalTo: vwMain.trailingAnchor, constant: 0),
                                     vwBody.bottomAnchor.constraint(equalTo: vwMain.bottomAnchor, constant: 0)])
        
        NSLayoutConstraint.activate([picker.topAnchor.constraint(equalTo: vwBody.topAnchor, constant: 0),
                                     picker.leadingAnchor.constraint(equalTo: vwBody.leadingAnchor, constant: 0),
                                     picker.trailingAnchor.constraint(equalTo: vwBody.trailingAnchor, constant: 0),
                                     picker.bottomAnchor.constraint(equalTo: vwBody.bottomAnchor, constant: 0)])
        
        NSLayoutConstraint.activate([btnSubmit.leadingAnchor.constraint(equalTo: vwHeader.leadingAnchor, constant: 16),
                                     btnSubmit.centerYAnchor.constraint(equalTo: vwHeader.centerYAnchor, constant: 0),
                                     btnCancel.trailingAnchor.constraint(equalTo: vwHeader.trailingAnchor, constant: -16),
                                     btnCancel.centerYAnchor.constraint(equalTo: vwHeader.centerYAnchor, constant: 0),
                                     lblTitle.centerYAnchor.constraint(equalTo: vwHeader.centerYAnchor, constant: 0),
                                     lblTitle.centerXAnchor.constraint(equalTo: vwHeader.centerXAnchor, constant: 0)])
        
        cnsMainToBottom.constant = -1 * vwMainHeight
        NSLayoutConstraint.activate([vwMain.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
                                     vwMain.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
                                     vwMain.heightAnchor.constraint(equalToConstant: vwMainHeight),
                                     cnsMainToBottom])
        
    }
    
    
    // MARK: - settingUp functionality
    private func prepareFunctionality(){
        
        self.isUserInteractionEnabled = true
        let tapOnSelf = UITapGestureRecognizer(target: self, action: #selector(tappedSelf))
        tapOnSelf.delegate = self
        self.addGestureRecognizer(tapOnSelf)
        
        btnSubmit.addTarget(self, action: #selector(submitPressed), for: .touchUpInside)
        btnCancel.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        
    }
    
    @objc private func tappedSelf(){
        dismiss()
    }
    
    @objc private func cancelPressed(){
        delegate?.mfPickerCancelButtonDidPressed()
        dismiss()
    }
    
    @objc private func submitPressed(){
        delegate?.mfPickerSubmitButtonDidPressed()
        dismiss()
    }
    
    
    // MARK: - present on superView
    public func present(on view: UIView){
        parentView = view
        parentView.addSubview(self)
        
        self.alpha = 0.0
        NSLayoutConstraint.activate([self.topAnchor.constraint(equalTo: parentView.topAnchor, constant: 0),
                                     self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: 0),
                                     self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: 0),
                                     self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: 0)])
        
        parentView.layoutIfNeeded()
        UIView.animate(withDuration: 0.37) {
            self.cnsMainToBottom.constant = 0
            self.alpha = 1.0
            self.parentView.layoutIfNeeded()
        }
    }
    
    
    // MARK: - dismiss
    public func dismiss(){
        delegate?.mfPickerWillDismiss()
        UIView.animate(withDuration: 0.37, animations: {
            self.alpha = 0.0
            self.cnsMainToBottom.constant = -1 * self.vwMainHeight
            self.parentView.layoutIfNeeded()
        }) { (success) in
            self.removeFromSuperview()
            self.delegate?.mfPickerDidDismiss()
        }
    }
}


// MARK: - delegates
extension mfPicker : UIGestureRecognizerDelegate {
    //prevent dismissing when tapped on vwMain
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: vwMain) == true {
            return false
        }
        return true
    }
}


// MARK: - protocol

public protocol mfPickerDelegate: class {
    func mfPickerSubmitButtonDidPressed()
    func mfPickerCancelButtonDidPressed()
    func mfPickerWillDismiss()
    func mfPickerDidDismiss()
}

public extension mfPickerDelegate {
    func mfPickerSubmitButtonDidPressed(){}
    func mfPickerCancelButtonDidPressed(){}
    func mfPickerWillDismiss(){}
    func mfPickerDidDismiss(){}
}
