//
//  SideMenu.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/09/11.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit
import GrowingTextView

@objc protocol SideMenuDelegate {
    //func onClickButton(sender:UIButton)
}

class SideCommentMenu: UIView,UITableViewDelegate, UITableViewDataSource,GrowingTextViewDelegate  {
    //デリゲートのインスタンスを宣言
    weak var delegate: SideMenuDelegate?
    //サイドメニューのサイズ
    var size: CGRect
    static var clearView : UIView!
    var menuView : UIView!
    var parentVC: UIViewController!
    var swipeGesture : UISwipeGestureRecognizer!
    var isSideMenuhidden: Bool = true
    var rightConstraint: NSLayoutConstraint!
    var myCommentTextField: UITextField!
    static var myCommenttextView = GrowingTextView()
    var comment = ""
    var n_of_comment:Int = 0
    static var tableView: UITableView?
    static var items = ["Apple","Banana","Orange"]
    static var commenticon = [UIImage(named:"jobtokimage1.png")!,UIImage(named:"jobtokimage2.png")!,UIImage(named:"jobtokimage3.png")!]
    //イニシャライザー
    init(image: [UIImage],parentViewController: FirstViewController) {
        self.size = CGRect(x:-UIScreen.main.bounds.width*2, //画面の外に配置
            y:0,
            width:UIScreen.main.bounds.width*2,
            height:UIScreen.main.bounds.height
        )
        super.init(frame:size)
        //サイドメニューの背景色
        self.backgroundColor = UIColor.white
        //サイドメニューの背景色の透過度
        self.alpha = 0.7
        //コメント蘭のテーブルビュー
        SideCommentMenu.tableView = {
            let tableView = UITableView(frame: CGRect(x:Int(UIScreen.main.bounds.width*4/3),y:20,width:Int(UIScreen.main.bounds.width*2/3), height:Int(UIScreen.main.bounds.height*3/4-20)), style: .plain)
            tableView.autoresizingMask = [
                .flexibleWidth,
                .flexibleHeight
            ]
            tableView.delegate = self
            tableView.dataSource = self
            
            // セルをテーブルに紐付ける
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
            self.addSubview(tableView)
            return tableView
        }()
        //ボタンをおした時にbuttonSet関数を呼び出す
        self.buttonSet(num: image.count,image: image)
        //コメントバーを作成するcommentTextfield関数を呼び出す
        self.commentTextField()
        //親ViewControllerを指定
        self.parentVC = parentViewController
        //メニュー以外の場所をタップしたときにメニューを下げる
        SideCommentMenu.clearView = UIView(frame:CGRect(x:UIScreen.main.bounds.width*2/3,y:0,
                                        width:UIScreen.main.bounds.width*1/3,
                                        height:UIScreen.main.bounds.height
            ))
        parentVC.view.insertSubview(SideCommentMenu.clearView, at: 0)
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(self.clearViewTapped)
        )
        tapGesture.numberOfTapsRequired = 1
        SideCommentMenu.clearView.isHidden = true
        SideCommentMenu.clearView.addGestureRecognizer(tapGesture)
        
