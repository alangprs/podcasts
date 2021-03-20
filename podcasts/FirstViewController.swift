
import UIKit
import AVFoundation
let play = AVPlayer() //宣告音樂播放器


class FirstViewController: UIViewController {
    
    
    @IBOutlet weak var titleNameLabel: UILabel! //標題名稱label
    @IBOutlet weak var subTitle: UILabel! //副標題名稱label
    @IBOutlet weak var playButton: UIButton! //播放按鈕
    @IBOutlet weak var playNextButton: UIButton!//下一首按鈕
    @IBOutlet weak var playBackButton: UIButton!//上一首按鈕
    
    
    
    
    var musics = [Music]() //導入自定義資料
    let playIcon = UIImage(systemName: "play.fill") //播放圖示
    let pauseIconn = UIImage(systemName: "pause.fill") //暫停圖示
    var index = 0
    
    //音樂播放func
    func playMusic(){
        let firleUrl = Bundle.main.url(forResource: musics[index].titleName, withExtension: "mp4")!
        let playItem = AVPlayerItem(url: firleUrl)
        play.replaceCurrentItem(with: playItem)
        play.play()
        
        //更改標題、副標題
        titleNameLabel.text = musics[index].titleName
        subTitle.text = musics[index].subtitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //建立音訊資料
        musics.append(Music(titleName: "The KK Show - #70 Clubhouse 認識的朋友 - 葉耀元教授", subtitle: "百靈果NEWS - 2021年3月9"))
        musics.append(Music(titleName: "The KK Show-#67 美國在台協會文化官", subtitle: "百靈果NEWS - 2021年2月16"))
        musics.shuffle() //打亂順序
        //開場聲音大小
        play.volume = 0.5
    }
    
    //播放按鈕
    @IBAction func playingMusic(_ sender: UIButton) {
        playMusic()
        if play.timeControlStatus == .playing{
            play.pause()
            playButton.setImage(playIcon, for: .normal)
        }else {
            play.play()
            playButton.setImage(pauseIconn, for: .normal)
        }
       
    }
    //下一首按鈕動作
    @IBAction func nextPlaying(_ sender: UIButton) {
        index += 1
        playMusic()
    }
    //上一首動作
    @IBAction func backPlaying(_ sender: UIButton) {
        index -= 1
        playMusic()
    }
    //更改聲音大小slider
    @IBAction func changVolume(_ sender: UISlider) {
        play.volume = sender.value //音量大小跟著slider的值改變
    }
}
