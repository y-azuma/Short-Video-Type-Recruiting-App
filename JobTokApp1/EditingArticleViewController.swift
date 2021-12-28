//
//  ThirdViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/08/20.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit
import AMChart

class EditingArticleViewController: UIViewController,AMRadarChartViewDataSource,AMPieChartViewDataSource,AMPieChartViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate {

    var ImageView: UIImageView!
    var side2View : SideMemoMenu!
    let savebutton:UIButton = UIButton()
    let editbutton:UIButton = UIButton()
    
    
    let scrollView = UIScrollView()

    // スクリーンの縦横サイズを取得
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    //トランプボタン囲む枠
    var label = UILabel()
    
    //radarchartview
    var radarlabel = UILabel()
    var radarChartView = AMRadarChartView()
    
    //piechartview
    var pielabel = UILabel()
    var pieChartView = AMPieChartView()
    
    /*見出し
    var clublabel = UILabel()
    var dialabel = UILabel()
    var heartlabel = UILabel()
    var spadelabel = UILabel()
    var logolabel = UILabel()
    */
    
    var clubimageheight:CGFloat = 0
    var diaimageheight:CGFloat = 0
    var heartimageheight:CGFloat = 0
    var spadeimageheight:CGFloat = 0
    
    //画像選択ボタン
    let headerimagebutton:UIButton = UIButton()
    let iconimagebutton:UIButton = UIButton()
    let clubimagebutton:UIButton = UIButton()
    let diaimagebutton:UIButton = UIButton()
    let heartimagebutton:UIButton = UIButton()
    let spadeimagebutton:UIButton = UIButton()
    let logoimagebutton:UIButton = UIButton()
    
    let radareditbutton:UIButton = UIButton()
    let pieeditbutton:UIButton = UIButton()
    //記事の画像
    var headerimage:UIImage = UIImage()
    var headerimageView:UIImageView = UIImageView()
    var iconimage:UIImage = UIImage()
    var iconimageView:UIImageView = UIImageView()
    var clubimage:UIImage = UIImage()
    var clubimageView:UIImageView = UIImageView()
    var diaimage:UIImage = UIImage()
    var diaimageView:UIImageView = UIImageView()
    var heartimage:UIImage = UIImage()
    var heartimageView:UIImageView = UIImageView()
    var spadeimage:UIImage = UIImage()
    var spadeimageView:UIImageView = UIImageView()
    var logoimage:UIImage = UIImage()
    var logoimageView:UIImageView = UIImageView()
    
    //画像の幅、高さ
    var headerimgWidth:CGFloat = 0
    var headerimgHeight:CGFloat = 0
    var iconimgWidth:CGFloat = 0
    var iconimgHeight:CGFloat = 0
    var clubimgWidth:CGFloat = 0
    var clubimgHeight:CGFloat = 0
    var diaimgWidth:CGFloat = 0
    var diaimgHeight:CGFloat = 0
    var heartimgWidth:CGFloat = 0
    var heartimgHeight:CGFloat = 0
    var spadeimgWidth:CGFloat = 0
    var spadeimgHeight:CGFloat = 0
    var logoimgWidth:CGFloat = 0
    var logoimgHeight:CGFloat = 0
    
    //どれが画像選択されているのかを表すタグ
    var headerimagetag = 0
    var iconimagetag = 0
    var clubimagetag = 0
    var diaimagetag = 0
    var heartimagetag = 0
    var spadeimagetag = 0
    var logoimagetag = 0
    
    var radareditttag = 0
    var pieedittag = 0
    
    //画像ののタテヨコ比
    var headerimagescale:CGFloat = 0
    var iconimagescale:CGFloat = 0
    var clubimagescale:CGFloat = 0
    var diaimagescale:CGFloat = 0
    var heartimagescale:CGFloat = 0
    var spadeimagescale:CGFloat = 0
    var logoimagescale:CGFloat = 0
    
    //textview
    var headingTextView: UITextView!
    var iconTextView: UITextView!
    var myTextView2: UITextView!
    var myTextView3: UITextView!
    var myTextView4: UITextView!
    var myTextView5: UITextView!
    var myTextView6: UITextView!
    
    var clublabel:UITextView!
    var dialabel:UITextView!
    var heartlabel:UITextView!
    var spadelabel:UITextView!
    var logolabel:UITextView!
    
    //各見出しの高さを取得
    var height1: CGFloat = 0
    var height2: CGFloat = 0
    var height3: CGFloat = 0
    var height4: CGFloat = 0
    var height5: CGFloat = 0
    var height6: CGFloat = 0
    var height7:CGFloat = 0
    
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
        headerimage = UIImage(named:"jobtokimage14")!
        // UIImageView 初期化
        headerimageView = UIImageView(image:headerimage)
        // 画像の縦横サイズを取得
        headerimgWidth = headerimage.size.width
        headerimgHeight = headerimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        headerimagescale = headerimgHeight / headerimgWidth
        let headerimagerect:CGRect =
            CGRect(x:0, y:0, width:screenWidth, height:screenWidth*headerimagescale)
        // ImageView frame をCGRectで作った矩形に合わせる
        headerimageView.frame = headerimagerect;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(headerimageView)
        
