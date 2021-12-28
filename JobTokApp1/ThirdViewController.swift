//
//  ThirdViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/20.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit
import AMChart

class ThirdViewController: UIViewController,SideMenuDelegate,AMRadarChartViewDataSource,AMPieChartViewDataSource,AMPieChartViewDelegate {

    var ImageView: UIImageView!
    var side2View : SideMemoMenu!
    static let commentbutton:UIButton = UIButton()
    
    let scrollView = UIScrollView()

    // スクリーンの縦横サイズを取得
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
    //各見出しの高さを取得
    var height1: CGFloat = 0
    var height2: CGFloat = 0
    var height3: CGFloat = 0
    var height4: CGFloat = 0
    var height5: CGFloat = 0
    var height6: CGFloat = 0
    
    //ボタン
    let clubbutton:UIButton = UIButton()
    let diabutton:UIButton = UIButton()
    let heartbutton:UIButton = UIButton()
    let spadebutton:UIButton = UIButton()
    
    //ボタン
    let club1button:UIButton = UIButton()
    let dia1button:UIButton = UIButton()
    let heart1button:UIButton = UIButton()
    let spade1button:UIButton = UIButton()
    
    let key:[String] = ["初対面の人と話すのが得意","自分で考えて行動できる","組織での行動が得意","論理的に深く考えるのが好き","ストレス耐性がある","福利厚生より金銭面を重要視する","環境に柔軟である","行動力がある"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //右スワイプ 検出
        let screenrightEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,  action: Selector(("rightEdgePanGesture:")))
        screenrightEdgeRecognizer.edges = .right
        self.view.addGestureRecognizer(screenrightEdgeRecognizer)
        
        view.backgroundColor = UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        /*
        let BoundSize_w:CGFloat = UIScreen.main.bounds.width
        let BoundSize_h:CGFloat = UIScreen.main.bounds.height
        let image = UIImage(named:"jobtokimage5")
        ImageView = UIImageView(frame: CGRect(x:0,y:0,width:
            BoundSize_w,height: BoundSize_h))
        ImageView.image = image
        ImageView.layer.position = CGPoint(x: BoundSize_w/2, y:BoundSize_h/2 )
        view.addSubview(ImageView)
        */
        screenWidth = view.frame.size.width
        screenHeight = view.frame.size.height
        
        //UIScrollViewのインスタンス作成
        //let scrollView = UIScrollView()
        //scrollViewの大きさを設定。
        scrollView.frame = CGRect(x:0, y:0, width:screenWidth , height:screenHeight)
        //スクロール領域の設定
        scrollView.contentSize = CGSize(width:screenWidth, height:screenHeight*20)
        //scrollViewをviewのSubViewとして追加
        self.view.addSubview(scrollView)
        

        // Do any additional setup after loading the view.
        //ヘッダー
        // UIImage インスタンスの生成
        let headerimage:UIImage = UIImage(named:"jobtokimage14")!
        // UIImageView 初期化
        let headerimageView = UIImageView(image:headerimage)
        // 画像の縦横サイズを取得
        let headerimgWidth:CGFloat = headerimage.size.width
        let headerimgHeight:CGFloat = headerimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        let headerimagescale:CGFloat = headerimgHeight / headerimgWidth
        let headerimagerect:CGRect =
            CGRect(x:0, y:0, width:screenWidth, height:screenWidth*headerimagescale)
        // ImageView frame をCGRectで作った矩形に合わせる
        headerimageView.frame = headerimagerect;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(headerimageView)
        
        // TextView生成する.
        let headingTextView: UITextView = UITextView(frame: CGRect(x: 0, y: screenWidth*headerimagescale+10, width: screenWidth, height: 0))
        // TextViewの背景を黃色に設定する.
        headingTextView.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        headingTextView.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文！"
        headingTextView.font = UIFont.systemFont(ofSize: CGFloat(30))
        headingTextView.sizeToFit()
        // フォントの色の設定をする.
        headingTextView.textColor = UIColor.black
        // 左詰めの設定をする.
        headingTextView.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        headingTextView.isEditable = false
        //スクロールさせない
        headingTextView.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(headingTextView)
        
