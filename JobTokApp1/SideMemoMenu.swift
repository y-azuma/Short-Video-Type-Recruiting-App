//
//  SideMemoMenu.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/09/19.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit
import GrowingTextView


class SideMemoMenu: UIView,GrowingTextViewDelegate {
    //デリゲートのインスタンスを宣言
    weak var delegate: SideMenuDelegate?
    
    var size: CGRect
    static var clearView : UIView!
    var menuView : UIView!
    var parentVC: UIViewController!
    var swipeGesture : UISwipeGestureRecognizer!
    var isSideMenuhidden: Bool = true
    var rightConstraint: NSLayoutConstraint!
    var myCommentTextField: UITextField!
    var myCommenttextView = GrowingTextView()
    var comment = ""
    var n_of_comment:Int = 0
    var myTextView:UITextView!
    
    //イニシャライザー
    init(image: [UIImage],parentViewController: ThirdViewController) {
        self.size = CGRect(x:UIScreen.main.bounds.width, //画面の外に配置
            y:0,
            width:UIScreen.main.bounds.width*2,
            height:UIScreen.main.bounds.height
        )
        super.init(frame:size)
        //サイドメニューの背景色
        self.backgroundColor = UIColor.white
        //サイドメニューの背景色の透過度
        self.alpha = 0.7
        //コメントバーを作成するcommentTextfield関数を呼び出す
        self.commentTextField()
        //親ViewControllerを指定
        self.parentVC = parentViewController
        //メニュー以外の場所をタップしたときにメニューを下げる
        SideMemoMenu.clearView = UIView(frame:CGRect(x:0,y:0,
                                        width:UIScreen.main.bounds.width*1/3,
                                        height:UIScreen.main.bounds.height
        ))
        parentVC.view.insertSubview(SideMemoMenu.clearView, at: 1)
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(self.clearViewTapped)
        )
        tapGesture.numberOfTapsRequired = 1
        SideMemoMenu.clearView.isHidden = true
        SideMemoMenu.clearView.addGestureRecognizer(tapGesture)
        
