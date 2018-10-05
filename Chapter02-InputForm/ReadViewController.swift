//
//  ReadViewController.swift
//  Chapter02-InputForm
//
//  Created by 이상묵 on 02/10/2018.
//  Copyright © 2018 이상묵. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController {
    var pEmail: String?
    var pInterval: Double?
    var pUpdate: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        let email = UILabel()
        let interval = UILabel()
        let update = UILabel()
        
        email.frame = CGRect(x: 50, y: 100, width: 300, height: 30)
        interval.frame = CGRect(x: 50, y: 150, width: 300, height: 30)
        update.frame = CGRect(x: 50, y: 200, width: 300, height: 30)
        
        email.text = "전달 받은 이메일 : \(self.pEmail!)"
        update.text = "업데이트 여부 : \(self.pUpdate == true ? "업데이트 설정" :"업데이트 미설정")"
        interval.text = "업데이트 주기 : \(self.pInterval!)분 마다"
        
        self.view.addSubview(email)
        self.view.addSubview(update)
        self.view.addSubview(interval)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
