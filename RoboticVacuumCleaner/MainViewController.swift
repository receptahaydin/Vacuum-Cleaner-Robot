//
//  MainViewController.swift
//  RoboticVacuumCleaner
//
//  Created by Recep Taha Aydın on 7.11.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var roomAimage: UIImageView!
    @IBOutlet weak var roomBimage: UIImageView!
    
    @IBOutlet weak var roomAlabel: UILabel!
    @IBOutlet weak var roomBlabel: UILabel!
    
    @IBOutlet weak var textView: UITextView!
    
    var roomA: Room!
    var roomB: Room!
    var robot: Robot!
    var roomList: [Room]!
    var robotCheckTimer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        roomA = Room(id: 1, isClean: false)
        roomB = Room(id: 2, isClean: false)
        roomList = [roomA, roomB]
        robot = Robot(roomList: roomList, isActive: false)
    }
    
    @IBAction func start(_ sender: Any) {
        startRobotCheckTimer()
    }
    
    func cleanRoomA() {
        if roomA?.isClean == false {
            textView.text += "\nVacuum cleaner cleaning the Room-A"
            mainImage.image = nil
            roomBimage.image = nil
            roomAimage.image = UIImage(named: "robotpng")
            robot.isActive = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.startCleaningCycle(room: self.roomA!)
                self.roomAlabel.text = "Cleaned"
                self.robot.isActive = false
                self.textView.text += "\nCleaned Room-A"
                self.roomA?.isClean = true
                if self.roomB?.isClean == false {
                    self.roomAimage.image = nil
                    self.cleanRoomB()
                }
            }
        } else if roomB?.isClean == false {
            self.roomAimage.image = nil
            cleanRoomB()
        } else if roomA.isClean == true || roomB.isClean == true {
            self.textView.text += "\nAll rooms clean, robot is waiting"
        }
    }
    
    func cleanRoomB() {
        if roomB?.isClean == false {
            textView.text += "\nVacuum cleaner cleaning the Room-B"
            mainImage.image = nil
            roomAimage.image = nil
            roomBimage.image = UIImage(named: "robotpng")
            robot.isActive = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                self.startCleaningCycle(room: self.roomB!)
                self.roomBlabel.text = "Cleaned"
                self.robot.isActive = false
                self.textView.text += "\nCleaned Room-B"
                self.roomB?.isClean = true
                if self.roomA?.isClean == false {
                    self.roomBimage.image = nil
                    self.cleanRoomA()
                }
            }
        } else if roomA?.isClean == false {
            self.roomBimage.image = nil
            cleanRoomA()
        }
    }
    
    func startCleaningCycle(room: Room) {
        let randomNumber = Int.random(in: 1...15)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(randomNumber)) {
            room.isClean = false
            if room.id == 1 {
                self.roomAlabel.text = "Dirty"
            } else {
                self.roomBlabel.text = "Dirty"
            }
        }
    }
    
    func startRobotCheckTimer() {
        robotCheckTimer = Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(robotCheck), userInfo: nil, repeats: true)
    }
    
    @objc func robotCheck() {
        for room in robot.roomList {
            if robot.isActive == false {
                if room.isClean == false {
                    cleanRoomA()
                }
            }
        }
    }
}