        //編集モードでのヘッダー画像変更ボタン
        headerimagebutton.frame = headerimagerect;
        headerimagebutton.isHidden = true
        headerimagebutton.addTarget(self, action: #selector(headerimagebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(headerimagebutton)
        
        // TextView生成する.
        headingTextView = UITextView(frame: CGRect(x: 0, y: screenWidth*headerimagescale+10, width: screenWidth, height: 0))
        headingTextView.delegate = self
        //headingTextView.layer.position = CGPoint(x: screenWidth/2, y:screenWidth*headerimagescale+10+screenHeight/2)
        // TextViewの背景を黃色に設定する.
        headingTextView.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        headingTextView.text = "文字文字文字文字文字文字文字！"
        headingTextView.font = UIFont.systemFont(ofSize: CGFloat(30))
        headingTextView.sizeToFit()
        headingTextView.layer.position = CGPoint(x: screenWidth/2, y:screenWidth*headerimagescale+10+headingTextView.frame.height/2)
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
        iconimage = UIImage(named:"iconA")!
        iconimageView = UIImageView(image:iconimage)
        // 画像の縦横サイズを取得
        iconimgWidth = iconimage.size.width
        iconimgHeight = iconimage.size.height
        iconimagescale = iconimgHeight / iconimgWidth
        iconimageView.contentMode = .scaleAspectFill
        iconimageView.clipsToBounds = true
        iconimageView.layer.cornerRadius = iconimgHeight / 2.0
        let iconrect:CGRect = CGRect(x:0,y:screenWidth*headerimagescale+headingTextView.frame.height+10,width: screenWidth/8,height: iconimagescale*screenWidth/8 )
        iconimageView.frame = iconrect;
        iconimageView.circle(screenWidth: screenWidth)
        scrollView.addSubview(iconimageView)
        
        //編集モードでのアイコン画像変更ボタン
        iconimagebutton.frame = iconrect;
        iconimagebutton.isHidden = true
        iconimagebutton.addTarget(self, action: #selector(iconimagebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(iconimagebutton)
        
        // TextView生成する.
        iconTextView = UITextView(frame: CGRect(x:10+screenWidth/8, y:screenWidth*headerimagescale+headingTextView.frame.height+5, width: screenWidth-(10+screenWidth/8), height: iconimagescale*screenWidth/7))
        iconTextView.layer.position = CGPoint(x:10+screenWidth/8+screenWidth/2, y:screenWidth*headerimagescale+headingTextView.frame.height+5+iconimagescale*screenWidth/14)
        iconTextView.delegate = self
        // TextViewの背景を黃色に設定する.
        iconTextView.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        iconTextView.text = "株式会社○○ 代表取締役社長\n安藤 桃香"
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
        label = UILabel()
        label.frame = CGRect(x:7, y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16-screenWidth*1.54/16-10, width:screenWidth-14, height:screenWidth*1.54/8+20)
        label.text = ""
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.layer.borderWidth = 2.0   // 枠線の幅（0なので表示なし）
        label.layer.borderColor = UIColor.black.cgColor // 枠線の色
        scrollView.addSubview(label)
        //トランプButton
        //clubボタン
        let clubrect:CGRect = CGRect(x: screenWidth/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        clubbutton.frame = clubrect;
        // 任意の場所に設置する
        clubbutton.layer.position = CGPoint(x:screenWidth/8 ,y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16 )
        clubbutton.setImage(UIImage.init(named: "club"), for: UIControl.State.normal)
        clubbutton.backgroundColor = UIColor.white
        //ボタンの四隅に余白をつける
        clubbutton.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        clubbutton.addTarget(self, action: #selector(clubbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(clubbutton)
        
        //diaボタン
        let diarect:CGRect = CGRect(x: screenWidth*3/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        diabutton.frame = diarect;
        // 任意の場所に設置する
        diabutton.layer.position = CGPoint(x:screenWidth*3/8 ,y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16)
        diabutton.setImage(UIImage.init(named: "dia"), for: UIControl.State.normal)
        //ボタンの四隅に余白をつける
        diabutton.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        diabutton.backgroundColor = UIColor.white
        diabutton.addTarget(self, action: #selector(diabuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(diabutton)
        
        //heartボタン
        let heartrect:CGRect = CGRect(x: screenWidth*5/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        heartbutton.frame = heartrect;
        // 任意の場所に設置する
        heartbutton.layer.position = CGPoint(x:screenWidth*5/8 ,y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16 )
        heartbutton.setImage(UIImage.init(named: "heart"), for: UIControl.State.normal)
        //ボタンの四隅に余白をつける
        heartbutton.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        heartbutton.backgroundColor = UIColor.white
        heartbutton.addTarget(self, action: #selector(heartbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(heartbutton)
        
        //spadeボタン
        let spaderect:CGRect = CGRect(x: screenWidth*7/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        spadebutton.frame = spaderect;
        // 任意の場所に設置する
        spadebutton.layer.position = CGPoint(x:screenWidth*7/8 ,y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16)
        spadebutton.setImage(UIImage.init(named: "spade"), for: UIControl.State.normal)
        //ボタンの四隅に余白をつける
        spadebutton.imageEdgeInsets = UIEdgeInsets(top: 53, left: 40, bottom: 53, right: 40)
        spadebutton.backgroundColor = UIColor.white
        spadebutton.addTarget(self, action: #selector(spadebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(spadebutton)
        
        
        
        height1 = screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth/2
        
        
        //求める人材
        radarlabel = UILabel()
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
        radarChartView = AMRadarChartView(frame: CGRect(x: screenWidth/2, y: height1+radarlabel.frame.height+100, width: 300, height: 300))
        radarChartView.layer.position = CGPoint(x: screenWidth/2, y: height1+radarlabel.frame.height+100)
        // customize here
        radarChartView.dataSource = self
        radarChartView.numberOfAxisLabels = 10
        radarChartView.axisMaxValue = 10
        radarChartView.axisMinValue = 0
        radarChartView.axisDecimalFormat = .none
        scrollView.addSubview(radarChartView)
        //編集モードでのグラフ編集ボタン
        radareditbutton.frame = CGRect(x: screenWidth/2, y: height1+radarlabel.frame.height+100, width: 300, height: 300)
        radareditbutton.layer.position = CGPoint(x: screenWidth/2, y: height1+radarlabel.frame.height+100)
        radareditbutton.isHidden = true
        radareditbutton.addTarget(self, action: #selector(radareditbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(radareditbutton)
        
        //男女比
        pielabel = UILabel()
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
        
        //編集モードでのグラフ編集ボタン
        pieeditbutton.frame = CGRect(x: screenWidth/2, y: height1+radarlabel.frame.height+100, width: 300, height: 300)
        pieeditbutton.layer.position = CGPoint(x: screenWidth/2, y: height1+radarlabel.frame.height+100)
        pieeditbutton.isHidden = true
        pieeditbutton.addTarget(self, action: #selector(pieeditbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(pieeditbutton)

        //PieChart
        pieChartView = AMPieChartView(frame: CGRect(x: screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370,width: 200,height: 200))
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
        //clublabel = UILabel()
        clublabel = UITextView(frame: CGRect(x: screenWidth*2/8,y: height2+200-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0))
        //clublabel.frame = CGRect(x: screenWidth*2/8,y: height2+200-screenWidth*1.54/32,width: 0,height: 0)
        //clublabel.layer.position = CGPoint(x:screenWidth*2/8,y: height2+200-screenWidth*1.54/32)
        clublabel.font = UIFont.systemFont(ofSize: CGFloat(30))
        clublabel.delegate = self
        clublabel.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        clublabel.text = "企業概要"
        clublabel.sizeToFit()
        clublabel.isEditable = false
        height2 += clublabel.frame.height - 50
        // フォントの色の設定をする.
        clublabel.textColor = UIColor.black
        // 左詰めの設定をする.
        clublabel.textAlignment = NSTextAlignment.left
        clublabel.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(clublabel)
        
        //clubimage
        clubimage = UIImage(named:"clubimage")!
        // UIImageView 初期化
        clubimageView = UIImageView(image:clubimage)
        // 画像の縦横サイズを取得
        clubimgWidth = clubimage.size.width
        clubimgHeight = clubimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        clubimagescale = clubimgHeight / clubimgWidth
        let clubimagerect:CGRect =
            CGRect(x:screenWidth/8, y:height2+250, width:screenWidth*6/8, height:(screenWidth*6/8)*clubimagescale)
        clubimageheight = (screenWidth*6/8)*clubimagescale
        // ImageView frame をCGRectで作った矩形に合わせる
        clubimageView.frame = clubimagerect;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(clubimageView)
        
        //編集モードでのヘッダー画像変更ボタン
        clubimagebutton.frame = clubimagerect;
        clubimagebutton.isHidden = true
        clubimagebutton.addTarget(self, action: #selector(clubimagebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(clubimagebutton)
        
        // TextView生成する.
        myTextView2 = UITextView(frame: CGRect(x: screenWidth/2, y:height2+250+clubimageheight, width: screenWidth*6/8, height:0))
        myTextView2.layer.position = CGPoint(x: screenWidth/2, y:height2+250+clubimageheight)
        // TextViewの背景を黃色に設定する.
        myTextView2.delegate = self
        myTextView2.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        myTextView2.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字！"
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
        //dialabel = UILabel()
        dialabel = UITextView(frame: CGRect(x: screenWidth*2/8,y: height3+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0))
        //dialabel.frame = CGRect(x: screenWidth/8,y: height3+50-screenWidth*1.54/32,width: 0,height: 0)
        //dialabel.layer.position = CGPoint(x:screenWidth*2/8,y: height3+50-screenWidth*1.54/32)
        dialabel.font = UIFont.systemFont(ofSize: CGFloat(30))
        dialabel.delegate = self
        dialabel.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        dialabel.text = "募集対象"
        dialabel.sizeToFit()
        dialabel.isEditable = false
        height3 += dialabel.frame.height - 50
        // フォントの色の設定をする.
        dialabel.textColor = UIColor.black
        // 左詰めの設定をする.
        dialabel.textAlignment = NSTextAlignment.left
        dialabel.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(dialabel)
        
        //diaimage
        diaimage = UIImage(named:"diaimage")!
        // UIImageView 初期化
        diaimageView = UIImageView(image:diaimage)
        // 画像の縦横サイズを取得
        diaimgWidth = diaimage.size.width
        diaimgHeight = diaimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        diaimagescale = diaimgHeight / diaimgWidth
        let diaimagerect:CGRect =
            CGRect(x:screenWidth/8, y:height3+100, width:screenWidth*6/8, height:(screenWidth*6/8)*diaimagescale)
        diaimageheight = (screenWidth*6/8)*diaimagescale
        // ImageView frame をCGRectで作った矩形に合わせる
        diaimageView.frame = diaimagerect;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(diaimageView)
        
        //編集モードでのヘッダー画像変更ボタン
        diaimagebutton.frame = diaimagerect;
        diaimagebutton.isHidden = true
        diaimagebutton.addTarget(self, action: #selector(diaimagebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(diaimagebutton)
        
        // TextView生成する.
        myTextView3 = UITextView(frame: CGRect(x: screenWidth/2, y:height3+100+diaimageheight, width: screenWidth*6/8, height:0))
        myTextView3.layer.position = CGPoint(x: screenWidth/2, y:height3+100+diaimageheight)
        myTextView3.delegate = self
        // TextViewの背景を黃色に設定する.
        myTextView3.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        myTextView3.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字"
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
        //heartlabel = UILabel()
        heartlabel = UITextView(frame: CGRect(x: screenWidth*2/8,y: height4+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0))
        //heartlabel.frame = CGRect(x: screenWidth/8,y: height4+50-screenWidth*1.54/32,width: 0,height: 0)
        //heartlabel.layer.position = CGPoint(x:screenWidth*2/8,y: height4+50-screenWidth*1.54/32)
        heartlabel.font = UIFont.systemFont(ofSize: CGFloat(30))
        heartlabel.delegate = self
        heartlabel.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        heartlabel.text = "こんなことやります！"
        heartlabel.sizeToFit()
        heartlabel.isEditable = false
        height4 += heartlabel.frame.height - 50
        // フォントの色の設定をする.
        heartlabel.textColor = UIColor.black
        // 左詰めの設定をする.
        heartlabel.textAlignment = NSTextAlignment.left
        heartlabel.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(heartlabel)
        
        //heartimage
        heartimage = UIImage(named:"heartimage")!
        // UIImageView 初期化
        heartimageView = UIImageView(image:heartimage)
        // 画像の縦横サイズを取得
        heartimgWidth = heartimage.size.width
        heartimgHeight = heartimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        heartimagescale = heartimgHeight / heartimgWidth
        let heartimagerect:CGRect =
            CGRect(x:screenWidth/8, y:height4+100, width:screenWidth*6/8, height:(screenWidth*6/8)*heartimagescale)
        heartimageheight = (screenWidth*6/8)*heartimagescale
        // ImageView frame をCGRectで作った矩形に合わせる
        heartimageView.frame = heartimagerect;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(heartimageView)
        
        //編集モードでのヘッダー画像変更ボタン
        heartimagebutton.frame = heartimagerect;
        heartimagebutton.isHidden = true
        heartimagebutton.addTarget(self, action: #selector(heartimagebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(heartimagebutton)
        
        // TextView生成する.
        myTextView4 = UITextView(frame: CGRect(x: screenWidth/2, y:height4+100+heartimageheight, width: screenWidth*6/8, height:0))
        myTextView4.layer.position = CGPoint(x: screenWidth/2, y:height4+100+heartimageheight)
        myTextView4.delegate = self
        // TextViewの背景を黃色に設定する.
        myTextView4.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        myTextView4.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字！"
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
        //spadelabel = UILabel()
        spadelabel = UITextView(frame: CGRect(x: screenWidth*2/8,y: height5+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0))
        //spadelabel.frame = CGRect(x: screenWidth/8,y: height5+50-screenWidth*1.54/32,width: 0,height: 0)
        //spadelabel.layer.position = CGPoint(x:screenWidth*2/8,y: height5+50-screenWidth*1.54/32)
        spadelabel.font = UIFont.systemFont(ofSize: CGFloat(30))
        spadelabel.delegate = self
        spadelabel.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        spadelabel.text = "我が社の特徴"
        spadelabel.sizeToFit()
        spadelabel.isEditable = false
        height5 += spadelabel.frame.height - 50
        // フォントの色の設定をする.
        spadelabel.textColor = UIColor.black
        // 左詰めの設定をする.
        spadelabel.textAlignment = NSTextAlignment.left
        spadelabel.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(spadelabel)
        
        //spadeimage
        spadeimage = UIImage(named:"spadeimage")!
        // UIImageView 初期化
        spadeimageView = UIImageView(image:spadeimage)
        // 画像の縦横サイズを取得
        spadeimgWidth = spadeimage.size.width
        spadeimgHeight = spadeimage.size.height
        // 画像サイズをスクリーン幅に合わせる
        spadeimagescale = spadeimgHeight / spadeimgWidth
        let spadeimagerect:CGRect =
            CGRect(x:screenWidth/8, y:height5+100, width:screenWidth*6/8, height:(screenWidth*6/8)*spadeimagescale)
        spadeimageheight = (screenWidth*6/8)*spadeimagescale
        // ImageView frame をCGRectで作った矩形に合わせる
        spadeimageView.frame = spadeimagerect;
        // UIImageViewのインスタンスをビューに追加
        scrollView.addSubview(spadeimageView)
        
        //編集モードでのヘッダー画像変更ボタン
        spadeimagebutton.frame = spadeimagerect;
        spadeimagebutton.isHidden = true
        spadeimagebutton.addTarget(self, action: #selector(spadeimagebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(spadeimagebutton)

        // TextView生成する.
        myTextView5 = UITextView(frame: CGRect(x: screenWidth/2, y:height5+100+spadeimageheight, width: screenWidth*6/8, height:0))
        myTextView5.layer.position = CGPoint(x: screenWidth/2, y:height5+100+spadeimageheight)
        myTextView5.delegate = self
        // TextViewの背景を黃色に設定する.
        myTextView5.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        // 表示させるテキストを設定する.
        myTextView5.text = "文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字文字！"
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
        logoimage = UIImage(named:"logo")!
        logoimageView = UIImageView(image:logoimage)
        // 画像の縦横サイズを取得
        logoimgWidth = logoimage.size.width
        logoimgHeight = logoimage.size.height
        logoimagescale = logoimgHeight / logoimgWidth
        logoimageView.contentMode = .scaleAspectFill
        logoimageView.clipsToBounds = true
        logoimageView.layer.cornerRadius = iconimgHeight / 2.0
        let logorect:CGRect = CGRect(x:screenWidth/2-screenWidth/16,y:height6+50,width: screenWidth/8,height: logoimagescale*screenWidth/8 )
        logoimageView.frame = logorect;
        logoimageView.circle(screenWidth: screenWidth)
        scrollView.addSubview(logoimageView)
        
        //編集モードでのヘッダー画像変更ボタン
        logoimagebutton.frame = logorect;
        logoimagebutton.isHidden = true
        logoimagebutton.addTarget(self, action: #selector(logoimagebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        scrollView.addSubview(logoimagebutton)
        
        //会社ラベル
        //logolabel = UILabel()
        logolabel = UITextView(frame: CGRect(x: screenWidth/2,y: height6+50+logoimagescale*screenWidth/8 ,width: 0,height: 0))
        //logolabel.frame = CGRect(x: screenWidth/2,y: height6+50+logoimagescale*screenWidth/8 ,width: 0,height: 0)
        logolabel.layer.position = CGPoint(x:screenWidth*2/8,y: height6+50+logoimagescale*screenWidth/8)
        logolabel.font = UIFont.systemFont(ofSize: CGFloat(20))
        logolabel.delegate = self
        logolabel.backgroundColor =  UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
        logolabel.text = "株式会社スタートアップ"
        logolabel.sizeToFit()
        logolabel.isEditable = false
        height6 += logolabel.frame.height - 50
        // フォントの色の設定をする.
        logolabel.textColor = UIColor.black
        // 左詰めの設定をする.
        logolabel.textAlignment = NSTextAlignment.left
        logolabel.isScrollEnabled = false
        // TextViewをViewに追加する.
        scrollView.addSubview(logolabel)
        
        //企業情報
        // TextView生成する.
        myTextView6 = UITextView(frame: CGRect(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8, width: screenWidth+200, height:0))
        myTextView6.layer.position = CGPoint(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8)
        myTextView6.delegate = self
        // TextViewの背景を黃色に設定する.
        myTextView6.backgroundColor =  UIColor.gray
        // 表示させるテキストを設定する.
        myTextView6.text = "住所：   東京都渋谷区渋谷 〇〇ビル9階\n設立:   2011年に設立\nメンバー：   20人のメンバー\n資本金：   2000万\nホームページ：   URL"
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
        
        height7 = height6+100+logoimagescale*screenWidth/8+myTextView6.frame.height
        
        scrollView.contentSize = CGSize(width:screenWidth, height:height7-220)
        
        //saveアイコンのbutton作成
        let saverect:CGRect = CGRect(x: self.view.frame.width-50, y: self.view.frame.height*0.4, width: self.view.frame.width/12, height: self.view.frame.width/12)
        savebutton.frame = saverect;
        savebutton.setTitleColor(.white, for: .normal)
        savebutton.setImage(UIImage.init(named: "saveON"), for: UIControl.State.normal)
        savebutton.addTarget(self, action: #selector(savebuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(savebutton)
        
        //editアイコンのbutton作成
        let editrect:CGRect = CGRect(x: self.view.frame.width-50, y: self.view.frame.height*0.5, width: self.view.frame.width/12, height: self.view.frame.width/12)
        editbutton.frame = editrect;
        editbutton.setTitleColor(.white, for: .normal)
        editbutton.setImage(UIImage.init(named: "editOFF"), for: UIControl.State.normal)
        editbutton.addTarget(self, action: #selector(editbuttonEvent(_:count:)), for: UIControl.Event.touchUpInside)
        self.view.addSubview(editbutton)
        
        
        
        //右スワイプ
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.rightViewDidAppear(_:)))
        rightSwipeGesture.direction = .right
        // 画面にジェスチャーを登録
        self.view.addGestureRecognizer(rightSwipeGesture)
        
        
        
    }
    func textViewDidChange(_ textView: UITextView) {
        
        let headerimagerect:CGRect =
            CGRect(x:0, y:0, width:screenWidth, height:screenWidth*headerimagescale)
        headerimageView.frame = headerimagerect;
        headerimagebutton.frame = headerimagerect;
        headingTextView.frame = CGRect(x: 0, y: screenWidth*headerimagescale+10, width: screenWidth, height: 0)
        headingTextView.layer.position = CGPoint(x: screenWidth/2, y:screenWidth*headerimagescale+10+headingTextView.frame.height/2)
        headingTextView.sizeToFit()
        //icon
        let iconrect:CGRect = CGRect(x:0,y:screenWidth*headerimagescale+headingTextView.frame.height+10,width: screenWidth/8,height: iconimagescale*screenWidth/8 )
        iconimageView.frame = iconrect;
        iconimagebutton.frame = iconrect;
        iconTextView.frame = CGRect(x:10+screenWidth/8, y:screenWidth*headerimagescale+headingTextView.frame.height+5, width: screenWidth-(10+screenWidth/8), height: iconimagescale*screenWidth/7)
        iconTextView.layer.position = CGPoint(x:10+screenWidth/8+screenWidth/2/*変更*/, y:screenWidth*headerimagescale+headingTextView.frame.height+5+iconimagescale*screenWidth/14)
        //button
        label.frame = CGRect(x:7, y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16-screenWidth*1.54/16-10, width:screenWidth-14, height:screenWidth*1.54/8+20)
        let clubrect:CGRect = CGRect(x: screenWidth/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        clubbutton.frame = clubrect;
        clubbutton.layer.position = CGPoint(x:screenWidth/8 ,y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16 )
        let diarect:CGRect = CGRect(x: screenWidth*3/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        diabutton.frame = diarect;
        diabutton.layer.position = CGPoint(x:screenWidth*3/8 ,y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16)
        let heartrect:CGRect = CGRect(x: screenWidth*5/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        heartbutton.frame = heartrect;
        heartbutton.layer.position = CGPoint(x:screenWidth*5/8 ,y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16 )
        let spaderect:CGRect = CGRect(x: screenWidth*7/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
        spadebutton.frame = spaderect;
        spadebutton.layer.position = CGPoint(x:screenWidth*7/8 ,y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16)
        //height1
        height1 = screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth/2
        //radar
        radarlabel.frame = CGRect(x: screenWidth/8,y: height1-40,width: 0,height: 0)
        radarlabel.layer.position = CGPoint(x:screenWidth/8,y: height1-40)
        radarlabel.sizeToFit()
        radarChartView.frame = CGRect(x: screenWidth/2, y: height1+radarlabel.frame.height+100, width: 300, height: 300)
        radarChartView.layer.position = CGPoint(x: screenWidth/2, y: height1+radarlabel.frame.height+100)
        radareditbutton.frame = CGRect(x: screenWidth/2, y: height1+radarlabel.frame.height+100, width: 300, height: 300)
        radareditbutton.layer.position = CGPoint(x: screenWidth/2, y: height1+radarlabel.frame.height+100)
        //pie
        pielabel.frame = CGRect(x: screenWidth/8,y: height1+radarlabel.frame.height+250,width: 0,height: 0)
        pielabel.layer.position = CGPoint(x:screenWidth/8,y: height1+radarlabel.frame.height+250)
        pielabel.sizeToFit()
        pieChartView.frame = CGRect(x: screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370,width: 200,height: 200)
        pieChartView.layer.position =  CGPoint(x:screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370)
        pieeditbutton.frame = CGRect(x: screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370,width: 200,height: 200)
        pieeditbutton.layer.position = CGPoint(x:screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370)
        //height2
        height2 = height1+radarlabel.frame.height+pielabel.frame.height+370
        //club
        let club1rect:CGRect = CGRect(x: screenWidth/8, y: height2+200, width: screenWidth/8, height: screenWidth*1.54/8)
        club1button.frame = club1rect;
        club1button.layer.position = CGPoint(x:screenWidth/8 ,y:height2+200)
        clublabel.frame = CGRect(x: screenWidth*2/8,y: height2+200-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
        //clublabel.layer.position = CGPoint(x:screenWidth*2/8,y: height2+200-screenWidth*1.54/32)
        clublabel.sizeToFit()
        height2 += clublabel.frame.height - 50
        let clubimagerect:CGRect =
        CGRect(x:screenWidth/8, y:height2+250, width:screenWidth*6/8, height:(screenWidth*6/8)*clubimagescale)
        clubimageView.frame = clubimagerect;
        clubimagebutton.frame = clubimagerect;
        myTextView2.frame =  CGRect(x: screenWidth/2, y:height2+250+clubimageheight, width: screenWidth*6/8, height:0)
        myTextView2.layer.position = CGPoint(x: screenWidth/2, y:height2+250+clubimageheight)
        myTextView2.sizeToFit()
        //height3
        height3 = height2+250+clubimageheight+myTextView2.frame.height
        //dia
        let dia1rect:CGRect = CGRect(x: screenWidth/8, y: height3+50, width: screenWidth/8, height: screenWidth*1.54/8)
        dia1button.frame = dia1rect;
        dia1button.layer.position = CGPoint(x:screenWidth/8 ,y:height3+50)
        dialabel.frame = CGRect(x: screenWidth*2/8,y: height3+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
        //dialabel.layer.position = CGPoint(x:screenWidth*2/8,y: height3+50-screenWidth*1.54/32)
        dialabel.sizeToFit()
        height3 += dialabel.frame.height - 50
        let diaimagerect:CGRect =
        CGRect(x:screenWidth/8, y:height3+100, width:screenWidth*6/8, height:(screenWidth*6/8)*diaimagescale)
        diaimageView.frame = diaimagerect;
        diaimagebutton.frame = diaimagerect;
        myTextView3.frame = CGRect(x: screenWidth/2, y:height3+100+diaimageheight, width: screenWidth*6/8, height:0)
        myTextView3.layer.position = CGPoint(x: screenWidth/2, y:height3+100+diaimageheight)
        myTextView3.sizeToFit()
        //height4
        height4 = height3+100+diaimageheight+myTextView3.frame.height
        //heart
        let heart1rect:CGRect = CGRect(x: screenWidth/8, y: height4+50, width: screenWidth/8, height: screenWidth*1.54/8)
        heart1button.frame = heart1rect;
        heart1button.layer.position = CGPoint(x:screenWidth/8 ,y:height4+50)
        heartlabel.frame = CGRect(x: screenWidth*2/8,y: height4+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
        //heartlabel.layer.position = CGPoint(x:screenWidth*2/8,y: height4+50-screenWidth*1.54/32)
        heartlabel.sizeToFit()
        height4 += heartlabel.frame.height - 50
        let heartimagerect:CGRect =
        CGRect(x:screenWidth/8, y:height4+100, width:screenWidth*6/8, height:(screenWidth*6/8)*heartimagescale)
        heartimageView.frame = heartimagerect;
        heartimagebutton.frame = heartimagerect;
        myTextView4.frame = CGRect(x: screenWidth/2, y:height4+100+heartimageheight, width: screenWidth*6/8, height:0)
        myTextView4.layer.position = CGPoint(x: screenWidth/2, y:height4+100+heartimageheight)
        myTextView4.sizeToFit()
        //height5
        height5 = height4+100+heartimageheight+myTextView4.frame.height
        //spade
        let spade1rect:CGRect = CGRect(x: screenWidth/8, y: height5+50, width: screenWidth/8, height: screenWidth*1.54/8)
        spade1button.frame = spade1rect;
        spade1button.layer.position = CGPoint(x:screenWidth/8 ,y:height5+50)
        spadelabel.frame = CGRect(x: screenWidth*2/8,y: height5+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
        //spadelabel.layer.position = CGPoint(x:screenWidth*2/8,y: height5+50-screenWidth*1.54/32)
        spadelabel.sizeToFit()
        height5 += spadelabel.frame.height - 50
        let spadeimagerect:CGRect =
        CGRect(x:screenWidth/8, y:height5+100, width:screenWidth*6/8, height:(screenWidth*6/8)*spadeimagescale)
        spadeimageView.frame = spadeimagerect;
        spadeimagebutton.frame = spadeimagerect;
        myTextView5.frame = CGRect(x: screenWidth/2, y:height5+100+spadeimageheight, width: screenWidth*6/8, height:0)
        myTextView5.layer.position = CGPoint(x: screenWidth/2, y:height5+100+spadeimageheight)
        myTextView5.sizeToFit()
        //height6
        height6 = height5+100+spadeimageheight+myTextView5.frame.height
        //logo
        let logorect:CGRect = CGRect(x:screenWidth/2-screenWidth/16,y:height6+50,width: screenWidth/8,height: logoimagescale*screenWidth/8 )
        logoimageView.frame = logorect;
        logoimagebutton.frame = logorect;
        logolabel.frame = CGRect(x: screenWidth/2,y: height6+50+logoimagescale*screenWidth/8 ,width: 0,height: 0)
        logolabel.layer.position = CGPoint(x:screenWidth*2/8,y: height6+50+logoimagescale*screenWidth/8)
        logolabel.sizeToFit()
        height6 += logolabel.frame.height - 50
        myTextView6.frame = CGRect(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8, width: screenWidth+200, height:0)
        myTextView6.layer.position = CGPoint(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8)
        myTextView6.sizeToFit()
        //height7
        height7 = height6+100+logoimagescale*screenWidth/8+myTextView6.frame.height
        //scrollview
        scrollView.contentSize = CGSize(width:screenWidth, height:height7-220)
    }
    @objc func rightViewDidAppear(_ animated: Bool) {
        // 次の遷移先のViewControllerインスタンスを生成する
        let vc = CompanyAccountViewController()
        vc.modalTransitionStyle = .flipHorizontal
        vc.modalPresentationStyle = .fullScreen
        // presentViewControllerメソッドで遷移する
        // ここで、animatedをtrueにするとアニメーションしながら遷移できる
        self.present(vc, animated: true, completion: nil)
    }
    @objc func savebuttonEvent(_ sender: UIButton,count:Int) {
        editbutton.setImage(UIImage.init(named: "editOFF"), for: UIControl.State.normal)
        
        headingTextView.isEditable = false
        iconTextView.isEditable = false
        myTextView2.isEditable = false
        myTextView3.isEditable = false
        myTextView4.isEditable = false
        myTextView5.isEditable = false
        myTextView6.isEditable = false
        clublabel.isEditable = false
        dialabel.isEditable = false
        heartlabel.isEditable = false
        spadelabel.isEditable = false
        headerimagebutton.isHidden = true
        iconimagebutton.isHidden = true
        clubimagebutton.isHidden = true
        diaimagebutton.isHidden = true
        heartimagebutton.isHidden = true
        spadeimagebutton.isHidden = true
        logoimagebutton.isHidden = true
        
    }
    @objc func editbuttonEvent(_ sender: UIButton,count:Int) {
        editbutton.setImage(UIImage.init(named: "editON"), for: UIControl.State.normal)
        headingTextView.isEditable = true
        iconTextView.isEditable = true
        myTextView2.isEditable = true
        myTextView3.isEditable = true
        myTextView4.isEditable = true
        myTextView5.isEditable = true
        myTextView6.isEditable = true
        clublabel.isEditable = true
        dialabel.isEditable = true
        heartlabel.isEditable = true
        spadelabel.isEditable = true
        headerimagebutton.isHidden = false
        iconimagebutton.isHidden = false
        clubimagebutton.isHidden = false
        diaimagebutton.isHidden = false
        heartimagebutton.isHidden = false
        spadeimagebutton.isHidden = false
        logoimagebutton.isHidden = false
    }
    @IBAction func editgraph() {
        let alertController = UIAlertController(title: "グラフを編集する", message: "グラフを編集する", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        let editAction = UIAlertAction(title:"編集", style:  .default) {(action)in
            alertController.dismiss(animated: true, completion: nil)
        }
        let removeAction = UIAlertAction(title: "削除", style: .default) { (action) in
            //if(){}
            alertController.dismiss(animated: true, completion: nil)
            }
        alertController.addAction(cancelAction)
        alertController.addAction(editAction)
        alertController.addAction(removeAction)
        self.present(alertController, animated: true, completion: nil)
        }
        
    @IBAction func selectImage() {
        let alertController = UIAlertController(title: "画像選択", message: "シェアする画像を選択して下さい。", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        let removeAction = UIAlertAction(title: "削除", style: .default) { (action) in
            if (self.headerimagetag == 1){
                self.headerimagetag = 0
                
                self.headerimagescale = 0.1
                self.headerimageView.isHidden = true
                let headerimagerect:CGRect =
                    CGRect(x:0, y:0, width:self.screenWidth, height:self.screenWidth*self.headerimagescale)
                self.headerimageView.frame = headerimagerect;
                self.headerimagebutton.frame = headerimagerect;
                self.headingTextView.frame = CGRect(x: 0, y: self.screenWidth*self.headerimagescale+10, width: self.screenWidth, height: 0)
                self.headingTextView.layer.position = CGPoint(x: self.screenWidth/2, y:self.screenWidth*self.headerimagescale+10+self.headingTextView.frame.height/2)
                self.headingTextView.sizeToFit()
                //icon
                let iconrect:CGRect = CGRect(x:0,y:self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+10,width: self.screenWidth/8,height: self.iconimagescale*self.screenWidth/8 )
                self.iconimageView.frame = iconrect;
                self.iconimagebutton.frame = iconrect;
                self.iconTextView.frame = CGRect(x:10+self.screenWidth/8, y:self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+5, width: self.screenWidth-(10+self.screenWidth/8), height: self.iconimagescale*self.screenWidth/7)
                self.iconTextView.layer.position = CGPoint(x:10+self.screenWidth/8+self.screenWidth/2/*変更*/, y:self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+5+self.iconimagescale*self.screenWidth/14)
                //button
                self.label.frame = CGRect(x:7, y:self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+50+self.iconimagescale*self.screenWidth*3/16-self.screenWidth*1.54/16-10, width:self.screenWidth-14, height:self.screenWidth*1.54/8+20)
                let clubrect:CGRect = CGRect(x: self.screenWidth/8, y: self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+50+self.iconimagescale*self.screenWidth*3/16, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.clubbutton.frame = clubrect;
                self.clubbutton.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+50+self.iconimagescale*self.screenWidth*3/16 )
                let diarect:CGRect = CGRect(x: self.screenWidth*3/8, y: self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+50+self.iconimagescale*self.screenWidth*3/16, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.diabutton.frame = diarect;
                self.diabutton.layer.position = CGPoint(x:self.screenWidth*3/8 ,y: self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+50+self.iconimagescale*self.screenWidth*3/16)
                let heartrect:CGRect = CGRect(x: self.screenWidth*5/8, y: self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+50+self.iconimagescale*self.screenWidth*3/16, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.heartbutton.frame = heartrect;
                self.heartbutton.layer.position = CGPoint(x:self.screenWidth*5/8 ,y:self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+50+self.iconimagescale*self.screenWidth*3/16 )
                let spaderect:CGRect = CGRect(x: self.screenWidth*7/8, y: self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+50+self.iconimagescale*self.screenWidth*3/16, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.spadebutton.frame = spaderect;
                self.spadebutton.layer.position = CGPoint(x:self.screenWidth*7/8 ,y: self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+50+self.iconimagescale*self.screenWidth*3/16)
                //height1
                self.height1 = self.screenWidth*self.headerimagescale+self.headingTextView.frame.height+50+self.iconimagescale*self.screenWidth/2
                //radar
                self.radarlabel.frame = CGRect(x: self.screenWidth/8,y: self.height1-40,width: 0,height: 0)
                self.radarlabel.layer.position = CGPoint(x:self.screenWidth/8,y: self.height1-40)
                self.radarlabel.sizeToFit()
                self.radarChartView.frame = CGRect(x: self.screenWidth/2, y: self.height1+self.radarlabel.frame.height+100, width: 300, height: 300)
                self.radarChartView.layer.position = CGPoint(x: self.screenWidth/2, y: self.height1+self.radarlabel.frame.height+100)
                self.radareditbutton.frame = CGRect(x: self.screenWidth/2, y: self.height1+self.radarlabel.frame.height+100, width: 300, height: 300)
                self.radareditbutton.layer.position = CGPoint(x: self.screenWidth/2, y: self.height1+self.radarlabel.frame.height+100)
                //pie
                self.pielabel.frame = CGRect(x: self.screenWidth/8,y: self.height1+self.radarlabel.frame.height+250,width: 0,height: 0)
                self.pielabel.layer.position = CGPoint(x:self.screenWidth/8,y: self.height1+self.radarlabel.frame.height+250)
                self.pielabel.sizeToFit()
                self.pieChartView.frame = CGRect(x: self.screenWidth/2,y:self.height1+self.radarlabel.frame.height+self.pielabel.frame.height+370,width: 200,height: 200)
                self.pieChartView.layer.position =  CGPoint(x:self.screenWidth/2,y:self.height1+self.radarlabel.frame.height+self.pielabel.frame.height+370)
                self.pieeditbutton.frame = CGRect(x: self.screenWidth/2,y:self.height1+self.radarlabel.frame.height+self.pielabel.frame.height+370,width: 200,height: 200)
                self.pieeditbutton.layer.position = CGPoint(x:self.screenWidth/2,y:self.height1+self.radarlabel.frame.height+self.pielabel.frame.height+370)
                //height2
                self.height2 = self.height1+self.radarlabel.frame.height+self.pielabel.frame.height+370
                //club
                let club1rect:CGRect = CGRect(x: self.screenWidth/8, y: self.height2+200, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.club1button.frame = club1rect;
                self.club1button.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.height2+200)
                self.clublabel.frame = CGRect(x: self.screenWidth*2/8,y: self.height2+200-self.screenWidth*1.54/32,width: self.screenWidth*3/4-20,height: 0)
                //self.clublabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height2+200-self.screenWidth*1.54/32)
                self.clublabel.sizeToFit()
                self.height2 += self.clublabel.frame.height - 50
                let clubimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height2+250, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.clubimagescale)
                self.clubimageView.frame = clubimagerect;
                self.clubimagebutton.frame = clubimagerect;
                self.myTextView2.frame =  CGRect(x: self.screenWidth/2, y:self.height2+250+self.clubimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView2.layer.position = CGPoint(x: self.screenWidth/2, y:self.height2+250+self.clubimageheight)
                self.myTextView2.sizeToFit()
                //height3
                self.height3 = self.height2+250+self.clubimageheight+self.myTextView2.frame.height
                //dia
                let dia1rect:CGRect = CGRect(x: self.screenWidth/8, y: self.height3+50, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.dia1button.frame = dia1rect;
                self.dia1button.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.height3+50)
                self.dialabel.frame = CGRect(x: self.screenWidth*2/8,y: self.height3+50-self.screenWidth*1.54/32,width: self.screenWidth*3/4-20,height: 0)
                //self.dialabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height3+50-self.screenWidth*1.54/32)
                self.dialabel.sizeToFit()
                self.height3 += self.dialabel.frame.height - 50
                let diaimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height3+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.diaimagescale)
                self.diaimageView.frame = diaimagerect;
                self.diaimagebutton.frame = diaimagerect;
                self.myTextView3.frame = CGRect(x: self.screenWidth/2, y:self.height3+100+self.diaimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView3.layer.position = CGPoint(x: self.screenWidth/2, y:self.height3+100+self.diaimageheight)
                self.myTextView3.sizeToFit()
                //height4
                self.height4 = self.height3+100+self.diaimageheight+self.myTextView3.frame.height
                //heart
                let heart1rect:CGRect = CGRect(x: self.screenWidth/8, y: self.height4+50, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.heart1button.frame = heart1rect;
                self.heart1button.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.height4+50)
                self.heartlabel.frame = CGRect(x: self.screenWidth*2/8,y: self.height4+50-self.screenWidth*1.54/32,width: self.screenWidth*3/4-20,height: 0)
                //self.heartlabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height4+50-self.screenWidth*1.54/32)
                self.heartlabel.sizeToFit()
                self.height4 += self.heartlabel.frame.height - 50
                let heartimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height4+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.heartimagescale)
                self.heartimageView.frame = heartimagerect;
                self.heartimagebutton.frame = heartimagerect;
                self.myTextView4.frame = CGRect(x: self.screenWidth/2, y:self.height4+100+self.heartimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView4.layer.position = CGPoint(x: self.screenWidth/2, y:self.height4+100+self.heartimageheight)
                self.myTextView4.sizeToFit()
                //height5
                self.height5 = self.height4+100+self.heartimageheight+self.myTextView4.frame.height
                //spade
                let spade1rect:CGRect = CGRect(x: self.screenWidth/8, y: self.height5+50, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.spade1button.frame = spade1rect;
                self.spade1button.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.height5+50)
                self.spadelabel.frame = CGRect(x: self.screenWidth*2/8,y: self.height5+50-self.screenWidth*1.54/32,width: self.screenWidth*3/4-20,height: 0)
                //self.spadelabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height5+50-self.screenWidth*1.54/32)
                self.spadelabel.sizeToFit()
                self.height5 += self.spadelabel.frame.height - 50
                let spadeimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height5+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.spadeimagescale)
                self.spadeimageView.frame = spadeimagerect;
                self.spadeimagebutton.frame = spadeimagerect;
                self.myTextView5.frame = CGRect(x: self.screenWidth/2, y:self.height5+100+self.spadeimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView5.layer.position = CGPoint(x: self.screenWidth/2, y:self.height5+100+self.spadeimageheight)
                self.myTextView5.sizeToFit()
                //height6
                self.height6 = self.height5+100+self.spadeimageheight+self.myTextView5.frame.height
                //logo
                let logorect:CGRect = CGRect(x:self.screenWidth/2-self.screenWidth/16,y:self.height6+50,width: self.screenWidth/8,height: self.logoimagescale*self.screenWidth/8 )
                self.logoimageView.frame = logorect;
                self.logoimagebutton.frame = logorect;
                self.logolabel.frame = CGRect(x: self.screenWidth/2,y: self.height6+50+self.logoimagescale*self.screenWidth/8 ,width: 0,height: 0)
                self.logolabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height6+50+self.logoimagescale*self.screenWidth/8)
                self.logolabel.sizeToFit()
                self.height6 += self.logolabel.frame.height - 50
                self.myTextView6.frame = CGRect(x: self.screenWidth/2+100, y:self.height6+100+self.logoimagescale*self.screenWidth/8, width: self.screenWidth+200, height:0)
                self.myTextView6.layer.position = CGPoint(x: self.screenWidth/2+100, y:self.height6+100+self.logoimagescale*self.screenWidth/8)
                self.myTextView6.sizeToFit()
                //height7
                self.height7 = self.height6+100+self.logoimagescale*self.screenWidth/8+self.myTextView6.frame.height
                //scrollview
                self.scrollView.contentSize = CGSize(width:self.screenWidth, height:self.height7-220)
                
            } else if (self.iconimagetag == 1){
                self.iconimagetag = 0
                self.iconimageView.isHidden = true
            } else if (self.clubimagetag == 1){
                self.clubimagetag = 0
                
                self.clubimagescale = 0.1
                self.clubimageheight = (self.screenWidth*6/8)*self.clubimagescale
                self.clubimageView.isHidden = true
                let clubimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height2+250, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.clubimagescale)
                self.clubimageView.frame = clubimagerect;
                self.clubimagebutton.frame = clubimagerect;
                self.myTextView2.frame =  CGRect(x: self.screenWidth/2, y:self.height2+250+self.clubimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView2.layer.position = CGPoint(x: self.screenWidth/2, y:self.height2+250+self.clubimageheight)
                self.myTextView2.sizeToFit()
                //height3
                self.height3 = self.height2+250+self.clubimageheight+self.myTextView2.frame.height
                //dia
                let dia1rect:CGRect = CGRect(x: self.screenWidth/8, y: self.height3+50, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.dia1button.frame = dia1rect;
                self.dia1button.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.height3+50)
                self.dialabel.frame = CGRect(x: self.screenWidth*2/8,y: self.height3+50-self.screenWidth*1.54/32,width: self.screenWidth*3/4-20,height: 0)
                //self.dialabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height3+50-self.screenWidth*1.54/32)
                self.dialabel.sizeToFit()
                self.height3 += self.dialabel.frame.height - 50
                let diaimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height3+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.diaimagescale)
                self.diaimageView.frame = diaimagerect;
                self.diaimagebutton.frame = diaimagerect;
                self.myTextView3.frame = CGRect(x: self.screenWidth/2, y:self.height3+100+self.diaimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView3.layer.position = CGPoint(x: self.screenWidth/2, y:self.height3+100+self.diaimageheight)
                self.myTextView3.sizeToFit()
                //height4
                self.height4 = self.height3+100+self.diaimageheight+self.myTextView3.frame.height
                //heart
                let heart1rect:CGRect = CGRect(x: self.screenWidth/8, y: self.height4+50, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.heart1button.frame = heart1rect;
                self.heart1button.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.height4+50)
                self.heartlabel.frame = CGRect(x: self.screenWidth*2/8,y: self.height4+50-self.screenWidth*1.54/32,width: self.screenWidth*3/4-20,height: 0)
                //self.heartlabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height4+50-self.screenWidth*1.54/32)
                self.heartlabel.sizeToFit()
                self.height4 += self.heartlabel.frame.height - 50
                let heartimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height4+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.heartimagescale)
                self.heartimageView.frame = heartimagerect;
                self.heartimagebutton.frame = heartimagerect;
                self.myTextView4.frame = CGRect(x: self.screenWidth/2, y:self.height4+100+self.heartimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView4.layer.position = CGPoint(x: self.screenWidth/2, y:self.height4+100+self.heartimageheight)
                self.myTextView4.sizeToFit()
                //height5
                self.height5 = self.height4+100+self.heartimageheight+self.myTextView4.frame.height
                //spade
                let spade1rect:CGRect = CGRect(x: self.screenWidth/8, y: self.height5+50, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.spade1button.frame = spade1rect;
                self.spade1button.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.height5+50)
                self.spadelabel.frame = CGRect(x: self.screenWidth*2/8,y: self.height5+50-self.screenWidth*1.54/32,width: self.screenWidth*3/4-20,height: 0)
                //self.spadelabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height5+50-self.screenWidth*1.54/32)
                self.spadelabel.sizeToFit()
                self.height5 += self.spadelabel.frame.height - 50
                let spadeimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height5+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.spadeimagescale)
                self.spadeimageView.frame = spadeimagerect;
                self.spadeimagebutton.frame = spadeimagerect;
                self.myTextView5.frame = CGRect(x: self.screenWidth/2, y:self.height5+100+self.spadeimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView5.layer.position = CGPoint(x: self.screenWidth/2, y:self.height5+100+self.spadeimageheight)
                self.myTextView5.sizeToFit()
                //height6
                self.height6 = self.height5+100+self.spadeimageheight+self.myTextView5.frame.height
                //logo
                let logorect:CGRect = CGRect(x:self.screenWidth/2-self.screenWidth/16,y:self.height6+50,width: self.screenWidth/8,height: self.logoimagescale*self.screenWidth/8 )
                self.logoimageView.frame = logorect;
                self.logoimagebutton.frame = logorect;
                self.logolabel.frame = CGRect(x: self.screenWidth/2,y: self.height6+50+self.logoimagescale*self.screenWidth/8 ,width: 0,height: 0)
                self.logolabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height6+50+self.logoimagescale*self.screenWidth/8)
                self.logolabel.sizeToFit()
                self.height6 += self.logolabel.frame.height - 50
                self.myTextView6.frame = CGRect(x: self.screenWidth/2+100, y:self.height6+100+self.logoimagescale*self.screenWidth/8, width: self.screenWidth+200, height:0)
                self.myTextView6.layer.position = CGPoint(x: self.screenWidth/2+100, y:self.height6+100+self.logoimagescale*self.screenWidth/8)
                self.myTextView6.sizeToFit()
                //height7
                self.height7 = self.height6+100+self.logoimagescale*self.screenWidth/8+self.myTextView6.frame.height
                //scrollview
                self.scrollView.contentSize = CGSize(width:self.screenWidth, height:self.height7-220)
                
            } else if (self.diaimagetag == 1){
                self.diaimagetag = 0
                
                self.diaimagescale = 0.1
                self.diaimageheight = (self.screenWidth*6/8)*self.diaimagescale
                self.diaimageView.isHidden = true
                let diaimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height3+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.diaimagescale)
                self.diaimageView.frame = diaimagerect;
                self.diaimagebutton.frame = diaimagerect;
                self.myTextView3.frame = CGRect(x: self.screenWidth/2, y:self.height3+100+self.diaimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView3.layer.position = CGPoint(x: self.screenWidth/2, y:self.height3+100+self.diaimageheight)
                self.myTextView3.sizeToFit()
                //height4
                self.height4 = self.height3+100+self.diaimageheight+self.myTextView3.frame.height
                //heart
                let heart1rect:CGRect = CGRect(x: self.screenWidth/8, y: self.height4+50, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.heart1button.frame = heart1rect;
                self.heart1button.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.height4+50)
                self.heartlabel.frame = CGRect(x: self.screenWidth*2/8,y: self.height4+50-self.screenWidth*1.54/32,width: self.screenWidth*3/4-20,height: 0)
                //self.heartlabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height4+50-self.screenWidth*1.54/32)
                self.heartlabel.sizeToFit()
                self.height4 += self.heartlabel.frame.height - 50
                let heartimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height4+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.heartimagescale)
                self.heartimageView.frame = heartimagerect;
                self.heartimagebutton.frame = heartimagerect;
                self.myTextView4.frame = CGRect(x: self.screenWidth/2, y:self.height4+100+self.heartimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView4.layer.position = CGPoint(x: self.screenWidth/2, y:self.height4+100+self.heartimageheight)
                self.myTextView4.sizeToFit()
                //height5
                self.height5 = self.height4+100+self.heartimageheight+self.myTextView4.frame.height
                //spade
                let spade1rect:CGRect = CGRect(x: self.screenWidth/8, y: self.height5+50, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.spade1button.frame = spade1rect;
                self.spade1button.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.height5+50)
                self.spadelabel.frame = CGRect(x: self.screenWidth*2/8,y: self.height5+50-self.screenWidth*1.54/32,width: self.screenWidth*3/4-20,height: 0)
                //self.spadelabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height5+50-self.screenWidth*1.54/32)
                self.spadelabel.sizeToFit()
                self.height5 += self.spadelabel.frame.height - 50
                let spadeimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height5+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.spadeimagescale)
                self.spadeimageView.frame = spadeimagerect;
                self.spadeimagebutton.frame = spadeimagerect;
                self.myTextView5.frame = CGRect(x: self.screenWidth/2, y:self.height5+100+self.spadeimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView5.layer.position = CGPoint(x: self.screenWidth/2, y:self.height5+100+self.spadeimageheight)
                self.myTextView5.sizeToFit()
                //height6
                self.height6 = self.height5+100+self.spadeimageheight+self.myTextView5.frame.height
                //logo
                let logorect:CGRect = CGRect(x:self.screenWidth/2-self.screenWidth/16,y:self.height6+50,width: self.screenWidth/8,height: self.logoimagescale*self.screenWidth/8 )
                self.logoimageView.frame = logorect;
                self.logoimagebutton.frame = logorect;
                self.logolabel.frame = CGRect(x: self.screenWidth/2,y: self.height6+50+self.logoimagescale*self.screenWidth/8 ,width: 0,height: 0)
                self.logolabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height6+50+self.logoimagescale*self.screenWidth/8)
                self.logolabel.sizeToFit()
                self.height6 += self.logolabel.frame.height - 50
                self.myTextView6.frame = CGRect(x: self.screenWidth/2+100, y:self.height6+100+self.logoimagescale*self.screenWidth/8, width: self.screenWidth+200, height:0)
                self.myTextView6.layer.position = CGPoint(x: self.screenWidth/2+100, y:self.height6+100+self.logoimagescale*self.screenWidth/8)
                self.myTextView6.sizeToFit()
                //height7
                self.height7 = self.height6+100+self.logoimagescale*self.screenWidth/8+self.myTextView6.frame.height
                //scrollview
                self.scrollView.contentSize = CGSize(width:self.screenWidth, height:self.height7-220)
                
            } else if (self.heartimagetag == 1){
                self.heartimagetag = 0
                
                self.heartimagescale = 0.1
                self.heartimageheight = (self.screenWidth*6/8)*self.heartimagescale
                self.heartimageView.isHidden = true
                let heartimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height4+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.heartimagescale)
                self.heartimageView.frame = heartimagerect;
                self.heartimagebutton.frame = heartimagerect;
                self.myTextView4.frame = CGRect(x: self.screenWidth/2, y:self.height4+100+self.heartimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView4.layer.position = CGPoint(x: self.screenWidth/2, y:self.height4+100+self.heartimageheight)
                self.myTextView4.sizeToFit()
                //height5
                self.height5 = self.height4+100+self.heartimageheight+self.myTextView4.frame.height
                //spade
                let spade1rect:CGRect = CGRect(x: self.screenWidth/8, y: self.height5+50, width: self.screenWidth/8, height: self.screenWidth*1.54/8)
                self.spade1button.frame = spade1rect;
                self.spade1button.layer.position = CGPoint(x:self.screenWidth/8 ,y:self.height5+50)
                self.spadelabel.frame = CGRect(x: self.screenWidth*2/8,y: self.height5+50-self.screenWidth*1.54/32,width: self.screenWidth*3/4-20,height: 0)
                //self.spadelabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height5+50-self.screenWidth*1.54/32)
                self.spadelabel.sizeToFit()
                self.height5 += self.spadelabel.frame.height - 50
                let spadeimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height5+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.spadeimagescale)
                self.spadeimageView.frame = spadeimagerect;
                self.spadeimagebutton.frame = spadeimagerect;
                self.myTextView5.frame = CGRect(x: self.screenWidth/2, y:self.height5+100+self.spadeimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView5.layer.position = CGPoint(x: self.screenWidth/2, y:self.height5+100+self.spadeimageheight)
                self.myTextView5.sizeToFit()
                //height6
                self.height6 = self.height5+100+self.spadeimageheight+self.myTextView5.frame.height
                //logo
                let logorect:CGRect = CGRect(x:self.screenWidth/2-self.screenWidth/16,y:self.height6+50,width: self.screenWidth/8,height: self.logoimagescale*self.screenWidth/8 )
                self.logoimageView.frame = logorect;
                self.logoimagebutton.frame = logorect;
                self.logolabel.frame = CGRect(x: self.screenWidth/2,y: self.height6+50+self.logoimagescale*self.screenWidth/8 ,width: 0,height: 0)
                self.logolabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height6+50+self.logoimagescale*self.screenWidth/8)
                self.logolabel.sizeToFit()
                self.height6 += self.logolabel.frame.height - 50
                self.myTextView6.frame = CGRect(x: self.screenWidth/2+100, y:self.height6+100+self.logoimagescale*self.screenWidth/8, width: self.screenWidth+200, height:0)
                self.myTextView6.layer.position = CGPoint(x: self.screenWidth/2+100, y:self.height6+100+self.logoimagescale*self.screenWidth/8)
                self.myTextView6.sizeToFit()
                //height7
                self.height7 = self.height6+100+self.logoimagescale*self.screenWidth/8+self.myTextView6.frame.height
                //scrollview
                self.scrollView.contentSize = CGSize(width:self.screenWidth, height:self.height7-220)
                
            } else if (self.spadeimagetag == 1){
                self.spadeimagetag = 0
                
                self.spadeimagescale = 0.1
                self.spadeimageheight = (self.screenWidth*6/8)*self.spadeimagescale
                self.spadeimageView.isHidden = true
                let spadeimagerect:CGRect =
                    CGRect(x:self.screenWidth/8, y:self.height5+100, width:self.screenWidth*6/8, height:(self.screenWidth*6/8)*self.spadeimagescale)
                self.spadeimageView.frame = spadeimagerect;
                self.spadeimagebutton.frame = spadeimagerect;
                self.myTextView5.frame = CGRect(x: self.screenWidth/2, y:self.height5+100+self.spadeimageheight, width: self.screenWidth*6/8, height:0)
                self.myTextView5.layer.position = CGPoint(x: self.screenWidth/2, y:self.height5+100+self.spadeimageheight)
                self.myTextView5.sizeToFit()
                //height6
                self.height6 = self.height5+100+self.spadeimageheight+self.myTextView5.frame.height
                //logo
                let logorect:CGRect = CGRect(x:self.screenWidth/2-self.screenWidth/16,y:self.height6+50,width: self.screenWidth/8,height: self.logoimagescale*self.screenWidth/8 )
                self.logoimageView.frame = logorect;
                self.logoimagebutton.frame = logorect;
                self.logolabel.frame = CGRect(x: self.screenWidth/2,y: self.height6+50+self.logoimagescale*self.screenWidth/8 ,width: 0,height: 0)
                self.logolabel.layer.position = CGPoint(x:self.screenWidth*2/8,y: self.height6+50+self.logoimagescale*self.screenWidth/8)
                self.logolabel.sizeToFit()
                self.height6 += self.logolabel.frame.height - 50
                self.myTextView6.frame = CGRect(x: self.screenWidth/2+100, y:self.height6+100+self.logoimagescale*self.screenWidth/8, width: self.screenWidth+200, height:0)
                self.myTextView6.layer.position = CGPoint(x: self.screenWidth/2+100, y:self.height6+100+self.logoimagescale*self.screenWidth/8)
                self.myTextView6.sizeToFit()
                //height7
                self.height7 = self.height6+100+self.logoimagescale*self.screenWidth/8+self.myTextView6.frame.height
                //scrollview
                self.scrollView.contentSize = CGSize(width:self.screenWidth, height:self.height7-220)
                
            } else if (self.logoimagetag == 1){
                self.logoimagetag = 0
                self.logoimageView.isHidden = true
            }
            alertController.dismiss(animated: true, completion: nil)
        }
        
        let cameraAction = UIAlertAction(title: "カメラで撮影", style: .default) { (action) in
            // カメラ起動
            if UIImagePickerController.isSourceTypeAvailable(.camera) == true {
                let picker = UIImagePickerController()
                picker.sourceType = .camera
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            } else {
                print("この機種ではカメラが使用出来ません。")
            }
        }
        
        let photoLibraryAction = UIAlertAction(title: "フォトライブラリから選択", style: .default) { (action) in
            // アルバム起動
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) == true {
                let picker = UIImagePickerController()
                picker.sourceType = .photoLibrary
                picker.delegate = self
                self.present(picker, animated: true, completion: nil)
            } else {
                print("この機種ではフォトライブラリが使用出来ません。")
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(cameraAction)
        alertController.addAction(photoLibraryAction)
        alertController.addAction(removeAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //画像が選択された時に呼ばれる.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image1 = info[.originalImage] as? UIImage{
            if (headerimagetag == 1){
                headerimagetag = 0
                headerimage = image1
                headerimageView.image = image1
                headerimageView.isHidden = false
                headerimgWidth = headerimage.size.width
                headerimgHeight = headerimage.size.height
                headerimagescale = headerimgHeight / headerimgWidth
                let headerimagerect:CGRect =
                    CGRect(x:0, y:0, width:screenWidth, height:screenWidth*headerimagescale)
                headerimageView.frame = headerimagerect;
                headerimagebutton.frame = headerimagerect;
                headingTextView.frame = CGRect(x: 0, y: screenWidth*headerimagescale+10, width: screenWidth, height: 0)
                headingTextView.layer.position = CGPoint(x: screenWidth/2, y:screenWidth*headerimagescale+10+headingTextView.frame.height/2)
                headingTextView.sizeToFit()
                //icon
                let iconrect:CGRect = CGRect(x:0,y:screenWidth*headerimagescale+headingTextView.frame.height+10,width: screenWidth/8,height: iconimagescale*screenWidth/8 )
                iconimageView.frame = iconrect;
                iconimagebutton.frame = iconrect;
                iconTextView.frame = CGRect(x:10+screenWidth/8, y:screenWidth*headerimagescale+headingTextView.frame.height+5, width: screenWidth-(10+screenWidth/8), height: iconimagescale*screenWidth/7)
                iconTextView.layer.position = CGPoint(x:10+screenWidth/8+screenWidth/2/*変更*/, y:screenWidth*headerimagescale+headingTextView.frame.height+5+iconimagescale*screenWidth/14)
                //button
                label.frame = CGRect(x:7, y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16-screenWidth*1.54/16-10, width:screenWidth-14, height:screenWidth*1.54/8+20)
                let clubrect:CGRect = CGRect(x: screenWidth/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
                clubbutton.frame = clubrect;
                clubbutton.layer.position = CGPoint(x:screenWidth/8 ,y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16 )
                let diarect:CGRect = CGRect(x: screenWidth*3/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
                diabutton.frame = diarect;
                diabutton.layer.position = CGPoint(x:screenWidth*3/8 ,y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16)
                let heartrect:CGRect = CGRect(x: screenWidth*5/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
                heartbutton.frame = heartrect;
                heartbutton.layer.position = CGPoint(x:screenWidth*5/8 ,y:screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16 )
                let spaderect:CGRect = CGRect(x: screenWidth*7/8, y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16, width: screenWidth/8, height: screenWidth*1.54/8)
                spadebutton.frame = spaderect;
                spadebutton.layer.position = CGPoint(x:screenWidth*7/8 ,y: screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth*3/16)
                //height1
                height1 = screenWidth*headerimagescale+headingTextView.frame.height+50+iconimagescale*screenWidth/2
                //radar
                radarlabel.frame = CGRect(x: screenWidth/8,y: height1-40,width: 0,height: 0)
                radarlabel.layer.position = CGPoint(x:screenWidth/8,y: height1-40)
                radarlabel.sizeToFit()
                radarChartView.frame = CGRect(x: screenWidth/2, y: height1+radarlabel.frame.height+100, width: 300, height: 300)
                radarChartView.layer.position = CGPoint(x: screenWidth/2, y: height1+radarlabel.frame.height+100)
                radareditbutton.frame = CGRect(x: screenWidth/2, y: height1+radarlabel.frame.height+100, width: 300, height: 300)
                radareditbutton.layer.position = CGPoint(x: screenWidth/2, y: height1+radarlabel.frame.height+100)
                //pie
                pielabel.frame = CGRect(x: screenWidth/8,y: height1+radarlabel.frame.height+250,width: 0,height: 0)
                pielabel.layer.position = CGPoint(x:screenWidth/8,y: height1+radarlabel.frame.height+250)
                pielabel.sizeToFit()
                pieChartView.frame = CGRect(x: screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370,width: 200,height: 200)
                pieChartView.layer.position =  CGPoint(x:screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370)
                pieeditbutton.frame = CGRect(x: screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370,width: 200,height: 200)
                pieeditbutton.layer.position = CGPoint(x:screenWidth/2,y:height1+radarlabel.frame.height+pielabel.frame.height+370)
                //height2
                height2 = height1+radarlabel.frame.height+pielabel.frame.height+370
                //club
                let club1rect:CGRect = CGRect(x: screenWidth/8, y: height2+200, width: screenWidth/8, height: screenWidth*1.54/8)
                club1button.frame = club1rect;
                club1button.layer.position = CGPoint(x:screenWidth/8 ,y:height2+200)
                clublabel.frame = CGRect(x: screenWidth*2/8,y: height2+200-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //clublabel.layer.position = CGPoint(x:screenWidth*2/8,y: height2+200-screenWidth*1.54/32)
                clublabel.sizeToFit()
                height2 += clublabel.frame.height - 50
                let clubimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height2+250, width:screenWidth*6/8, height:(screenWidth*6/8)*clubimagescale)
                clubimageView.frame = clubimagerect;
                clubimagebutton.frame = clubimagerect;
                myTextView2.frame =  CGRect(x: screenWidth/2, y:height2+250+clubimageheight, width: screenWidth*6/8, height:0)
                myTextView2.layer.position = CGPoint(x: screenWidth/2, y:height2+250+clubimageheight)
                myTextView2.sizeToFit()
                //height3
                height3 = height2+250+clubimageheight+myTextView2.frame.height
                //dia
                let dia1rect:CGRect = CGRect(x: screenWidth/8, y: height3+50, width: screenWidth/8, height: screenWidth*1.54/8)
                dia1button.frame = dia1rect;
                dia1button.layer.position = CGPoint(x:screenWidth/8 ,y:height3+50)
                dialabel.frame = CGRect(x: screenWidth*2/8,y: height3+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //dialabel.layer.position = CGPoint(x:screenWidth*2/8,y: height3+50-screenWidth*1.54/32)
                dialabel.sizeToFit()
                height3 += dialabel.frame.height - 50
                let diaimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height3+100, width:screenWidth*6/8, height:(screenWidth*6/8)*diaimagescale)
                diaimageView.frame = diaimagerect;
                diaimagebutton.frame = diaimagerect;
                myTextView3.frame = CGRect(x: screenWidth/2, y:height3+100+diaimageheight, width: screenWidth*6/8, height:0)
                myTextView3.layer.position = CGPoint(x: screenWidth/2, y:height3+100+diaimageheight)
                myTextView3.sizeToFit()
                //height4
                height4 = height3+100+diaimageheight+myTextView3.frame.height
                //heart
                let heart1rect:CGRect = CGRect(x: screenWidth/8, y: height4+50, width: screenWidth/8, height: screenWidth*1.54/8)
                heart1button.frame = heart1rect;
                heart1button.layer.position = CGPoint(x:screenWidth/8 ,y:height4+50)
                heartlabel.frame = CGRect(x: screenWidth*2/8,y: height4+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //heartlabel.layer.position = CGPoint(x:screenWidth*2/8,y: height4+50-screenWidth*1.54/32)
                heartlabel.sizeToFit()
                height4 += heartlabel.frame.height - 50
                let heartimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height4+100, width:screenWidth*6/8, height:(screenWidth*6/8)*heartimagescale)
                heartimageView.frame = heartimagerect;
                heartimagebutton.frame = heartimagerect;
                myTextView4.frame = CGRect(x: screenWidth/2, y:height4+100+heartimageheight, width: screenWidth*6/8, height:0)
                myTextView4.layer.position = CGPoint(x: screenWidth/2, y:height4+100+heartimageheight)
                myTextView4.sizeToFit()
                //height5
                height5 = height4+100+heartimageheight+myTextView4.frame.height
                //spade
                let spade1rect:CGRect = CGRect(x: screenWidth/8, y: height5+50, width: screenWidth/8, height: screenWidth*1.54/8)
                spade1button.frame = spade1rect;
                spade1button.layer.position = CGPoint(x:screenWidth/8 ,y:height5+50)
                spadelabel.frame = CGRect(x: screenWidth*2/8,y: height5+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //spadelabel.layer.position = CGPoint(x:screenWidth*2/8,y: height5+50-screenWidth*1.54/32)
                spadelabel.sizeToFit()
                height5 += spadelabel.frame.height - 50
                let spadeimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height5+100, width:screenWidth*6/8, height:(screenWidth*6/8)*spadeimagescale)
                spadeimageView.frame = spadeimagerect;
                spadeimagebutton.frame = spadeimagerect;
                myTextView5.frame = CGRect(x: screenWidth/2, y:height5+100+spadeimageheight, width: screenWidth*6/8, height:0)
                myTextView5.layer.position = CGPoint(x: screenWidth/2, y:height5+100+spadeimageheight)
                myTextView5.sizeToFit()
                //height6
                height6 = height5+100+spadeimageheight+myTextView5.frame.height
                //logo
                let logorect:CGRect = CGRect(x:screenWidth/2-screenWidth/16,y:height6+50,width: screenWidth/8,height: logoimagescale*screenWidth/8 )
                logoimageView.frame = logorect;
                logoimagebutton.frame = logorect;
                logolabel.frame = CGRect(x: screenWidth/2,y: height6+50+logoimagescale*screenWidth/8 ,width: 0,height: 0)
                logolabel.layer.position = CGPoint(x:screenWidth*2/8,y: height6+50+logoimagescale*screenWidth/8)
                logolabel.sizeToFit()
                height6 += logolabel.frame.height - 50
                myTextView6.frame = CGRect(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8, width: screenWidth+200, height:0)
                myTextView6.layer.position = CGPoint(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8)
                myTextView6.sizeToFit()
                //height7
                height7 = height6+100+logoimagescale*screenWidth/8+myTextView6.frame.height
                //scrollview
                scrollView.contentSize = CGSize(width:screenWidth, height:height7-220)
                
            } else if (iconimagetag == 1){
                iconimagetag = 0
                iconimageView.isHidden = false
                iconimageView.image = image1
            } else if (clubimagetag == 1){
                clubimagetag = 0
                
                height2 = height1+radarlabel.frame.height+pielabel.frame.height+370
                //club
                let club1rect:CGRect = CGRect(x: screenWidth/8, y: height2+200, width: screenWidth/8, height: screenWidth*1.54/8)
                club1button.frame = club1rect;
                club1button.layer.position = CGPoint(x:screenWidth/8 ,y:height2+200)
                clublabel.frame = CGRect(x: screenWidth*2/8,y: height2+200-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //clublabel.layer.position = CGPoint(x:screenWidth*2/8,y: height2+200-screenWidth*1.54/32)
                clublabel.sizeToFit()
                height2 += clublabel.frame.height - 50
                clubimage = image1
                clubimageView.image = image1
                clubimageView.isHidden = false
                clubimgWidth = clubimage.size.width
                clubimgHeight = clubimage.size.height
                clubimagescale = clubimgHeight / clubimgWidth
                clubimageheight = (screenWidth*6/8)*clubimagescale
                let clubimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height2+250, width:screenWidth*6/8, height:(screenWidth*6/8)*clubimagescale)
                clubimageView.frame = clubimagerect;
                clubimagebutton.frame = clubimagerect;
                myTextView2.frame =  CGRect(x: screenWidth/2, y:height2+250+clubimageheight, width: screenWidth*6/8, height:0)
                myTextView2.layer.position = CGPoint(x: screenWidth/2, y:height2+250+clubimageheight)
                myTextView2.sizeToFit()
                //height3
                height3 = height2+250+clubimageheight+myTextView2.frame.height
                //dia
                let dia1rect:CGRect = CGRect(x: screenWidth/8, y: height3+50, width: screenWidth/8, height: screenWidth*1.54/8)
                dia1button.frame = dia1rect;
                dia1button.layer.position = CGPoint(x:screenWidth/8 ,y:height3+50)
                dialabel.frame = CGRect(x: screenWidth*2/8,y: height3+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //dialabel.layer.position = CGPoint(x:screenWidth*2/8,y: height3+50-screenWidth*1.54/32)
                dialabel.sizeToFit()
                height3 += dialabel.frame.height - 50
                let diaimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height3+100, width:screenWidth*6/8, height:(screenWidth*6/8)*diaimagescale)
                diaimageView.frame = diaimagerect;
                diaimagebutton.frame = diaimagerect;
                myTextView3.frame = CGRect(x: screenWidth/2, y:height3+100+diaimageheight, width: screenWidth*6/8, height:0)
                myTextView3.layer.position = CGPoint(x: screenWidth/2, y:height3+100+diaimageheight)
                myTextView3.sizeToFit()
                //height4
                height4 = height3+100+diaimageheight+myTextView3.frame.height
                //heart
                let heart1rect:CGRect = CGRect(x: screenWidth/8, y: height4+50, width: screenWidth/8, height: screenWidth*1.54/8)
                heart1button.frame = heart1rect;
                heart1button.layer.position = CGPoint(x:screenWidth/8 ,y:height4+50)
                heartlabel.frame = CGRect(x: screenWidth*2/8,y: height4+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //heartlabel.layer.position = CGPoint(x:screenWidth*2/8,y: height4+50-screenWidth*1.54/32)
                heartlabel.sizeToFit()
                height4 += heartlabel.frame.height - 50
                let heartimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height4+100, width:screenWidth*6/8, height:(screenWidth*6/8)*heartimagescale)
                heartimageView.frame = heartimagerect;
                heartimagebutton.frame = heartimagerect;
                myTextView4.frame = CGRect(x: screenWidth/2, y:height4+100+heartimageheight, width: screenWidth*6/8, height:0)
                myTextView4.layer.position = CGPoint(x: screenWidth/2, y:height4+100+heartimageheight)
                myTextView4.sizeToFit()
                //height5
                height5 = height4+100+heartimageheight+myTextView4.frame.height
                //spade
                let spade1rect:CGRect = CGRect(x: screenWidth/8, y: height5+50, width: screenWidth/8, height: screenWidth*1.54/8)
                spade1button.frame = spade1rect;
                spade1button.layer.position = CGPoint(x:screenWidth/8 ,y:height5+50)
                spadelabel.frame = CGRect(x: screenWidth*2/8,y: height5+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //spadelabel.layer.position = CGPoint(x:screenWidth*2/8,y: height5+50-screenWidth*1.54/32)
                spadelabel.sizeToFit()
                height5 += spadelabel.frame.height - 50
                let spadeimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height5+100, width:screenWidth*6/8, height:(screenWidth*6/8)*spadeimagescale)
                spadeimageView.frame = spadeimagerect;
                spadeimagebutton.frame = spadeimagerect;
                myTextView5.frame = CGRect(x: screenWidth/2, y:height5+100+spadeimageheight, width: screenWidth*6/8, height:0)
                myTextView5.layer.position = CGPoint(x: screenWidth/2, y:height5+100+spadeimageheight)
                myTextView5.sizeToFit()
                //height6
                height6 = height5+100+spadeimageheight+myTextView5.frame.height
                //logo
                let logorect:CGRect = CGRect(x:screenWidth/2-screenWidth/16,y:height6+50,width: screenWidth/8,height: logoimagescale*screenWidth/8 )
                logoimageView.frame = logorect;
                logoimagebutton.frame = logorect;
                logolabel.frame = CGRect(x: screenWidth/2,y: height6+50+logoimagescale*screenWidth/8 ,width: 0,height: 0)
                logolabel.layer.position = CGPoint(x:screenWidth*2/8,y: height6+50+logoimagescale*screenWidth/8)
                logolabel.sizeToFit()
                height6 += logolabel.frame.height - 50
                myTextView6.frame = CGRect(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8, width: screenWidth+200, height:0)
                myTextView6.layer.position = CGPoint(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8)
                myTextView6.sizeToFit()
                //height7
                height7 = height6+100+logoimagescale*screenWidth/8+myTextView6.frame.height
                //scrollview
                scrollView.contentSize = CGSize(width:screenWidth, height:height7-220)
                
            } else if (diaimagetag == 1){
                diaimagetag = 0
                diaimageView.image = image1
                
                height3 = height2+250+clubimageheight+myTextView2.frame.height
                //dia
                let dia1rect:CGRect = CGRect(x: screenWidth/8, y: height3+50, width: screenWidth/8, height: screenWidth*1.54/8)
                dia1button.frame = dia1rect;
                dia1button.layer.position = CGPoint(x:screenWidth/8 ,y:height3+50)
                dialabel.frame = CGRect(x: screenWidth*2/8,y: height3+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //dialabel.layer.position = CGPoint(x:screenWidth*2/8,y: height3+50-screenWidth*1.54/32)
                dialabel.sizeToFit()
                height3 += dialabel.frame.height - 50
                diaimage = image1
                diaimageView.image = image1
                diaimageView.isHidden = false
                diaimgWidth = diaimage.size.width
                diaimgHeight = diaimage.size.height
                diaimagescale = diaimgHeight / diaimgWidth
                diaimageheight = (screenWidth*6/8)*diaimagescale
                let diaimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height3+100, width:screenWidth*6/8, height:(screenWidth*6/8)*diaimagescale)
                diaimageView.frame = diaimagerect;
                diaimagebutton.frame = diaimagerect;
                myTextView3.frame = CGRect(x: screenWidth/2, y:height3+100+diaimageheight, width: screenWidth*6/8, height:0)
                myTextView3.layer.position = CGPoint(x: screenWidth/2, y:height3+100+diaimageheight)
                myTextView3.sizeToFit()
                //height4
                height4 = height3+100+diaimageheight+myTextView3.frame.height
                //heart
                let heart1rect:CGRect = CGRect(x: screenWidth*2/8, y: height4+50, width: screenWidth/8, height: screenWidth*1.54/8)
                heart1button.frame = heart1rect;
                //heart1button.layer.position = CGPoint(x:screenWidth/8 ,y:height4+50)
                heartlabel.frame = CGRect(x: screenWidth/8,y: height4+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                heartlabel.layer.position = CGPoint(x:screenWidth*2/8,y: height4+50-screenWidth*1.54/32)
                heartlabel.sizeToFit()
                height4 += heartlabel.frame.height - 50
                let heartimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height4+100, width:screenWidth*6/8, height:(screenWidth*6/8)*heartimagescale)
                heartimageView.frame = heartimagerect;
                heartimagebutton.frame = heartimagerect;
                myTextView4.frame = CGRect(x: screenWidth/2, y:height4+100+heartimageheight, width: screenWidth*6/8, height:0)
                myTextView4.layer.position = CGPoint(x: screenWidth/2, y:height4+100+heartimageheight)
                myTextView4.sizeToFit()
                //height5
                height5 = height4+100+heartimageheight+myTextView4.frame.height
                //spade
                let spade1rect:CGRect = CGRect(x: screenWidth*2/8, y: height5+50, width: screenWidth/8, height: screenWidth*1.54/8)
                spade1button.frame = spade1rect;
                //spade1button.layer.position = CGPoint(x:screenWidth/8 ,y:height5+50)
                spadelabel.frame = CGRect(x: screenWidth/8,y: height5+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                spadelabel.layer.position = CGPoint(x:screenWidth*2/8,y: height5+50-screenWidth*1.54/32)
                spadelabel.sizeToFit()
                height5 += spadelabel.frame.height - 50
                let spadeimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height5+100, width:screenWidth*6/8, height:(screenWidth*6/8)*spadeimagescale)
                spadeimageView.frame = spadeimagerect;
                spadeimagebutton.frame = spadeimagerect;
                myTextView5.frame = CGRect(x: screenWidth/2, y:height5+100+spadeimageheight, width: screenWidth*6/8, height:0)
                myTextView5.layer.position = CGPoint(x: screenWidth/2, y:height5+100+spadeimageheight)
                myTextView5.sizeToFit()
                //height6
                height6 = height5+100+spadeimageheight+myTextView5.frame.height
                //logo
                let logorect:CGRect = CGRect(x:screenWidth/2-screenWidth/16,y:height6+50,width: screenWidth/8,height: logoimagescale*screenWidth/8 )
                logoimageView.frame = logorect;
                logoimagebutton.frame = logorect;
                logolabel.frame = CGRect(x: screenWidth/2,y: height6+50+logoimagescale*screenWidth/8 ,width: 0,height: 0)
                logolabel.layer.position = CGPoint(x:screenWidth*2/8,y: height6+50+logoimagescale*screenWidth/8)
                logolabel.sizeToFit()
                height6 += logolabel.frame.height - 50
                myTextView6.frame = CGRect(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8, width: screenWidth+200, height:0)
                myTextView6.layer.position = CGPoint(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8)
                myTextView6.sizeToFit()
                //height7
                height7 = height6+100+logoimagescale*screenWidth/8+myTextView6.frame.height
                //scrollview
                scrollView.contentSize = CGSize(width:screenWidth, height:height7-220)
                
            } else if (heartimagetag == 1){
                heartimagetag = 0
                heartimageView.image = image1
                
                height4 = height3+100+diaimageheight+myTextView3.frame.height
                //heart
                let heart1rect:CGRect = CGRect(x: screenWidth/8, y: height4+50, width: screenWidth/8, height: screenWidth*1.54/8)
                heart1button.frame = heart1rect;
                heart1button.layer.position = CGPoint(x:screenWidth/8 ,y:height4+50)
                heartlabel.frame = CGRect(x: screenWidth*2/8,y: height4+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //heartlabel.layer.position = CGPoint(x:screenWidth*2/8,y: height4+50-screenWidth*1.54/32)
                heartlabel.sizeToFit()
                height4 += heartlabel.frame.height - 50
                heartimage = image1
                heartimageView.image = image1
                heartimageView.isHidden = false
                heartimgWidth = heartimage.size.width
                heartimgHeight = heartimage.size.height
                heartimagescale = heartimgHeight / heartimgWidth
                heartimageheight = (screenWidth*6/8)*heartimagescale
                let heartimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height4+100, width:screenWidth*6/8, height:(screenWidth*6/8)*heartimagescale)
                heartimageView.frame = heartimagerect;
                heartimagebutton.frame = heartimagerect;
                myTextView4.frame = CGRect(x: screenWidth/2, y:height4+100+heartimageheight, width: screenWidth*6/8, height:0)
                myTextView4.layer.position = CGPoint(x: screenWidth/2, y:height4+100+heartimageheight)
                myTextView4.sizeToFit()
                //height5
                height5 = height4+100+heartimageheight+myTextView4.frame.height
                //spade
                let spade1rect:CGRect = CGRect(x: screenWidth*2/8, y: height5+50, width: screenWidth/8, height: screenWidth*1.54/8)
                spade1button.frame = spade1rect;
                spade1button.layer.position = CGPoint(x:screenWidth/8 ,y:height5+50)
                spadelabel.frame = CGRect(x: screenWidth/8,y: height5+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //spadelabel.layer.position = CGPoint(x:screenWidth*2/8,y: height5+50-screenWidth*1.54/32)
                spadelabel.sizeToFit()
                height5 += spadelabel.frame.height - 50
                let spadeimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height5+100, width:screenWidth*6/8, height:(screenWidth*6/8)*spadeimagescale)
                spadeimageView.frame = spadeimagerect;
                spadeimagebutton.frame = spadeimagerect;
                myTextView5.frame = CGRect(x: screenWidth/2, y:height5+100+spadeimageheight, width: screenWidth*6/8, height:0)
                myTextView5.layer.position = CGPoint(x: screenWidth/2, y:height5+100+spadeimageheight)
                myTextView5.sizeToFit()
                //height6
                height6 = height5+100+spadeimageheight+myTextView5.frame.height
                //logo
                let logorect:CGRect = CGRect(x:screenWidth/2-screenWidth/16,y:height6+50,width: screenWidth/8,height: logoimagescale*screenWidth/8 )
                logoimageView.frame = logorect;
                logoimagebutton.frame = logorect;
                logolabel.frame = CGRect(x: screenWidth/2,y: height6+50+logoimagescale*screenWidth/8 ,width: 0,height: 0)
                logolabel.layer.position = CGPoint(x:screenWidth*2/8,y: height6+50+logoimagescale*screenWidth/8)
                logolabel.sizeToFit()
                height6 += logolabel.frame.height - 50
                myTextView6.frame = CGRect(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8, width: screenWidth+200, height:0)
                myTextView6.layer.position = CGPoint(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8)
                myTextView6.sizeToFit()
                //height7
                height7 = height6+100+logoimagescale*screenWidth/8+myTextView6.frame.height
                //scrollview
                scrollView.contentSize = CGSize(width:screenWidth, height:height7-220)
                
            } else if (spadeimagetag == 1){
                spadeimagetag = 0
                spadeimageView.image = image1
                height5 = height4+100+heartimageheight+myTextView4.frame.height
                //spade
                let spade1rect:CGRect = CGRect(x: screenWidth/8, y: height5+50, width: screenWidth/8, height: screenWidth*1.54/8)
                spade1button.frame = spade1rect;
                spade1button.layer.position = CGPoint(x:screenWidth/8 ,y:height5+50)
                spadelabel.frame = CGRect(x: screenWidth*2/8,y: height5+50-screenWidth*1.54/32,width: screenWidth*3/4-20,height: 0)
                //spadelabel.layer.position = CGPoint(x:screenWidth*2/8,y: height5+50-screenWidth*1.54/32)
                spadelabel.sizeToFit()
                height5 += spadelabel.frame.height - 50
                spadeimage = image1
                spadeimageView.image = image1
                spadeimageView.isHidden = false
                spadeimgWidth = spadeimage.size.width
                spadeimgHeight = spadeimage.size.height
                spadeimagescale = spadeimgHeight / spadeimgWidth
                spadeimageheight = (screenWidth*6/8)*spadeimagescale
                let spadeimagerect:CGRect =
                CGRect(x:screenWidth/8, y:height5+100, width:screenWidth*6/8, height:(screenWidth*6/8)*spadeimagescale)
                spadeimageView.frame = spadeimagerect;
                spadeimagebutton.frame = spadeimagerect;
                myTextView5.frame = CGRect(x: screenWidth/2, y:height5+100+spadeimageheight, width: screenWidth*6/8, height:0)
                myTextView5.layer.position = CGPoint(x: screenWidth/2, y:height5+100+spadeimageheight)
                myTextView5.sizeToFit()
                //height6
                height6 = height5+100+spadeimageheight+myTextView5.frame.height
                //logo
                let logorect:CGRect = CGRect(x:screenWidth/2-screenWidth/16,y:height6+50,width: screenWidth/8,height: logoimagescale*screenWidth/8 )
                logoimageView.frame = logorect;
                logoimagebutton.frame = logorect;
                logolabel.frame = CGRect(x: screenWidth/2,y: height6+50+logoimagescale*screenWidth/8 ,width: 0,height: 0)
                logolabel.layer.position = CGPoint(x:screenWidth*2/8,y: height6+50+logoimagescale*screenWidth/8)
                logolabel.sizeToFit()
                height6 += logolabel.frame.height - 50
                myTextView6.frame = CGRect(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8, width: screenWidth+200, height:0)
                myTextView6.layer.position = CGPoint(x: screenWidth/2+100, y:height6+100+logoimagescale*screenWidth/8)
                myTextView6.sizeToFit()
                //height7
                height7 = height6+100+logoimagescale*screenWidth/8+myTextView6.frame.height
                //scrollview
                scrollView.contentSize = CGSize(width:screenWidth, height:height7-220)
                
            } else if (logoimagetag == 1){
                logoimagetag = 0
                logoimageView.isHidden = false
                logoimageView.image = image1
            }

                //ボタンの背景に選択した画像を設定
                //imagePickUpButton.setBackgroundImage(image, for: UIControlState.normal)
        } else{
            print("Error")
        }
        // モーダルビューを閉じる
        self.dismiss(animated: true, completion: nil)
    }
    //画像選択がキャンセルされた時に呼ばれる.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // モーダルビューを閉じる
        self.dismiss(animated: true, completion: nil)
    }
    //画像のボタン
    @objc func headerimagebuttonEvent(_ sender: UIButton,count:Int) {
        headerimagetag = 1
        selectImage()
    }
    @objc func iconimagebuttonEvent(_ sender: UIButton,count:Int) {
        iconimagetag = 1
        selectImage()
    }
    @objc func clubimagebuttonEvent(_ sender: UIButton,count:Int) {
        clubimagetag = 1
        selectImage()
    }
    @objc func diaimagebuttonEvent(_ sender: UIButton,count:Int) {
        diaimagetag = 1
        selectImage()
    }
    @objc func heartimagebuttonEvent(_ sender: UIButton,count:Int) {
        heartimagetag = 1
        selectImage()
    }
    @objc func spadeimagebuttonEvent(_ sender: UIButton,count:Int) {
        spadeimagetag = 1
        selectImage()
    }
    @objc func logoimagebuttonEvent(_ sender: UIButton,count:Int) {
        logoimagetag = 1
        selectImage()
    }
    //graphのボタン
    @objc func radareditbuttonEvent(_ sender: UIButton,count:Int) {
        radareditttag = 1
        editgraph()
    }
    @objc func pieeditbuttonEvent(_ sender: UIButton,count:Int) {
        pieedittag = 1
        editgraph()
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

