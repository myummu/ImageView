//
//  ViewController.swift
//  ImageView
//
//  Created by Clairaudience on 2023/07/03.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false // 확대 여부
    var imgOn: UIImage? // 켜진 전구 이미지
    var imgOff: UIImage? // 꺼진 전구 이미지
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
    }

    @IBAction func btnResizeImage(_ sender: Any) {
        // CGFloat == Float (xcode에서 재정의해 놓은 자료형)
        let scale: CGFloat = 2.0 // 이미지를 확대할 배율값
        var newWidth: CGFloat, newHeight: CGFloat // 이미지 가로, 세로 길이
        
        if(isZoom){ // true
            newWidth = imgView.frame.width / scale
            newHeight = imgView.frame.height / scale
            
            btnResize.setTitle("확대", for: .normal)
            // zoom이 되어 있을때, 버튼을 누르면 다시 작게 만들어주기
        }
        else{ // false
            newWidth = imgView.frame.width * scale
            newHeight = imgView.frame.height * scale
            
            btnResize.setTitle("축소", for: .normal)
        }
  
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom // 변수의 값을 현재 값의 반대로 변경
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            imgView.image = imgOn
        }
        else{
            imgView.image = imgOff
        }
    }
}

