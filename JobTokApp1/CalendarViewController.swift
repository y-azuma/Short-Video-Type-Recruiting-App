//
//  CalendarViewController.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/09/26.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit
import FSCalendar
import CalculateCalendarLogic
//ディスプレイサイズ取得
let width = UIScreen.main.bounds.size.width
let height = UIScreen.main.bounds.size.height
class CalendarViewController: UIViewController,UITabBarDelegate,FSCalendarDelegate,FSCalendarDataSource,FSCalendarDelegateAppearance {
    //画面の幅、高さを取得
    fileprivate weak var calendar: FSCalendar!
    private var myTabBar:MyTabBar!
    //スケジュール内容
    let labelDate = UILabel(frame: CGRect(x: 5, y: 540, width: 400, height: 40))
    //「主なスケジュール」の表示
    let labelTitle = UILabel(frame: CGRect(x: 0, y: 500, width: 180, height: 40))
    //カレンダー部分
    let dateView = FSCalendar(frame: CGRect(x: 0, y: 0, width: width, height: 400))
    //日付の表示
    let Date = UILabel(frame: CGRect(x: 5, y: 430, width: 200, height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()
        //カレンダー設定
        self.dateView.dataSource = self
        self.dateView.delegate = self
        self.dateView.today = nil
        self.dateView.tintColor = .red
        self.view.backgroundColor = .white
        dateView.backgroundColor = .white
        view.addSubview(dateView)
        
        //日付表示設定
        Date.text = ""
        Date.font = UIFont.systemFont(ofSize: 60.0)
        Date.textColor = .black
        view.addSubview(Date)
        
        //「主なスケジュール」表示設定
        labelTitle.text = ""
        labelTitle.textAlignment = .center
        labelTitle.font = UIFont.systemFont(ofSize: 20.0)
        view.addSubview(labelTitle)
        
        //スケジュール内容表示設定
        labelDate.text = ""
        labelDate.font = UIFont.systemFont(ofSize: 18.0)
        view.addSubview(labelDate)
        
        //スケジュール追加ボタン
        let addBtn = UIButton(frame: CGRect(x: width - 70, y: height - 130, width: 60, height: 60))
        addBtn.setTitle("+", for: UIControl.State())
        addBtn.setTitleColor(.white, for: UIControl.State())
        addBtn.backgroundColor = .orange
        addBtn.layer.cornerRadius = 30.0
        addBtn.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
        view.addSubview(addBtn)
        
        
        /**   TabBarを設置   **/
        //デフォルトは49
        let tabBarHeight:CGFloat = 58
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
        let calendar:UITabBarItem = UITabBarItem(title: "calendar", image: UIImage(named: "calendar30"), tag: 4)
        //ボタンをタブバーに配置する
        myTabBar.items = [top,search,account,calendar]
        //デリゲートを設定する
        myTabBar.delegate = self
        
        self.view.addSubview(myTabBar)
    }
    //他の場所を押すとキーボードが閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
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
    
    fileprivate let gregorian: Calendar = Calendar(identifier: .gregorian)
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    // 祝日判定を行い結果を返すメソッド
    func judgeHoliday(_ date : Date) -> Bool {
        //祝日判定用のカレンダークラスのインスタンス
        let tmpCalendar = Calendar(identifier: .gregorian)
        
        // 祝日判定を行う日にちの年、月、日を取得
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        
        let holiday = CalculateCalendarLogic()
        
        return holiday.judgeJapaneseHoliday(year: year, month: month, day: day)
    }
    
    // date型 -> 年月日をIntで取得
    func getDay(_ date:Date) -> (Int,Int,Int){
        let tmpCalendar = Calendar(identifier: .gregorian)
        let year = tmpCalendar.component(.year, from: date)
        let month = tmpCalendar.component(.month, from: date)
        let day = tmpCalendar.component(.day, from: date)
        return (year,month,day)
    }
    
    //曜日判定
    func getWeekIdx(_ date: Date) -> Int{
        let tmpCalendar = Calendar(identifier: .gregorian)
        return tmpCalendar.component(.weekday, from: date)
    }
    
    // 土日や祝日の日の文字色を変える
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
        //祝日判定をする
        if self.judgeHoliday(date){
            return UIColor.red
        }
        
        //土日の判定
        let weekday = self.getWeekIdx(date)
        if weekday == 1 {
            return UIColor.red
        }
        else if weekday == 7 {
            return UIColor.blue
        }
        
        return nil
    }
    //ボタンクリック時
    @objc func onClick(_: UIButton) {
        let vc = EventViewController()
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc,animated: true,completion: nil)
    }
    //カレンダー処理(スケジュール表示処理)
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        
        labelTitle.text = "主なスケジュール"
        labelTitle.backgroundColor = .orange
        view.addSubview(labelTitle)
        
        //予定がある場合、スケジュールをDBから取得・表示する。
        //無い場合、「スケジュールはありません」と表示。
        labelDate.text = "スケジュールはありません"
        labelDate.textColor = .lightGray
        view.addSubview(labelDate)
        
        let tmpDate = Calendar(identifier: .gregorian)
        let year = tmpDate.component(.year, from: date)
        let month = tmpDate.component(.month, from: date)
        let day = tmpDate.component(.day, from: date)
        let m = String(format: "%02d", month)
        let d = String(format: "%02d", day)
        
        _ = "\(year)/\(m)/\(d)"
        
        //クリックしたら、日付が表示される。
        Date.text = "\(m)/\(d)"
        view.addSubview(Date)
        
        //スケジュール取得
        //let realm = try! Realm()
        //var result = realm.objects(Event.self)
        let result = EventViewController.eventtxt
        /*
        result = result.filter("date = '\(da)'")
        print(result)
        for ev in result {
            if ev.date == da {
                labelDate.text = ev.event
                labelDate.textColor = .black
                view.addSubview(labelDate)
         */
        labelDate.text = result
        labelDate.textColor = .black
        view.addSubview(labelDate)
            }
        }
    /*点マークをつける関数
    func calendar(calendar: FSCalendar!, hasEventForDate date: NSDate!) -> Bool {
        let date:NSDate = NSDate() //当日の日付を得る
        print(222222222222222222)
        print(date)
        return true
    }
    //画像をつける関数
    func calendar(_ calendar: FSCalendar!, imageFor date: NSDate!) -> UIImage! {
        return
    }
 
    //カレンダーの日付をタップしたとき
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        let selectDay = getDay(date)
        print(selectDay)
    }*/
    

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


