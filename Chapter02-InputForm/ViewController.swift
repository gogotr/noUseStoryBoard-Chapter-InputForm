//
//  ViewController.swift
//  Chapter02-InputForm
//
//  Created by 이상묵 on 02/10/2018.
//  Copyright © 2018 이상묵. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var paramEmail: UITextField!
    var paramUpdate: UISwitch!
    var paramInterval: UIStepper!
    var txtUpdate: UILabel!
    var txtInterval: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //네비게이션 타이틀 설정
        self.navigationItem.title = "설정"
        
        //레이블생성하고 영역과 기본 문구를 생성한다
        let lblEmail = UILabel()
        lblEmail.frame = CGRect(x: 30, y: 100, width: 100, height: 30)
        lblEmail.text = "이메일"
        lblEmail.font = UIFont.systemFont(ofSize: 14)
        
        let lblUpdate = UILabel()
        lblUpdate.frame = CGRect(x: 30, y: 150, width: 100, height: 30)
        lblUpdate.text = "업데이트"
        lblUpdate.font = UIFont.systemFont(ofSize: 14)
        
        let lblInterval = UILabel()
        lblInterval.frame = CGRect(x: 30, y: 200, width: 100, height: 30)
        lblInterval.text = "갱신주기"
        lblInterval.font = UIFont.systemFont(ofSize: 14)
        
        self.view.addSubview(lblEmail)
        self.view.addSubview(lblUpdate)
        self.view.addSubview(lblInterval)
        
        //textField
        self.paramEmail = UITextField()
        self.paramEmail.frame = CGRect(x: 120, y: 100, width: 220, height: 30)
        self.paramEmail.font = UIFont.systemFont(ofSize: 13)
        self.paramEmail.textAlignment = NSTextAlignment.right
        self.paramEmail.adjustsFontSizeToFitWidth = true
        self.paramEmail.placeholder = "E-Mail"
        self.paramEmail.autocapitalizationType = .none
        //모서리가 얇은 테두리
        self.paramEmail.borderStyle = UITextBorderStyle.roundedRect
        self.view.addSubview(paramEmail)
        
        //switch
        self.paramUpdate = UISwitch()
        self.paramUpdate.frame = CGRect(x: 120, y: 150, width: 50, height: 30)
        self.paramUpdate.setOn(false, animated: true)
        self.view.addSubview(paramUpdate)
        
        //stepper
        self.paramInterval = UIStepper()
        self.paramInterval.frame = CGRect(x: 120, y: 200, width: 50, height: 30)
        self.paramInterval.minimumValue = 0
        self.paramInterval.maximumValue = 100
        self.paramInterval.stepValue = 1 // 값 변경 단위
        self.paramInterval.value = 0 // 초기값
        
        self.view.addSubview(paramInterval)
        
        //update value print label
        self.txtUpdate = UILabel()
        self.txtUpdate.frame = CGRect(x: 250, y: 150, width: 100, height: 30)
        self.txtUpdate.textColor = UIColor.red
        self.txtUpdate.text = ""
        self.view.addSubview(txtUpdate)
        
        //stepper value print label
        self.txtInterval = UILabel()
        self.txtInterval.frame = CGRect(x: 250, y: 200, width: 100, height: 30)
        self.txtInterval.font = UIFont.systemFont(ofSize: 12)
        self.txtInterval.textColor = UIColor.red
        self.txtInterval.text = "0분마다"
        self.view.addSubview(txtInterval)
        
        //evert add
        self.paramInterval.addTarget(self, action: #selector(presentIntervalValue(_:)), for: .touchUpInside)
        self.paramUpdate.addTarget(self, action: #selector(presentUpdateValue(_:)), for: .touchUpInside)
        
        
        //submit button
        let submitBtn = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(submitBtnAction(_:)))
        self.navigationItem.rightBarButtonItem = submitBtn
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func submitBtnAction(_ sender: UIButton)
    {
        let rvc = ReadViewController()
        rvc.pEmail = self.paramEmail.text
        rvc.pUpdate = self.paramUpdate.isOn
        rvc.pInterval = self.paramInterval.value
        
        self.navigationController?.pushViewController(rvc, animated: true)
    }
    @objc func presentUpdateValue(_ sender: UISwitch)
    {
        self.txtUpdate.text = (sender.isOn == true ? "갱신함" : "갱신하지않음")
    }
    
    @objc func presentIntervalValue(_ sender: UIStepper)
    {
        self.txtInterval.text = "\(Int(sender.value))분 마다"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

