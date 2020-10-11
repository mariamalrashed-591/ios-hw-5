//
//  PlayerVC.swift
//  songs
//
//  Created by Mariam on 10/9/20.
//

import UIKit
import AVFoundation

class PlayerVC: UIViewController {

    public var position: Int = 0
    public var song: Song!
    
    @IBOutlet var holder: UIView!
    
    var player: AVAudioPlayer?
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let songNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let playPauseButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0{
            configure()
        }
        
    }

    func configure() {
        let urlString = Bundle.main.path(forResource: song.audioName, ofType: "mp3")
        
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
                guard let urlString = urlString else {
                    return
                }
                
                player =  try AVAudioPlayer(contentsOf: URL(string: urlString)!)
                
            guard let player = player else {
                return
            }
            
            player.play()
        }
        catch{
            print("error")
        }
        
        albumImageView.frame = CGRect(x: 10, y: 10, width: holder.frame.size.width-20, height: holder.frame.size.width-20)
        albumImageView.image = UIImage (named: song.songImage)
        holder.addSubview(albumImageView)
        
        songNameLabel.frame = CGRect(x: 10, y: albumImageView.frame.size.height + 20, width: holder.frame.size.width-20, height: 70)
        
        songNameLabel.text = song.songName
        songNameLabel.font = UIFont(name: "Helvetica-Bold", size:40)
        holder.addSubview(songNameLabel)
        
        
        let nextButton = UIButton()
        let backButton = UIButton()
        
        let yPosition = songNameLabel.frame.origin.y + 100 + 50
        let size: CGFloat = 60
        
        playPauseButton.frame = CGRect(x: (holder.frame.size.width - size) / 2.0, y: yPosition, width: size, height: size)
        nextButton.frame = CGRect(x: holder.frame.size.width - size - 20, y: yPosition, width: size, height: size)
        backButton.frame = CGRect(x: 20, y: yPosition, width: size, height: size)
        
        
        playPauseButton.addTarget(self, action: #selector(didTapPausePlayButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        
        playPauseButton.tintColor = .black
        nextButton.tintColor = .black
        backButton.tintColor = .black

        
        holder.addSubview(playPauseButton)
        holder.addSubview(nextButton)
        holder.addSubview(backButton)
        
        let slider = UISlider(frame: CGRect(x: 20, y: holder.frame.size.height-60, width: holder.frame.size.width-40, height: 50))
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSliders(_:)), for: .valueChanged)
        holder.addSubview(slider)
    }
    
    @objc func didTapPausePlayButton() {
        if player?.isPlaying == true {
            player?.pause()
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
        }
        else {
            player?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        }
    }
    @objc func didTapNextButton() {
        if position < (song.songName.count - 1){
            position = position + 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
        
    }
    @objc func didTapBackButton() {
        if position > 0 {
            position = position - 1
            player?.stop()
            for subview in holder.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
        
    }
    
    @objc func didSlideSliders(_ slider: UISlider){
        let value = slider.value
        player?.volume = value
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player{
            player.stop()
        }
    }
    
}