        //アイコン画像
        let iconimage:UIImage = UIImage(named:"iconA")!
        let iconimageView = UIImageView(image:iconimage)
        // 画像の縦横サイズを取得
        let iconimgWidth:CGFloat = iconimage.size.width
        let iconimgHeight:CGFloat = iconimage.size.height
        let iconscale:CGFloat = iconimgHeight / iconimgWidth
        iconimageView.contentMode = .scaleAspectFill
        iconimageView.clipsToBounds = true
        iconimageView.layer.cornerRadius = iconimgHeight / 2.0
        let iconrect:CGRect = CGRect(x:0,y:screenWidth*headerimagescale+headingTextView.frame.height+10,width: screenWidth/8,height: iconscale*screenWidth/8 )
        iconimageView.frame = iconrect;
        iconimageView.circle(screenWidth: screenWidth)
        scrollView.addSubview(iconimageView)
        
        // TextView生成する.
        let iconTextView: UITextView = UITextView(frame: CGRect(x:10+screenWidth/8, y:screenWidth*headerimagescale+headingTextView.frame.height+5, width: screenWidth-(10+screenWidth/8), height: iconscale*screenWidth/7))
        // TextViewの背景を黃色に設定する.
        iconTextView.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        iconTextView.text = "株式会社○○ 代表取締役社長\n〇〇 〇〇"
        iconTextView.font = UIFont(name: "Hiragino Sans", size: CGFloat(12))
        // フォントの色の設定をする.
        iconTextView.textColor = UIColor.black
        // 左詰めの設定をする.
        iconTextView.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        iconTextView.isEditable = false
        //スクロールさせない
        iconTextView.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(iconTextView)
        