        //左スワイプ 検出　メニューを下げる
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.leftswipViewDidAppear(_:)))
        leftSwipeGesture.direction = .left
        // 画面にジェスチャーを登録
        self.addGestureRecognizer(leftSwipeGesture)
        
    }
    
    //UIViewを継承したクラスには必要?ここら辺よくわかりません
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*セクションの値を返す　https://qiita.com/konojunya/items/777bf4f489e9354a3e19 */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //セルの個数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideCommentMenu.items.count
    }
    //セル本体
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        //テキスト
        cell.textLabel?.text = SideCommentMenu.items[indexPath.row]
        //テキストが多い時行数を増やして表示
        cell.textLabel?.numberOfLines=0
        cell.textLabel!.font = UIFont(name: "Arial", size: 12)
        //アイコン画像
        let image = SideCommentMenu.commenticon[indexPath.row]
        let newImage = resizeImage(image: image, toTheSize: CGSize(width: 30, height: 30))
        let cellImageLayer: CALayer?  = cell.imageView?.layer
        cellImageLayer!.cornerRadius = 15
        cellImageLayer!.masksToBounds = true
        cell.imageView?.image = newImage
        
        return cell
    }
    //コメント蘭のアイコン画像を円形にする
    func resizeImage(image:UIImage, toTheSize size:CGSize)->UIImage{
        let scale = CGFloat(max(size.width/image.size.width,
                                size.height/image.size.height))
        let width:CGFloat  = image.size.width * scale
        let height:CGFloat = image.size.height * scale;
        let rr:CGRect = CGRect( x: 0, y: 0, width: width, height: height);
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        image.draw(in: rr)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext();
        return newImage
    }
    //セルをタップした時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected! \(SideCommentMenu.items[indexPath.row])")
    }
    //左スワイプでメニューを下げる
    @objc func leftswipViewDidAppear(_ animated: Bool) {
        FirstViewController.commentbutton.setImage(UIImage.init(named: "commentOFF"), for: UIControl.State.normal)
        SideCommentMenu.clearView.isHidden = true
        UIView.animate(withDuration: 0.8,
                       animations: {
                        self.frame.origin.x = -UIScreen.main.bounds.width*2
        },
                       completion:nil)
    }
    //タップでメニューを下げる
    @objc func clearViewTapped(){
        if SideCommentMenu.clearView.isHidden == false {
            FirstViewController.commentbutton.setImage(UIImage.init(named: "commentOFF"), for: UIControl.State.normal)
            SideCommentMenu.clearView.isHidden = true
            UIView.animate(withDuration: 0.8,
                           animations: {
                            self.frame.origin.x = -UIScreen.main.bounds.width*2
            },
                           completion:nil)
        }
    }
    //親ビューで指定した画像の数だけボタンを生成、配置
    func buttonSet(num:Int, image:[UIImage]){
        for i in 0..<num{
            let button =
                UIButton(frame:CGRect(x:Int(UIScreen.main.bounds.width*1/6)*(11-2*i)-30,
                                      y:Int(UIScreen.main.bounds.height*3/4+10),
                                      width:60, height:60))
            //ボタンの画像
            button.setImage(image[i], for: .normal)
            //ボタンの四隅に余白をつける
            button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            //ボタンの背景色
            button.backgroundColor = UIColor.yellow
            // サイズの半分の値を設定 (丸いボタンにするため)
            button.layer.cornerRadius = 30
            //ボタンにタグをつける
            button.tag = i
            //ボタンをおした時の動作
            button.addTarget(self,
                             action:#selector(self.onClickButton(sender:)),
                             for: .touchUpInside)
            self.addSubview(button)
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
        SideCommentMenu.myCommenttextView.frame = CGRect(x: Int(UIScreen.main.bounds.width*5/3)-40,y:Int(UIScreen.main.bounds.height-75) ,width:240,height: 30)
        SideCommentMenu.myCommenttextView.text = ""
        SideCommentMenu.myCommenttextView.delegate = self
        SideCommentMenu.myCommenttextView.placeholder = "コメントする"
        SideCommentMenu.myCommenttextView.placeholderColor = UIColor.black
        SideCommentMenu.myCommenttextView.maxHeight = 100
        SideCommentMenu.myCommenttextView.backgroundColor = UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        SideCommentMenu.myCommenttextView.layer.cornerRadius = 3.0
        SideCommentMenu.myCommenttextView.tintColor = UIColor.black
        SideCommentMenu.myCommenttextView.layer.position = CGPoint(x:Int(UIScreen.main.bounds.width*5/3),y:Int(UIScreen.main.bounds.height-75));
        self.addSubview(SideCommentMenu.myCommenttextView)
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
                                self.frame.origin.x = -UIScreen.main.bounds.width*4/3
                                
                },
                               completion:nil)
                //後述
                SideCommentMenu.clearView.isHidden = false
                FirstViewController.commentbutton.setImage(UIImage.init(named: "commentON"), for: UIControl.State.normal)
                
            }else {
                //ドラッグの距離が画面幅の1/3以下の場合はそのままメニューを左に戻す。
                UIView.animate(withDuration: 0.8,
                               animations: {
                                self.frame.origin.x = -UIScreen.main.bounds.width*2
                },
                               completion:nil)
                FirstViewController.commentbutton.setImage(UIImage.init(named: "commentOFF"), for: UIControl.State.normal)
            }
        }
        //移動量をリセットする。
        sender.setTranslation(CGPoint.zero, in: parentVC.view)
    }
    @objc func getButtonGesture(sender: UIButton){
        //画面表示を更新する。
        self.layoutIfNeeded()
        UIView.animate(withDuration: 0.8, animations: {
            self.frame.origin.x = -UIScreen.main.bounds.width*4/3
        },completion: nil)
    }

    //コメント蘭のボタンを押した時のメソッド
    @objc func onClickButton(sender:UIButton){
        n_of_comment += 1
        if sender.tag == 0 && SideCommentMenu.myCommenttextView.text! != ""  {
            comment = SideCommentMenu.myCommenttextView.text!
            SideCommentMenu.myCommenttextView.text = ""
            SideCommentMenu.items.append(comment)
            SideCommentMenu.commenticon.append(UIImage(named:"iconA")!)
            SideCommentMenu.tableView?.reloadData()
            /*
            // TextView生成する.
            let commentTextView: UITextView = UITextView(frame: CGRect(x:Int(UIScreen.main.bounds.width*4/3),y:20, width:Int(UIScreen.main.bounds.width*2/3), height:Int(UIScreen.main.bounds.height*3/4-70)))
            // TextViewの背景を黃色に設定する.
            commentTextView.backgroundColor = UIColor.white
            // 表示させるテキストを設定する.
            commentTextView.text = comment
            commentTextView.font = UIFont(name: "Hiragino Sans", size: CGFloat(15))
            // フォントの色の設定をする.
            commentTextView.textColor = UIColor.black
            // 左詰めの設定をする.
            commentTextView.textAlignment = NSTextAlignment.left
            // テキストを編集不可にする.
            commentTextView.isEditable = false
            // TextViewをViewに追加する.
            self.addSubview(commentTextView)
            for m in  0..<n_of_comment{
            let iconimage:UIImage = UIImage(named:"jobtokimage15")!
            let iconView = UIImageView(image:iconimage)
            // 画像の縦横サイズを取得
            //let iconWidth:CGFloat = iconimage.size.width
            //let iconHeight:CGFloat = iconimage.size.height
            //let scale:CGFloat = iconHeight / iconWidth
            iconView.contentMode = .scaleAspectFill
            iconView.clipsToBounds = true
            iconView.layer.cornerRadius = 10
            let rect:CGRect = CGRect(x:Int(UIScreen.main.bounds.width*4/3),y:23+23*m,width:20 ,height:20)
            iconView.frame = rect;
            //iconView.circle(screenWidth: 20)
            self.addSubview(iconView)
            */
        
        } else if sender.tag == 1 {
            comment = "      " + "😄"
            SideCommentMenu.items.append(comment)
            SideCommentMenu.commenticon.append(UIImage(named: "iconA.png")!)
            SideCommentMenu.tableView?.reloadData()
            
            /*
            // TextView生成する.
            let commentTextView: UITextView = UITextView(frame: CGRect(x:Int(UIScreen.main.bounds.width*4/3),y:20, width:Int(UIScreen.main.bounds.width*2/3), height:Int(UIScreen.main.bounds.height*3/4-70)))
            // TextViewの背景を黃色に設定する.
            commentTextView.backgroundColor = UIColor.white
            // 表示させるテキストを設定する.
            commentTextView.text = comment
            commentTextView.font = UIFont(name: "Hiragino Sans", size: CGFloat(15))
            // フォントの色の設定をする.
            commentTextView.textColor = UIColor.black
            // 左詰めの設定をする.
            commentTextView.textAlignment = NSTextAlignment.left
            // テキストを編集不可にする.
            commentTextView.isEditable = false
            // TextViewをViewに追加する.
            self.addSubview(commentTextView)
            
            for m in  0..<n_of_comment{
                let iconimage:UIImage = UIImage(named:"jobtokimage15")!
                let iconView = UIImageView(image:iconimage)
                // 画像の縦横サイズを取得
                //let iconWidth:CGFloat = iconimage.size.width
                //let iconHeight:CGFloat = iconimage.size.height
                //let scale:CGFloat = iconHeight / iconWidth
                iconView.contentMode = .scaleAspectFill
                iconView.clipsToBounds = true
                iconView.layer.cornerRadius = 10
                let rect:CGRect = CGRect(x:Int(UIScreen.main.bounds.width*4/3),y:23+23*m,width:20 ,height:20)
                iconView.frame = rect;
                //iconView.circle(screenWidth: 20)
                self.addSubview(iconView)
            */
            }
            
            
            
        }
        /*
        //記入欄を空にする
        myCommentTextField.text = ""
        */
        
    
    //他の場所を押すとキーボードが閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIApplication.shared.keyWindow?.endEditing(true)
    }
    //returnキーを押すとキーボードが閉じる
    func textFieldShouldReturn(_ textField: GrowingTextView) -> Bool {
        
        SideCommentMenu.myCommenttextView.resignFirstResponder()
        return true
    }
    
    
    
}