        //右スワイプ 検出　メニューを下げる
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.rightswipViewDidAppear(_:)))
        rightSwipeGesture.direction = .right
        // 画面にジェスチャーを登録
        self.addGestureRecognizer(rightSwipeGesture)
        
        // UIImage インスタンスの生成
        let swipimage:UIImage = UIImage(named:"swip1")!
        // UIImageView 初期化
        let SwipView = UIImageView(image:swipimage)
        // 画像の縦横サイズを取得
        let imgWidth:CGFloat = swipimage.size.width
        let imgHeight:CGFloat = swipimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        let scale:CGFloat = imgHeight / imgWidth
        let screenwidth = UIScreen.main.bounds.width*2/3-60
        let rect:CGRect =
            CGRect(x:10, y:30, width:Int(screenwidth), height:Int(screenwidth*scale)-5)
        // ImageView frame をCGRectで作った矩形に合わせる
        SwipView.frame = rect;
        // UIImageViewのインスタンスをビューに追加
        //self.addSubview(SwipView)
        /*
        let sendbutton = UIButton(frame: CGRect(x: Int(UIScreen.main.bounds.width*1/3), y: Int(UIScreen.main.bounds.height-100), width: 60, height: 60))
        //ボタンの画像
        sendbutton.setImage(UIImage.init(named: "jobtokimage22"), for: UIControl.State.normal)
        //ボタンの四隅に余白をつける
        sendbutton.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        //ボタンの背景色
        sendbutton.backgroundColor = UIColor.yellow
        // サイズの半分の値を設定 (丸いボタンにするため)
        sendbutton.layer.cornerRadius = 30
        //ボタンをおした時の動作
        sendbutton.addTarget(self,
                         action:#selector(self.onClickButton(sender:)),
                         for: .touchUpInside)
        self.addSubview(sendbutton)
         */
        
        //textview
        // TextView生成する.
        myTextView = UITextView(frame: CGRect(x:10, y:50, width: Int(UIScreen.main.bounds.width*2/3-20), height: Int((UIScreen.main.bounds.height*0.6)-70)))
        // 表示させるテキストを設定する.
        myTextView.text = ""
        myTextView.font = UIFont(name: "Hiragino Sans", size: CGFloat(15))
        // フォントの色の設定をする.
        myTextView.textColor = UIColor.black
        // 左詰めの設定をする.
        //myTextView.textAlignment = NSTextAlignment.left
        // TextViewをViewに追加する.
        self.addSubview(myTextView)
        
        // Labelを作成.
        let memoLabel: UILabel = UILabel(frame: CGRect(x: 0,y: 0,width: 150,height: 35))
        // 背景をオレンジ色にする.
        memoLabel.backgroundColor = UIColor.white
        // 枠を丸くする.
        memoLabel.layer.masksToBounds = true
        // コーナーの半径.
        memoLabel.layer.cornerRadius = 20.0
        // Labelに文字を代入.
        memoLabel.text = "MEMO"
        //fontの指定
        memoLabel.font = UIFont(name: "Hiragino Sans", size: CGFloat(20))
        // 文字の色を白にする.
        memoLabel.textColor = UIColor.black
        // 文字の影の色をグレーにする.
        memoLabel.shadowColor = UIColor.gray
        // Textを中央寄せにする.
        memoLabel.textAlignment = NSTextAlignment.center
        // 配置する座標を設定する.
        memoLabel.layer.position = CGPoint(x: UIScreen.main.bounds.width*1/3,y: 35)
        // ViewにLabelを追加.
        self.addSubview(memoLabel)
        
        
    }
    //UIViewを継承したクラスには必要?ここら辺よくわかりません
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //右スワイプでメニューを下げる
    @objc func rightswipViewDidAppear(_ animated: Bool) {
        ThirdViewController.commentbutton.setImage(UIImage.init(named: "commentOFF"), for: UIControl.State.normal)
        SideMemoMenu.clearView.isHidden = true
        UIView.animate(withDuration: 0.8,
                       animations: {
                        self.frame.origin.x = UIScreen.main.bounds.width*2
        },
                       completion:nil)
    }
    //タップでメニューを下げる
    @objc func clearViewTapped(){
        if SideMemoMenu.clearView.isHidden == false {
            ThirdViewController.commentbutton.setImage(UIImage.init(named: "commentOFF"), for: UIControl.State.normal)
            SideMemoMenu.clearView.isHidden = true
            UIView.animate(withDuration: 0.8,
                           animations: {
                            self.frame.origin.x = UIScreen.main.bounds.width
            },
                           completion:nil)
        }
    }
    //コメント記入欄
    func commentTextField(){
        /*
         // UITextFieldを作成する.
         myCommentTextField = UITextField(frame: CGRect(x: Int(UIScreen.main.bounds.width*5/3)-40,y:Int(UIScreen.main.bounds.height*3/4-40) ,width:200,height: 20))
         // 表示する文字を代入する.
         myCommentTextField.text = ""
         // Delegateを設定する.
         myCommentTextField.delegate = self as? UITextFieldDelegate
         // 枠を表示する.
         myCommentTextField.borderStyle = UITextField.BorderStyle.roundedRect
         // UITextFieldの表示する位置を設定する.
         myCommentTextField.layer.position = CGPoint(x:Int(UIScreen.main.bounds.width*5/3),y:Int(UIScreen.main.bounds.height*3/4-40));
         let range = NSMakeRange(myCommentTextField.text!.count - 1, 0)
         myCommentTextField.setMarkedText(myCommentTextField.text, selectedRange: range)
         // Viewに追加する.
         self.addSubview(myCommentTextField)
         */
        //Growingtextview
        /*
        myCommenttextView.frame = CGRect(x: 40,y:Int(UIScreen.main.bounds.height-10) ,width:240,height: 30)
        myCommenttextView.text = ""
        myCommenttextView.delegate = self
        myCommenttextView.placeholder = ""
        myCommenttextView.placeholderColor = UIColor.black
        myCommenttextView.maxHeight = 100
        myCommenttextView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
        myCommenttextView.layer.cornerRadius = 3.0
        myCommenttextView.tintColor = UIColor.black
        myCommenttextView.layer.position = CGPoint(x:Int(UIScreen.main.bounds.height/6+15),y:Int(UIScreen.main.bounds.height-15));
        self.addSubview(myCommenttextView)
 */
    }
    func textViewDidChangeHeight(_ textView: GrowingTextView, height: CGFloat) {
        UIView.animate(withDuration: 0.2) {
            self.layoutIfNeeded()
        }
    }
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    @objc func getEdgeGesture(sender: UIScreenEdgePanGestureRecognizer) {
        //移動量を取得する。
        let move:CGPoint = sender.translation(in: parentVC.view)
        //画面の端からの移動量
        self.frame.origin.x += move.x
        //画面表示を更新する。
        self.layoutIfNeeded()
        //ドラッグ終了時の処理
        if(sender.state == UIGestureRecognizer.State.ended) {
            if(self.frame.origin.x < UIScreen.main.bounds.width - parentVC.view.frame.size.width/4) {
                //ドラッグの距離が画面幅の1/3を超えた場合はメニューを出す
                UIView.animate(withDuration: 0.8,
                               animations: {
                                self.frame.origin.x = UIScreen.main.bounds.width*1/3
                },
                               completion:nil)
                //後述
                ThirdViewController.commentbutton.setImage(UIImage.init(named: "commentON"), for: UIControl.State.normal)
                SideMemoMenu.clearView.isHidden = false
                
            }else {
                //ドラッグの距離が画面幅の1/3以下の場合はそのままメニューを左に戻す。
                UIView.animate(withDuration: 0.8,
                               animations: {
                                self.frame.origin.x = UIScreen.main.bounds.width
                },
                               completion:nil)
                ThirdViewController.commentbutton.setImage(UIImage.init(named: "commentOFF"), for: UIControl.State.normal)
            }
        }
        //移動量をリセットする。
        sender.setTranslation(CGPoint.zero, in: parentVC.view)
    }
    //メモ表示ボタンが押されたとき
    @objc func getButtonGesture(sender: UIButton){
        //画面表示を更新する。
        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.8, animations: {
            self.frame.origin.x = UIScreen.main.bounds.width*1/3
        },completion: nil)
        //後述
    }
    /*
    //送信ボタンが押された時
    @objc func onClickButton(sender:UIButton){
        myTextView.text += myCommenttextView.text
        myCommenttextView.text = ""
        
    }
 */
    //他の場所を押すとキーボードが閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    //returnキーを押すとキーボードが閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        myCommenttextView.resignFirstResponder()
        return true
    }
    
}
    