        //MOVIEラベル
        let label = UILabel()
        label.frame = CGRect(x:7, y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconscale*screenWidth*3/16-screenWidth*1.54/16-10, width:screenWidth-14, height:screenWidth*1.54/8+20)
        label.text = ""
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.layer.borderWidth = 2.0   // 枠線の幅（0なので表示なし）
        label.layer.borderColor = UIColor.black.cgColor // 枠線の色
        scrollView.addSubview(label)
        //トランプButton
        //clubボタン
        let clubrect:CGRect = CGRect(x: screenWidth/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconscale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        clubbutton.frame = clubrect;
        // 任意の場所に設置する
        clubbutton.layer.position = CGPoint(x:screenWidth/8 ,y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconscale*screenWidth*3/16 )
        clubbutton.setImage(UIImage.init(named: "club"), for: UIControl.State.normal)
        clubbutton.backgroundColor = UIColor.white
        //ボタンの四隅に余白をつける
        clubbutton.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        clubbutton.addTarget(self, action: #selector(clubbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(clubbutton)
        
        //diaボタン
        let diarect:CGRect = CGRect(x: screenWidth*3/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconscale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        diabutton.frame = diarect;
        // 任意の場所に設置する
        diabutton.layer.position = CGPoint(x:screenWidth*3/8 ,y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconscale*screenWidth*3/16)
        diabutton.setImage(UIImage.init(named: "dia"), for: UIControl.State.normal)
        //ボタンの四隅に余白をつける
        diabutton.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        diabutton.backgroundColor = UIColor.white
        diabutton.addTarget(self, action: #selector(diabuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(diabutton)
        
        //heartボタン
        let heartrect:CGRect = CGRect(x: screenWidth*5/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconscale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        heartbutton.frame = heartrect;
        // 任意の場所に設置する
        heartbutton.layer.position = CGPoint(x:screenWidth*5/8 ,y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconscale*screenWidth*3/16 )
        heartbutton.setImage(UIImage.init(named: "heart"), for: UIControl.State.normal)
        //ボタンの四隅に余白をつける
        heartbutton.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        heartbutton.backgroundColor = UIColor.white
        heartbutton.addTarget(self, action: #selector(heartbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(heartbutton)
        
        //spadeボタン
        let spaderect:CGRect = CGRect(x: screenWidth*7/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconscale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        spadebutton.frame = spaderect;
        // 任意の場所に設置する
        spadebutton.layer.position = CGPoint(x:screenWidth*7/8 ,y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconscale*screenWidth*3/16)
        spadebutton.setImage(UIImage.init(named: "spade"), for: UIControl.State.normal)
        //ボタンの四隅に余白をつける
        spadebutton.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        spadebutton.backgroundColor = UIColor.white
        spadebutton.addTarget(self, action: #selector(spadebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(spadebutton)
        
        
        
        height1 = screenWidth*headerimagescale+headingTextView.frame.height+50+iconscale*screenWidth/2
        
        
        //求める人材
        let radarlabel = UILabel()
        radarlabel.frame = CGRect(x: screenWidth/8,y: height1-40,width: 0,height: 0)
        radarlabel.layer.position = CGPoint(x:screenWidth/8,y: height1-40)
        radarlabel.font = UIFont.systemFont(ofSize: CGFloat(20))
        radarlabel.text = "求める人物"
        radarlabel.sizeToFit()
        // フォントの色の設定をする.
        radarlabel.textColor = UIColor.black
        // 左詰めの設定をする.
        radarlabel.textAlignment = NSTextAlignment.left
        // TextViewをViewに追加する.
        scrollView.addSubview(radarlabel)
        
        //RadarChart
        let radarChartView = AMRadarChartView(frame: CGRect(x: screenWidth/2, y: height1+radarlabel.frame.height+100, width: 300, height: 300))
        radarChartView.layer.position = CGPoint(x: screenWidth/2, y: height1+radarlabel.frame.height+100)
        // customize here
        radarChartView.dataSource = self
        radarChartView.numberOfAxisLabels = 10
        radarChartView.axisMaxValue = 10
        radarChartView.axisMinValue = 0
        radarChartView.axisDecimalFormat = .none
        scrollView.addSubview(radarChartView)
        
        //男女比
        let pielabel = UILabel()
        pielabel.frame = CGRect(x: screenWidth/8,y: height1+radarlabel.frame.height+250,width: 0,height: 0)
        pielabel.layer.position = CGPoint(x:screenWidth/8,y: height1+radarlabel.frame.height+250)
        pielabel.font = UIFont.systemFont(ofSize: CGFloat(20))
        pielabel.text = "男女比"
        pielabel.sizeToFit()
        // フォントの色の設定をする.
        pielabel.textColor = UIColor.black
        // 左詰めの設定をする.
        pielabel.textAlignment = NSTextAlignment.left
        // TextViewをViewに追加する.
        scrollView.addSubview(pielabel)

        //PieChart
        let pieChartView = AMPieChartView(frame: CGRect(x: screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370,width: 200,height: 200))
        pieChartView.layer.position = CGPoint(x:screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370)
        //customize here
        pieChartView.dataSource = self
        pieChartView.delegate = self
        pieChartView.centerLabelText = "男女比"
        pieChartView.isDounut = true
        scrollView.addSubview(pieChartView)
        
        height2 = height1+radarlabel.frame.height+pielabel.frame.height+370
        
        //clubボタン
        let club1rect:CGRect = CGRect(x: screenWidth/8, y: height2+200, width: screenWidth/8, height: screenWidth*1.54/8)
        club1button.frame = club1rect;
        // 任意の場所に設置する
        club1button.layer.position = CGPoint(x:screenWidth/8 ,y:height2+200)
        club1button.setImage(UIImage.init(named: "club"), for: UIControl.State.normal)
        club1button.backgroundColor = UIColor.white
        //ボタンの四隅に余白をつける
        club1button.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        club1button.addTarget(self, action: #selector(club1buttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(club1button)
        
        //clublabel
        let clublabel = UILabel()
        clublabel.frame = CGRect(x: screenWidth*2/8,y: height2+200-screenWidth*1.54/32,width: 0,height: 0)
        clublabel.layer.position = CGPoint(x:screenWidth*2/8,y: height2+200-screenWidth*1.54/32)
        clublabel.font = UIFont.systemFont(ofSize: CGFloat(30))
        clublabel.text = "企業概要"
        clublabel.sizeToFit()
        // フォントの色の設定をする.
        clublabel.textColor = UIColor.black
        // 左詰めの設定をする.
        clublabel.textAlignment = NSTextAlignment.left
        // TextViewをViewに追加する.
        scrollView.addSubview(clublabel)
        
        //clubimage
        let clubimage:UIImage = UIImage(named:"clubimage")!
        // UIImageView 初期化
        let clubimageView = UIImageView(image:clubimage)
        // 画像の縦横サイズを取得
        let clubimgWidth:CGFloat = clubimage.size.width
        let clubimgHeight:CGFloat = clubimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        let clubimagescale:CGFloat = clubimgHeight / clubimgWidth
        let clubimagerect:CGRect =
            CGRect(x:screenWidth/8, y:height2+250, width:screenWidth*6/8, height:(screenWidth*6/8)*clubimagescale)
        let clubimageheight = (screenWidth*6/8)*clubimagescale
        // ImageView frame をCGRectで作った矩形に合わせる
        clubimageView.frame = clubimagerect;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(clubimageView)
        
        
        
        // TextView生成する.
        let myTextView2: UITextView = UITextView(frame: CGRect(x: screenWidth/2, y:height2+250+clubimageheight, width: screenWidth*6/8, height:0))
        myTextView2.layer.position = CGPoint(x: screenWidth/2, y:height2+250+clubimageheight)
        // TextViewの背景を黃色に設定する.
        myTextView2.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        myTextView2.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字！"
        myTextView2.font = UIFont.systemFont(ofSize: CGFloat(15))
        myTextView2.sizeToFit()
        // フォントの色の設定をする.
        myTextView2.textColor = UIColor.black
        // 左詰めの設定をする.
        myTextView2.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        myTextView2.isEditable = false
        //スクロールさせない
        myTextView2.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(myTextView2)
        
        height3 = height2+250+clubimageheight+myTextView2.frame.height
        
        //diaボタン
        let dia1rect:CGRect = CGRect(x: screenWidth/8, y: height3+50, width: screenWidth/8, height: screenWidth*1.54/8)
        dia1button.frame = dia1rect;
        // 任意の場所に設置する
        dia1button.layer.position = CGPoint(x:screenWidth/8 ,y:height3+50)
        dia1button.setImage(UIImage.init(named: "dia"), for: UIControl.State.normal)
        dia1button.backgroundColor = UIColor.white
        //ボタンの四隅に余白をつける
        dia1button.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        dia1button.addTarget(self, action: #selector(club1buttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(dia1button)
        
        //dialabel
        let dialabel = UILabel()
        dialabel.frame = CGRect(x: screenWidth/8,y: height3+50-screenWidth*1.54/32,width: 0,height: 0)
        dialabel.layer.position = CGPoint(x:screenWidth*2/8,y: height3+50-screenWidth*1.54/32)
        dialabel.font = UIFont.systemFont(ofSize: CGFloat(30))
        dialabel.text = "募集対象"
        dialabel.sizeToFit()
        // フォントの色の設定をする.
        dialabel.textColor = UIColor.black
        // 左詰めの設定をする.
        dialabel.textAlignment = NSTextAlignment.left
        // TextViewをViewに追加する.
        scrollView.addSubview(dialabel)
        
        //diaimage
        let diaimage:UIImage = UIImage(named:"diaimage")!
        // UIImageView 初期化
        let diaimageView = UIImageView(image:diaimage)
        // 画像の縦横サイズを取得
        let diaimgWidth:CGFloat = diaimage.size.width
        let diaimgHeight:CGFloat = diaimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        let diaimagescale:CGFloat = diaimgHeight / diaimgWidth
        let diaimagerect:CGRect =
            CGRect(x:screenWidth/8, y:height3+100, width:screenWidth*6/8, height:(screenWidth*6/8)*diaimagescale)
        let diaimageheight = (screenWidth*6/8)*diaimagescale
        // ImageView frame をCGRectで作った矩形に合わせる
        diaimageView.frame = diaimagerect;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(diaimageView)
        
        // TextView生成する.
        let myTextView3: UITextView = UITextView(frame: CGRect(x: screenWidth/2, y:height3+100+diaimageheight, width: screenWidth*6/8, height:0))
        myTextView3.layer.position = CGPoint(x: screenWidth/2, y:height3+100+diaimageheight)
        // TextViewの背景を黃色に設定する.
        myTextView3.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        myTextView3.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字"
        myTextView3.font = UIFont.systemFont(ofSize: CGFloat(15))
        myTextView3.sizeToFit()
        // フォントの色の設定をする.
        myTextView3.textColor = UIColor.black
        // 左詰めの設定をする.
        myTextView3.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        myTextView3.isEditable = false
        //スクロールさせない
        myTextView3.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(myTextView3)
        
        
        height4 = height3+100+diaimageheight+myTextView3.frame.height
        
        //heartボタン
        let heart1rect:CGRect = CGRect(x: screenWidth/8, y: height4+50, width: screenWidth/8, height: screenWidth*1.54/8)
        heart1button.frame = heart1rect;
        // 任意の場所に設置する
        heart1button.layer.position = CGPoint(x:screenWidth/8 ,y:height4+50)
        heart1button.setImage(UIImage.init(named: "heart"), for: UIControl.State.normal)
        heart1button.backgroundColor = UIColor.white
        //ボタンの四隅に余白をつける
        heart1button.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        heart1button.addTarget(self, action: #selector(club1buttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(heart1button)
        
        //heartlabel
        let heartlabel = UILabel()
        heartlabel.frame = CGRect(x: screenWidth/8,y: height4+50-screenWidth*1.54/32,width: 0,height: 0)
        heartlabel.layer.position = CGPoint(x:screenWidth*2/8,y: height4+50-screenWidth*1.54/32)
        heartlabel.font = UIFont.systemFont(ofSize: CGFloat(30))
        heartlabel.text = "こんなことやります！"
        heartlabel.sizeToFit()
        // フォントの色の設定をする.
        heartlabel.textColor = UIColor.black
        // 左詰めの設定をする.
        heartlabel.textAlignment = NSTextAlignment.left
        // TextViewをViewに追加する.
        scrollView.addSubview(heartlabel)
        
        //heartimage
        let heartimage:UIImage = UIImage(named:"heartimage")!
        // UIImageView 初期化
        let heartimageView = UIImageView(image:heartimage)
        // 画像の縦横サイズを取得
        let heartimgWidth:CGFloat = heartimage.size.width
        let heartimgHeight:CGFloat = heartimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        let heartimagescale:CGFloat = heartimgHeight / heartimgWidth
        let heartimagerect:CGRect =
            CGRect(x:screenWidth/8, y:height4+100, width:screenWidth*6/8, height:(screenWidth*6/8)*heartimagescale)
        let heartimageheight = (screenWidth*6/8)*heartimagescale
        // ImageView frame をCGRectで作った矩形に合わせる
        heartimageView.frame = heartimagerect;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(heartimageView)
        
        // TextView生成する.
        let myTextView4: UITextView = UITextView(frame: CGRect(x: screenWidth/2, y:height4+100+heartimageheight, width: screenWidth*6/8, height:0))
        myTextView4.layer.position = CGPoint(x: screenWidth/2, y:height4+100+heartimageheight)
        // TextViewの背景を黃色に設定する.
        myTextView4.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        myTextView4.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字！"
        myTextView4.font = UIFont.systemFont(ofSize: CGFloat(15))
        myTextView4.sizeToFit()
        // フォントの色の設定をする.
        myTextView4.textColor = UIColor.black
        // 左詰めの設定をする.
        myTextView4.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        myTextView4.isEditable = false
        //スクロールさせない
        myTextView4.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(myTextView4)
        
        height5 = height4+100+heartimageheight+myTextView4.frame.height
        
        //spadeボタン
        let spade1rect:CGRect = CGRect(x: screenWidth/8, y: height5+50, width: screenWidth/8, height: screenWidth*1.54/8)
        spade1button.frame = spade1rect;
        // 任意の場所に設置する
        spade1button.layer.position = CGPoint(x:screenWidth/8 ,y:height5+50)
        spade1button.setImage(UIImage.init(named: "spade"), for: UIControl.State.normal)
        spade1button.backgroundColor = UIColor.white
        //ボタンの四隅に余白をつける
        spade1button.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        spade1button.addTarget(self, action: #selector(club1buttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(spade1button)
        
        //spadelabel
        let spadelabel = UILabel()
        spadelabel.frame = CGRect(x: screenWidth/8,y: height5+50-screenWidth*1.54/32,width: 0,height: 0)
        spadelabel.layer.position = CGPoint(x:screenWidth*2/8,y: height5+50-screenWidth*1.54/32)
        spadelabel.font = UIFont.systemFont(ofSize: CGFloat(30))
        spadelabel.text = "我が社の特徴"
        spadelabel.sizeToFit()
        // フォントの色の設定をする.
        spadelabel.textColor = UIColor.black
        // 左詰めの設定をする.
        spadelabel.textAlignment = NSTextAlignment.left
        // TextViewをViewに追加する.
        scrollView.addSubview(spadelabel)
        
        //spadeimage
        let spadeimage:UIImage = UIImage(named:"spadeimage")!
        // UIImageView 初期化
        let spadeimageView = UIImageView(image:spadeimage)
        // 画像の縦横サイズを取得
        let spadeimgWidth:CGFloat = spadeimage.size.width
        let spadeimgHeight:CGFloat = spadeimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        let spadeimagescale:CGFloat = spadeimgHeight / spadeimgWidth
        let spadeimagerect:CGRect =
            CGRect(x:screenWidth/8, y:height5+100, width:screenWidth*6/8, height:(screenWidth*6/8)*spadeimagescale)
        let spadeimageheight = (screenWidth*6/8)*spadeimagescale
        // ImageView frame をCGRectで作った矩形に合わせる
        spadeimageView.frame = spadeimagerect;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(spadeimageView)

        // TextView生成する.
        let myTextView5: UITextView = UITextView(frame: CGRect(x: screenWidth/2, y:height5+100+spadeimageheight, width: screenWidth*6/8, height:0))
        myTextView5.layer.position = CGPoint(x: screenWidth/2, y:height5+100+spadeimageheight)
        // TextViewの背景を黃色に設定する.
        myTextView5.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        myTextView5.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字！"
        myTextView5.font = UIFont.systemFont(ofSize: CGFloat(15))
        myTextView5.sizeToFit()
        // フォントの色の設定をする.
        myTextView5.textColor = UIColor.black
        // 左詰めの設定をする.
        myTextView5.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        myTextView5.isEditable = false
        //スクロールさせない
        myTextView5.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(myTextView5)
        
        height6 = height5+100+spadeimageheight+myTextView5.frame.height
        
        //会社ロゴ画像
        let logoimage:UIImage = UIImage(named:"logo")!
        let logoimageView = UIImageView(image:logoimage)
        // 画像の縦横サイズを取得
        let logoimgWidth:CGFloat = logoimage.size.width
        let logoimgHeight:CGFloat = logoimage.size.height
        let logoscale:CGFloat = logoimgHeight / logoimgWidth
        logoimageView.contentMode = .scaleAspectFill
        logoimageView.clipsToBounds = true
        logoimageView.layer.cornerRadius = iconimgHeight / 2.0
        let logorect:CGRect = CGRect(x:screenWidth/2-screenWidth/16,y:height6+50,width: screenWidth/8,height: logoscale*screenWidth/8 )
        logoimageView.frame = logorect;
        logoimageView.circle(screenWidth: screenWidth)
        scrollView.addSubview(logoimageView)
        
        //会社ラベル
        let logolabel = UILabel()
        logolabel.frame = CGRect(x: screenWidth/2,y: height6+50+logoscale*screenWidth/8 ,width: 0,height: 0)
        logolabel.layer.position = CGPoint(x:screenWidth*2/8,y: height6+50+logoscale*screenWidth/8)
        logolabel.font = UIFont.systemFont(ofSize: CGFloat(20))
        logolabel.text = "株式会社スタートアップ"
        logolabel.sizeToFit()
        // フォントの色の設定をする.
        logolabel.textColor = UIColor.black
        // 左詰めの設定をする.
        logolabel.textAlignment = NSTextAlignment.left
        // TextViewをViewに追加する.
        scrollView.addSubview(logolabel)
        
        //企業情報
        // TextView生成する.
        let myTextView6: UITextView = UITextView(frame: CGRect(x: screenWidth/2+100, y:height6+100+logoscale*screenWidth/8, width: screenWidth+200, height:0))
        myTextView6.layer.position = CGPoint(x: screenWidth/2+100, y:height6+100+logoscale*screenWidth/8)
        // TextViewの背景を黃色に設定する.
        myTextView6.backgroundColor =  UIColor.gray
        // 表示させるテキストを設定する.
        myTextView6.text = "住所：   東京都渋谷区渋谷 〇〇ビル４階\n設立:   2013年に設立\nメンバー：   22人のメンバー\n資本金：   2000万\nホームページ：   URL"
        myTextView6.font = UIFont.systemFont(ofSize: CGFloat(15))
        myTextView6.textContainerInset = UIEdgeInsets(top: 20,left: 5,bottom: 250,right: 200)
        myTextView6.sizeToFit()
        // フォントの色の設定をする.
        myTextView6.textColor = UIColor.black
        // 左詰めの設定をする.
        myTextView6.textAlignment = NSTextAlignment.left
        // テキストを編集不可にする.
        myTextView6.isEditable = false
        //スクロールさせない
        myTextView6.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(myTextView6)
        
        let height7 = height6+100+logoscale*screenWidth/8+myTextView6.frame.height
        
        scrollView.contentSize = CGSize(width:screenWidth, height:height7-220)
        
        
        
        
        
        
        
        
        
        
        
        
        
        //サイドメニューのボタン
        let imageArray = [UIImage(named:"commentOFF")!,UIImage(named:"commentON")!]
        side2View = SideMemoMenu(image:imageArray, parentViewController:self)
        side2View.delegate = self
        self.view.addSubview(side2View)
        //コメントアイコンのbutton作成
        let commentrect:CGRect = CGRect(x: self.view.frame.width-50, y: self.view.frame.height*0.6, width: self.view.frame.width/12, height: self.view.frame.width/12)
        ThirdViewController.commentbutton.frame = commentrect;
        ThirdViewController.commentbutton.setTitleColor(.white, for: .normal)
        ThirdViewController.commentbutton.setImage(UIImage.init(named: "commentOFF"), for: UIControl.State.normal)
        ThirdViewController.commentbutton.addTarget(self, action: #selector(commentbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(ThirdViewController.commentbutton)
        
    }
    //トランプボタン
    //その絵札の見出しに移動する
    @objc func clubbuttonEvent(_ sender: UIButton,count:Int) {
        self.scrollView.contentOffset = CGPoint(x: 0, y:height2+180-screenWidth*1.54/16 )
    }
    @objc func diabuttonEvent(_ sender: UIButton,count:Int) {
        self.scrollView.contentOffset = CGPoint(x: 0, y:height3+30-screenWidth*1.54/16 )
    }
    @objc func heartbuttonEvent(_ sender: UIButton,count:Int) {
        self.scrollView.contentOffset = CGPoint(x: 0, y:height4+30-screenWidth*1.54/16 )
    }
    @objc func spadebuttonEvent(_ sender: UIButton,count:Int) {
        self.scrollView.contentOffset = CGPoint(x: 0, y:height5+30-screenWidth*1.54/16 )
    }
    //トランプボタン
    @objc func club1buttonEvent(_ sender: UIButton,count:Int) {
        self.scrollView.contentOffset = CGPoint(x: 0, y:0)
    }
    @objc func dia1buttonEvent(_ sender: UIButton,count:Int) {
        self.scrollView.contentOffset = CGPoint(x: 0, y:0)
    }
    @objc func heart1buttonEvent(_ sender: UIButton,count:Int) {
        self.scrollView.contentOffset = CGPoint(x: 0, y:0)
    }
    @objc func spade1buttonEvent(_ sender: UIButton,count:Int) {
        self.scrollView.contentOffset = CGPoint(x: 0, y:0)
    }
    
    //レーダーチャート
    //グラフの数を設定する
    func numberOfSections(in radarChartView: AMRadarChartView) -> Int {
        return 1
    }
    // 項目数を設定する（頂点の数）
    func numberOfRows(in radarChartView: AMRadarChartView) -> Int {
        return 8
    }
    // 各項目の値を設定する
    func radarChartView(_ radarChartView: AMRadarChartView, valueForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        let value: [CGFloat] = [5,8,3,4,3,1,5,6]
        return value[indexPath.row]
    }
    // 各グラフの塗りつぶし色を設定する
    func radarChartView(_ radarChartView: AMRadarChartView, fillColorForSection section: Int) -> UIColor {
        return UIColor.systemBlue
    }
    // 各グラフの枠線色を設定する
    func radarChartView(_ radarChartView: AMRadarChartView, strokeColorForSection section: Int) -> UIColor {
        return UIColor.black
    }
    // 各頂点の文字を設定する
    func radarChartView(_ radarChartView: AMRadarChartView, titleForXlabelInRow row: Int) -> String {
        return key[row]
    }
    //パイチャート
    /// 扇の数を設定する
    func numberOfSections(in pieChartView: AMPieChartView) -> Int{
        2
    }
    /// 各項目の値を設定する
    func pieChartView(_ pieChartView:AMPieChartView, valueForSection section: Int) -> CGFloat{
        let number = [60,40]
        return CGFloat(number[section])
    }
    /// 各項目の色を設定する
    func pieChartView(_ pieChartView:AMPieChartView, colorForSection section: Int) -> UIColor{
        let color:[UIColor] = [UIColor.blue,UIColor.systemPink]
        return color[section]
    }
    /// 項目選択時に呼ばれる
    func pieChartView(_ pieChartView:AMPieChartView, didSelectSection section: Int){
        if section == 0{
            pieChartView.centerLabelText = "男性"
            
        }else if section == 1{
            pieChartView.centerLabelText = "女性"
        }
    }
    /// 項目選択解除時に呼ばれる
    func pieChartView(_ pieChartView:AMPieChartView, didDeSelectSection section: Int){
        pieChartView.centerLabelText = "男女比"
    }
    
    //コメントアイコンのbuttonを押すと呼ばれる
    @objc func commentbuttonEvent(_ sender: UIButton,count:Int) {
        if SideMemoMenu.clearView.isHidden == true {
            SideMemoMenu.clearView.isHidden = false
            side2View.getButtonGesture(sender:sender)
            sender.setImage(UIImage.init(named: "commentON"), for: UIControl.State.normal)
        }else{
            SideMemoMenu.clearView.isHidden = true
            side2View.rightswipViewDidAppear(false)
            sender.setImage(UIImage.init(named: "commentOFF"), for: UIControl.State.normal)
        }
    }
    @objc func rightEdgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        side2View.getEdgeGesture(sender: sender)
        
    }
    //他の場所を押すとキーボードが閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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

extension UIImageView {
    
    func circle(screenWidth: CGFloat) {
        layer.masksToBounds = false
        layer.cornerRadius = screenWidth/16
        clipsToBounds = true
    }
}
