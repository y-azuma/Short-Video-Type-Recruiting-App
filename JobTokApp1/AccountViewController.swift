//
//  AccountViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/25.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit
import GrowingTextView

class AccountViewController: UIViewController,UITabBarDelegate,GrowingTextViewDelegate {
    private var myTabBar: MyTabBar!
    //テキスト入力
    var accounttextView = GrowingTextView()
    var passwordtextView = GrowingTextView()
    let falseTextView = UITextView()
    //決定ボタン
    let decidebutton:UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        let width = self.view.frame.width
        let height = self.view.frame.height
        //デフォルトは49
        let tabBarHeight:CGFloat = 58
        /**   TabBarを設置   **/
        myTabBar = MyTabBar()
        myTabBar.frame = CGRect(x:0,y:height - tabBarHeight,width:width,height:tabBarHeight)
        //バーの色①
        myTabBar.barTintColor = UIColor.black
        //選択されていないボタンの色②
        myTabBar.unselectedItemTintColor = UIColor.white
        //ボタンを押した時の色③
        myTabBar.tintColor = UIColor.cyan
        //ボタンを生成
        let top:UITabBarItem = UITabBarItem(title: "top", image: UIImage(named: "top30"), tag: 1)
        let search:UITabBarItem = UITabBarItem(title: "search", image: UIImage(named: "search30"), tag: 2)
        let account:UITabBarItem = UITabBarItem(title: "account", image: UIImage(named: "account30"), tag: 3)
        let calendar:UITabBarItem = UITabBarItem(title: "event", image: UIImage(named: "calendar30"), tag: 4)
        //ボタンをタブバーに配置する
        myTabBar.items = [top,search,account,calendar]
        //デリゲートを設定する
        myTabBar.delegate = self
        self.view.addSubview(myTabBar)
        
        //Growingtextview
        accounttextView.frame = CGRect(x: 50,y:50,width:240,height: 30)
        accounttextView.text = ""
        accounttextView.delegate = self
        accounttextView.placeholder = "ユーザ名"
        accounttextView.placeholderColor = UIColor.black
        accounttextView.maxHeight = 100
        accounttextView.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        accounttextView.layer.cornerRadius = 3.0
        accounttextView.tintColor = UIColor.black
        accounttextView.layer.position = CGPoint(x:width/2,y:(height-tabBarHeight)/2-50);
        self.view.addSubview(accounttextView)
        
        //Growingtextview
        passwordtextView.frame = CGRect(x: 50,y:150,width:240,height: 30)
        passwordtextView.text = ""
        passwordtextView.delegate = self
        passwordtextView.isSecureTextEntry = true
        passwordtextView.placeholder = "パスワード"
        passwordtextView.placeholderColor = UIColor.black
        passwordtextView.maxHeight = 100
        passwordtextView.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        passwordtextView.layer.cornerRadius = 3.0
        passwordtextView.tintColor = UIColor.black
        passwordtextView.layer.position = CGPoint(x:width/2,y:(height-tabBarHeight)/2+50);
        self.view.addSubview(passwordtextView)
        
        //決定ボタン
        let deciderect:CGRect = CGRect(x: width/2, y: (height-tabBarHeight)/2+150 , width: width/3, height: self.view.frame.width/8)
        decidebutton.frame = deciderect;
        // 任意の場所に設置する
        decidebutton.layer.position = CGPoint(x: width/2, y:(height-tabBarHeight)/2+150)
        // 枠の太さを変える
        decidebutton.layer.borderWidth = 0.5
        // 枠の色を変える
        //bookmarkbutton.layer.borderColor = UIColor.red.cgColor
        decidebutton.backgroundColor = UIColor.orange
        decidebutton.setTitleColor(.white, for: .normal)
        decidebutton.setTitle("決定", for: .normal)
        decidebutton.setTitle("決定する", for: .highlighted)
        // ボタンが押されたときの文字色
        decidebutton.setTitleColor(UIColor.white, for: UIControl.State.highlighted)
        //bookmarkbutton.setImage(UIImage.init(named: "jobtokimage20"), for: UIControl.State.normal)
        decidebutton.addTarget(self, action: #selector(decidebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(decidebutton)
        
        // UITextFieldを作成する.
        let falserect:CGRect = CGRect(x:width/2,y:(height-tabBarHeight)/2+100,width: 240,height: 50)
        falseTextView.frame = falserect;
        // 表示する文字を代入する.
        falseTextView.text = ""
        falseTextView.backgroundColor = UIColor.black
        //テキストカラー
        falseTextView.textColor = UIColor.red
        //フォント、文字サイズ
        falseTextView.font = UIFont(name: "Hiragino Sans", size: CGFloat(10))
        //テキスト編集不可
        falseTextView.isEditable = false
        // 枠を表示する.
        //falseTextField.borderStyle = UITextField.BorderStyle.roundedRect
        // UITextFieldの表示する位置を設定する.
        falseTextView.layer.position = CGPoint(x:width/2,y:(height-tabBarHeight)/2+100);
        //let range = NSMakeRange(falseTextField.text!.count - 1, 0)
        //falseTextField.setMarkedText(falseTextField.text, selectedRange: range)
        // Viewに追加する.
        self.view.addSubview(falseTextView)
    }
    //タブバーを押すと呼ばれる
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag{
        case 1:
            let pageController:UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
            let navigationController:SwipeNavigationViewController = SwipeNavigationViewController(rootViewController: pageController)
                   
                   //これがないと上に隙間ができる
            pageController.automaticallyAdjustsScrollViewInsets = false
                   
            let firstView:UIViewController =  FirstViewController()
            let secondView:UIViewController =  SecondViewController()
            let thirdView:UIViewController = ThirdViewController()

            navigationController.viewControllerArray = [firstView,secondView,thirdView]
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        case 2:
            let vc = SearchViewController()
            vc.modalPresentationStyle = .fullScreen
            //vc.modalTransitionStyle = .flipHorizontal
            self.present(vc,animated: false,completion: nil)
        case 3:
            let vc = AccountViewController()
            vc.modalPresentationStyle = .fullScreen
            //vc.modalTransitionStyle = .flipHorizontal
            self.present(vc,animated: false,completion: nil)
        case 4:
            let vc = CalendarViewController()
            vc.modalPresentationStyle = .fullScreen
            //vc.modalTransitionStyle = .flipHorizontal
            self.present(vc,animated: false,completion: nil)
        default : return
            
        }
    }
    //決定buttonを押すと呼ばれる
    @objc func decidebuttonEvent(_ sender: UIButton,count:Int) {
        if (accounttextView.text == "Azuma Yudai" && passwordtextView.text == "0000" ){
            falseTextView.text = ""
            let vc = StudentAccountViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc,animated: false,completion:nil)
        }else if(accounttextView.text == "Azuma Yudai" && passwordtextView.text == "1111"){
            falseTextView.text = ""
            let vc = StudentAccountViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc,animated: false,completion:nil)
            
        }else{
            falseTextView.text = "*アカウント名もしくはパスワードが違います。"
            
        }
    }
    //他の場所を押すとキーボードが閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
    //returnキーを押すとキーボードが閉じる
    func textFieldShouldReturn(_ textField: GrowingTextView) -> Bool {
        accounttextView.resignFirstResponder()
        return true
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
