//
//  FirstViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/20.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit
import AVFoundation
import GrowingTextView

class FirstView4Controller: UIViewController,UITabBarDelegate,UITextViewDelegate, SideMenuDelegate {
    var player:AVPlayer!
    private var myTabBar:MyTabBar!
    var ImageView: UIImageView!
    var heartcount = 0
    var flag = false
    var sideView : SideCommentMenu!
    static let commentbutton:UIButton = UIButton()
    let inputBackView = UIView()
    static let inputTextView = GrowingTextView()
    //送信ボタン
    let sendbutton:UIButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        //サイドメニューのボタン
        let imageArray = [UIImage(named:"commentON.png")!,UIImage(named:"heartON.png")!]
        //sideView = SideCommentMenu(image:imageArray, parentViewController:FirstViewController)
        //sideView.delegate = self
        //self.view.addSubview(sideView)
        //右スワイプ 検出
        let screenleftEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,  action: Selector(("leftEdgePanGesture:")))
        screenleftEdgeRecognizer.edges = .left
        self.view.addGestureRecognizer(screenleftEdgeRecognizer)
        
        //画面の幅、高さを取得
        let width = self.view.frame.width
        let height = self.view.frame.height
        //バックグラウンドカラーを指定
        view.backgroundColor = UIColor.black
