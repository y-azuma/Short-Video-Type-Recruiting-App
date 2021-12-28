//
//  SecondViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/20.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit

class Second3ViewController: UIViewController {
    
    var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let BoundSize_w:CGFloat = UIScreen.main.bounds.width
        let BoundSize_h:CGFloat = UIScreen.main.bounds.height
        let image = UIImage(named:"jobtokimage8")
        ImageView = UIImageView(frame: CGRect(x:0,y:0,width:
            BoundSize_w,height: BoundSize_h))
        ImageView.image = image
        ImageView.layer.position = CGPoint(x: BoundSize_w/2, y:BoundSize_h/2 )
        view.addSubview(ImageView)
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.rightViewDidAppear(_:)))
        rightSwipeGesture.direction = .right
        // 画面にジェスチャーを登録
        view.addGestureRecognizer(rightSwipeGesture)
        
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.leftViewDidAppear(_:)))
        leftSwipeGesture.direction = .left
        // 画面にジェスチャーを登録
        view.addGestureRecognizer(leftSwipeGesture)
        
        
        
        // Do any additional setup after loading the view.
        
    }
    @objc func rightViewDidAppear(_ animated: Bool) {
        
        // 戻る場合には、dismissViewControllerAnimatedメソッドを使います。
        // ここで、animatedをtrueにするとアニメーションしながら遷移できる
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func leftViewDidAppear(_ animated: Bool) {
        // 次の遷移先のViewControllerインスタンスを生成する
        let vc = Third3ViewController()
        vc.modalTransitionStyle = .flipHorizontal
        // presentViewControllerメソッドで遷移する
        // ここで、animatedをtrueにするとアニメーションしながら遷移できる
        self.present(vc, animated: true, completion: nil)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
