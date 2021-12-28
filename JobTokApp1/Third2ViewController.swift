//
//  ThirdViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/20.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit

class Third2ViewController: UIViewController {
    
    var ImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        /*
        let BoundSize_w:CGFloat = UIScreen.main.bounds.width
        let BoundSize_h:CGFloat = UIScreen.main.bounds.height
        let image = UIImage(named:"jobtokimage6")
        ImageView = UIImageView(frame: CGRect(x:0,y:0,width:
            BoundSize_w,height: BoundSize_h))
        ImageView.image = image
        ImageView.layer.position = CGPoint(x: BoundSize_w/2, y:BoundSize_h/2 )
        view.addSubview(ImageView)
        */
        
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.rightViewDidAppear(_:)))
        rightSwipeGesture.direction = .right
        // 画面にジェスチャーを登録
        view.addGestureRecognizer(rightSwipeGesture)
        
        // スクリーンの縦横サイズを取得
        let screenWidth:CGFloat = view.frame.size.width
        let screenHeight:CGFloat = view.frame.size.height
        //UIScrollViewのインスタンス作成
        let scrollView = UIScrollView()
        //scrollViewの大きさを設定。
        scrollView.frame = CGRect(x:0, y:0, width:screenWidth , height:screenHeight)
        //スクロール領域の設定
        scrollView.contentSize = CGSize(width:screenWidth, height:screenHeight*2)
        //scrollViewをviewのSubViewとして追加
        self.view.addSubview(scrollView)
        
        
        
        
        // Do any additional setup after loading the view.
        // UIImage インスタンスの生成
        let image1:UIImage = UIImage(named:"jobtokimage14")!
        // UIImageView 初期化
        let imageView1 = UIImageView(image:image1)
        // 画像の縦横サイズを取得
        let imgWidth1:CGFloat = image1.size.width
        let imgHeight1:CGFloat = image1.size.height
        // 画像サイズをスクリーン幅に合わせる
        let scale1:CGFloat = imgHeight1 / imgWidth1
        let rect1:CGRect =
            CGRect(x:0, y:0, width:screenWidth, height:screenWidth*scale1)
        // ImageView frame をCGRectで作った矩形に合わせる
        imageView1.frame = rect1;
        // UIImageViewのインスタンスをビューに追加
        self.view.addSubview(imageView1)
        
        let image2:UIImage = UIImage(named:"jobtokimage15")!
        let imageView2 = UIImageView(image:image2)
        // 画像の縦横サイズを取得
        let imgWidth2:CGFloat = image2.size.width
        let imgHeight2:CGFloat = image2.size.height
        let scale2:CGFloat = imgHeight2 / imgWidth2
        imageView2.contentMode = .scaleAspectFill
        imageView2.clipsToBounds = true
        imageView2.layer.cornerRadius = imgHeight2 / 2.0
        let rect2:CGRect = CGRect(x:0,y:screenWidth*scale1+screenHeight*0.22+10,width: screenWidth/8,height: scale2*screenWidth/8 )
        imageView2.frame = rect2;
        imageView2.circle(screenWidth: screenWidth)
        self.view.addSubview(imageView2)
        
        // TextView生成する.
        let myTextView1: UITextView = UITextView(frame: CGRect(x:10+screenWidth/8, y:screenWidth*scale1+screenHeight*0.22+5, width: screenWidth-(10+screenWidth/8), height: scale2*screenWidth/7))
        // TextViewの背景を黃色に設定する.
        myTextView1.backgroundColor = UIColor.white
        // 表示させるテキストを設定する.
        myTextView1.text = "株式会社○○ 代表取締役社長\n〇〇 〇〇"
        myTextView1.font = UIFont(name: "Hiragino Sans", size: CGFloat(15))
        // フォントの色の設定をする.
        myTextView1.textColor = UIColor.black
        // 左詰めの設定をする.
        myTextView1.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        myTextView1.isEditable = false
        // TextViewをViewに追加する.
        self.view.addSubview(myTextView1)
        
        // TextView生成する.
        let myTextView2: UITextView = UITextView(frame: CGRect(x: 0, y:screenWidth*scale1+screenHeight*0.22+5+scale2*screenWidth/7, width: screenWidth, height:screenHeight*2-(screenWidth*scale1+screenHeight*0.22+5+scale2*screenWidth/7)))
        // TextViewの背景を黃色に設定する.
        myTextView2.backgroundColor = UIColor.white
        // 表示させるテキストを設定する.
        myTextView2.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字！"
        myTextView2.font = UIFont.systemFont(ofSize: CGFloat(20))
        // フォントの色の設定をする.
        myTextView2.textColor = UIColor.black
        // 左詰めの設定をする.
        myTextView2.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        myTextView2.isEditable = false
        // TextViewをViewに追加する.
        self.view.addSubview(myTextView2)
        
        
        
        
        
        // TextView生成する.
        let myTextView: UITextView = UITextView(frame: CGRect(x: 0, y: screenWidth*scale1+10, width: screenWidth, height: screenHeight*0.22))
        // TextViewの背景を黃色に設定する.
        myTextView.backgroundColor = UIColor.white
        // 表示させるテキストを設定する.
        myTextView.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字！"
        myTextView.font = UIFont.systemFont(ofSize: CGFloat(30))
        // フォントの色の設定をする.
        myTextView.textColor = UIColor.black
        // 左詰めの設定をする.
        myTextView.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        myTextView.isEditable = false
        // TextViewをViewに追加する.
        self.view.addSubview(myTextView)
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    @objc func rightViewDidAppear(_ animated: Bool) {
        
        // 戻る場合には、dismissViewControllerAnimatedメソッドを使います。
        // ここで、animatedをtrueにするとアニメーションしながら遷移できる
        self.dismiss(animated: true, completion: nil)
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

