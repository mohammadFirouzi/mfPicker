# mfPicker

[![Version](https://img.shields.io/cocoapods/v/mfPicker.svg?style=flat)](https://cocoapods.org/pods/mfPicker)
[![License](https://img.shields.io/cocoapods/l/mfPicker.svg?style=flat)](https://cocoapods.org/pods/mfPicker)
[![Platform](https://img.shields.io/cocoapods/p/mfPicker.svg?style=flat)](https://cocoapods.org/pods/mfPicker)


<p align="center">
  <img src="https://s7.gifyu.com/images/mfPicker.png" width="50%" />
</p>


## Installation

mfPicker is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'mfPicker'
```

Or just import mfPicker.swift to your project

## Usage

```swift
import UIKit
import mfPicker

class ViewController: UIViewController {
    
    var myMfPicker = mfPicker()
    let objectsArray = ["Berlin","Paris","Amesterdam","Rome","London","Istanbul","Moscow","Seoul","Tokyo"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set UIPickerView delegate and dataSource
        myMfPicker.picker.delegate = self
        myMfPicker.picker.dataSource = self
        //Set myMfPicker delegate if you need
        myMfPicker.delegate = self
        //Customizations can also be done in this way
        myMfPicker.lblTitle.text = "select city"

    }

    @IBAction func btnPressed(_ sender: Any) {
        myMfPicker.present(on: self.view)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return objectsArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return objectsArray[row]
    }
    
}

extension ViewController: mfPickerDelegate {
    func mfPickerSubmitButtonDidPressed(selectedRow: Int) {
        print("Selected row : \(selectedRow)")
    }
    
    func mfPickerCancelButtonDidPressed() {

    }
    
    func mfPickerWillDismiss() {
        
    }
    
    func mfPickerDidDismiss() {
        
    }
}
```

## Author

Mohammad Firouzi, mohammad.spz@icloud.com

## License

mfPicker is available under the MIT license. See the LICENSE file for more info.