/*
        let BoundSize_w:CGFloat = UIScreen.main.bounds.width
        let BoundSize_h:CGFloat = UIScreen.main.bounds.height
        let image = UIImage(named:"jobtokimage3")
        ImageView = UIImageView(frame: CGRect(x:0,y:0,width:
            BoundSize_w,height: BoundSize_h))
        ImageView.image = image
        ImageView.layer.position = CGPoint(x: BoundSize_w/2, y:BoundSize_h/2 )
        view.addSubview(ImageView)
 */
        

        //上スワイプ 検出
        let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.upViewDidAppear(_:)))
        upSwipeGesture.direction = .up
        // 画面にジェスチャーを登録
        view.addGestureRecognizer(upSwipeGesture)
        
        
        /*左スワイプ 検出
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.leftViewDidAppear(_:)))
        leftSwipeGesture.direction = .left
        // 画面にジェスチャーを登録
        view.addGestureRecognizer(leftSwipeGesture)
    */
        
        let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.downViewDidAppear(_:)))
        downSwipeGesture.direction = .down
        //画面にジェスチャーを登録
        view.addGestureRecognizer(downSwipeGesture)
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
        
        // 動画ファイルのURLを取得
        //let url = URL(string:"https://d2qguwbxlx1sbt.cloudfront.net/TextInMotion-VideoSample-576p.mp4")
        // 生成
        //let player = AVPlayer(url: url!)
        let path = Bundle.main.path(forResource: "movie3", ofType: "mp4")!
        // 生成
        player = AVPlayer(url: URL(fileURLWithPath: path))
        // レイヤーの追加
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        //self.view.layer.addSublayer(playerLayer)
        self.view.layer.insertSublayer(playerLayer, at: 0)
        // 再生
        player.play()
        
        //ハートアイコンのbutton作成
        let heartbutton:UIButton = UIButton()
        let heartrect:CGRect = CGRect(x: self.view.frame.width-50, y: self.view.frame.height*0.5, width: self.view.frame.width/12, height: self.view.frame.width/12)
        heartbutton.frame = heartrect;
        heartbutton.setTitleColor(.white, for: .normal)
        heartbutton.setImage(UIImage.init(named: "heartOFF"), for: UIControl.State.normal)
        heartbutton.addTarget(self, action: #selector(heartbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(heartbutton)
        //コメントアイコンのbutton作成
        let commentrect:CGRect = CGRect(x: self.view.frame.width-50, y: self.view.frame.height*0.6, width: self.view.frame.width/12, height: self.view.frame.width/12)
        FirstViewController.commentbutton.frame = commentrect;
        FirstViewController.commentbutton.setTitleColor(.white, for: .normal)
        FirstViewController.commentbutton.setImage(UIImage.init(named: "commentOFF"), for: UIControl.State.normal)
        FirstViewController.commentbutton.addTarget(self, action: #selector(commentbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(FirstViewController.commentbutton)
        
        // TextViewのバックViewの配置
        inputBackView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height+10, width: UIScreen.main.bounds.size.width, height: 30)
        inputBackView.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        self.view.addSubview(inputBackView)
        
        // UITextViewDelegateの設定
        FirstViewController.inputTextView.delegate = self
        FirstViewController.inputTextView.text = ""
        // UITextViewの配置
        FirstViewController.inputTextView.frame = CGRect(x: 1, y: 0, width: UIScreen.main.bounds.size.width-60, height: 30)
        
        inputBackView.addSubview(FirstViewController.inputTextView)
        
        //送信ボタン
        let sendrect:CGRect = CGRect(x: UIScreen.main.bounds.size.width-30, y: 15  , width: 55, height: 30)
        sendbutton.frame = sendrect;
        // 任意の場所に設置する
        sendbutton.layer.position = CGPoint(x:UIScreen.main.bounds.size.width-30 , y:15)
        // 枠の太さを変える
        sendbutton.layer.borderWidth = 0.5
        sendbutton.layer.cornerRadius = 4.0
        // 枠の色を変える
        sendbutton.backgroundColor = UIColor.orange
        sendbutton.setTitleColor(.white, for: .normal)
        sendbutton.setTitle("送信", for: .normal)
        sendbutton.setTitle("送信", for: .highlighted)
        // ボタンが押されたときの文字色
        sendbutton.setTitleColor(UIColor.white, for: UIControl.State.highlighted)
        sendbutton.addTarget(self, action: #selector(sendbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        inputBackView.addSubview(sendbutton)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Viewの表示時にキーボード表示・非表示を監視するObserverを登録する
        let notification = NotificationCenter.default
        notification.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Viewの終了時にキーボード表示・非表示時を監視していたObserverを解放する
        let notification = NotificationCenter.default
        notification.removeObserver(self)
        notification.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // returnキーが押された時の動作
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        FirstViewController.inputTextView.text = ""
        // キーボード表示時の動作をここに記述する
        guard let userInfo = notification.userInfo as? [String: Any] else {
            return
        }
        guard let keyboardInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        guard let duration:TimeInterval = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        let keyboardRect:CGRect = keyboardInfo.cgRectValue
        UIView.animate(withDuration: duration, animations: {
            self.inputBackView.frame.origin.y = keyboardRect.origin.y - self.inputBackView.frame.size.height
        },completion:{(finished:Bool) in
            self.inputBackView.frame.origin.y = keyboardRect.origin.y - self.inputBackView.frame.size.height
        })
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        SideCommentMenu.myCommenttextView.text = FirstViewController.inputTextView.text!
        // キーボード非表示時の動作をここに記述する
        guard let userInfo = notification.userInfo as? [String: Any] else {
            return
        }
        guard let keyboardInfo = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        guard let duration:TimeInterval = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double else {
            return
        }
        let keyboardRect:CGRect = keyboardInfo.cgRectValue
        UIView.animate(withDuration: duration, animations: {
            self.inputBackView.frame.origin.y = keyboardRect.origin.y - self.inputBackView.frame.size.height + 60
        },completion:{(finished:Bool) in
            self.inputBackView.frame.origin.y = UIScreen.main.bounds.size.height -  self.inputBackView.frame.size.height + 60
        })
    }
    //送信ボタンを押した時の処理
    @objc func sendbuttonEvent(_ sender: UIButton,count:Int) {
        var comment = FirstViewController.inputTextView.text!
        if comment == ""{
            comment = SideCommentMenu.myCommenttextView.text!
        }
        FirstViewController.inputTextView.text = ""
        SideCommentMenu.items.append(comment)
        SideCommentMenu.commenticon.append(UIImage(named:"iconA")!)
        SideCommentMenu.tableView?.reloadData()
        
    }

    /*  デリゲートメソッド  サイドメニューのボタンを押すと呼び出される
    func onClickButton(sender: UIButton) {
        let comment = sideView.myCommentTextField.text
        
        
        
        
        
        print("ok!!!!!!")
        
    }
    */
    //ハートアイコンのbuttonを押すと呼ばれる
    @objc func heartbuttonEvent(_ sender: UIButton,count:Int) {
        if self.heartcount == 0 {
            self.heartcount = 1
            sender.setImage(UIImage.init(named: "heartON"), for: UIControl.State.normal)
        }else{
        self.heartcount = 0
        sender.setImage(UIImage.init(named: "heartOFF"), for: UIControl.State.normal)
    }
    }
    //コメントアイコンのbuttonを押すと呼ばれる
    @objc func commentbuttonEvent(_ sender: UIButton,count:Int) {
        if SideCommentMenu.clearView.isHidden == true {
            SideCommentMenu.clearView.isHidden = false
            sideView.getButtonGesture(sender:sender)
            sender.setImage(UIImage.init(named: "commentON"), for: UIControl.State.normal)
        }else{
            SideCommentMenu.clearView.isHidden = true
            sideView.leftswipViewDidAppear(false)
            sender.setImage(UIImage.init(named: "commentOFF"), for: UIControl.State.normal)
            
            
        }
        
    
    }
   //タブバーを押すと呼ばれる
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag{
        case 1:
            self.player.pause()

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
    //サイドメニューを出す際のスワイプ で呼ばれる
    @objc func leftEdgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        sideView.getEdgeGesture(sender: sender)
    }
    
    //画面遷移　上スワイプ
    @objc func upViewDidAppear(_ animated: Bool) {
        self.player.pause()
        let pageController:UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let navigationController:SwipeNavigationViewController = SwipeNavigationViewController(rootViewController: pageController)
               
               //これがないと上に隙間ができる
        pageController.automaticallyAdjustsScrollViewInsets = false
               
        let firstView:UIViewController =  FirstView5Controller()
        let secondView:UIViewController =  SecondViewController()
        let thirdView:UIViewController = ThirdViewController()

        navigationController.viewControllerArray = [firstView,secondView,thirdView]
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    /*画面遷移　左スワイプ
    @objc func leftViewDidAppear(_ animated: Bool) {
        // 次の遷移先のViewControllerインスタンスを生成する
        let vc = SecondViewController()
        vc.modalTransitionStyle = .flipHorizontal
        // presentViewControllerメソッドで遷移する
        // ここで、animatedをtrueにするとアニメーションしながら遷移できる
        self.present(vc, animated: true, completion: nil)
    }*/
    //画面遷移　下スワイプ
    @objc func downViewDidAppear(_ animated: Bool) {
        
        // 戻る場合には、dismissViewControllerAnimatedメソッドを使います。
        // ここで、animatedをtrueにするとアニメーションしながら遷移できる
        self.dismiss(animated: true, completion: nil)
    }
    //他の場所を押すとキーボードが閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        SideCommentMenu.myCommenttextView.text = FirstViewController.inputTextView.text!
    }
    /*
    @IBAction func buttonTapped(_ sender: Any) {
        let pageController:UIPageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let navigationController:SwipeNavigationViewController = SwipeNavigationViewController(rootViewController: pageController)
        
        //これがないと上に隙間ができる
        pageController.automaticallyAdjustsScrollViewInsets = false
        
        let firstView = self.storyboard?.instantiateViewController(withIdentifier: "first") as! FirstViewController
        let secondView = self.storyboard?.instantiateViewController(withIdentifier: "second") as! SecondViewController

        navigationController.viewControllerArray = [firstView,secondView]
        
        present(navigationController, animated: true, completion: nil)
    }*/


    
}


    

 


