


import UIKit


class MainScreen: UIViewController {
    var brickWall =  Set<Brick>()
    let margin: CGFloat = 8.0
    var cols: Int = 5
    var rows: Int = 5
    let ball = Ball(R: 20.0)
    let paddle = Paddle()
    var timer: Timer!
    let sound = SoundManager()
    let soundTheme = SoundManager()
    
    let gamestart = UIImageView(image: UIImage(named: "gamestart"))
    let gameover = UIImageView(image: UIImage(named: "gameover"))
    let gamewin = UIImageView(image: UIImage(named: "gamewin"))
    
    var time: Double!
    var scoreCount :Int = 0
    
    
    let scoreCountLabel: UILabel = {
        let score = UILabel()
        score.translatesAutoresizingMaskIntoConstraints = false
        score.text = "Score"
        score.textColor = .white
        
        return score
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        
        gameStart()
        
        
    }

    
    //xây tường gạch
    func buildBrickWall() {
        let brick_width = (view.bounds.width - CGFloat(cols + 1) * margin) / CGFloat(cols)
        let brick_height: CGFloat = 25.0
        for i in 0..<rows {
            var brickRows = [Brick]()
            for j in 0..<cols {
                let brick = Brick()
                brick.frame = CGRect(x: margin * CGFloat(j + 1) + CGFloat(j) * brick_width,
                                     y: 50.0 + CGFloat(i) * (brick_height + margin),
                                     width: brick_width,
                                     height: brick_height)
                
                brick.backgroundColor = .brown
                view.addSubview(brick)
                brickRows.append(brick)
            }
            for b in brickRows{
                brickWall.insert(b)
            }
        }
    }
    // tạo bóng và thanh đỡ
    func initBallAndPaddle() {
        view.addSubview(ball)
        let ycenterPaddle = view.bounds.height - 25.0
        paddle.center = CGPoint(x: view.bounds.width * 0.5, y: ycenterPaddle)
        ball.center = CGPoint(x: view.bounds.width * 0.5, y: ycenterPaddle - paddle.bounds.height * 0.5 - ball.radius)
        view.addSubview(paddle)
        ball.vx = 1
        ball.vy = -1
    }

    
    

    @objc func gameLoop(){
        
        var ball_new_x = ball.center.x + ball.vx
        var ball_new_y = ball.center.y + ball.vy
        // va vào thành dọc bên phải
        if ball_new_x > view.bounds.width - ball.radius {
            ball.vx = -ball.vx
            ball_new_x = view.bounds.width - ball.radius
        }
        // va thành dọc bên trái
        if ball_new_x < ball.radius {
            ball.vx = -ball.vx
            ball_new_x = ball.radius
        }
        // va vào paddle
        if ball_new_y >= view.frame.height + ball.radius{
            gameOver()
        }else if ball_new_y > paddle.frame.origin.y - ball.radius {
            if ball_new_x < paddle.frame.origin.x + paddle.frame.width && ball_new_x > paddle.frame.origin.x {
                sound.playSound("tic")
                ball.vy = -ball.vy
                ball_new_y = paddle.frame.origin.y - ball.radius }
            
        }
        

        
        //va vào đỉnh màn hình
        if ball_new_y < ball.radius {
            ball.vy = -ball.vy
            ball_new_y = ball.radius
        }
        ball.center = CGPoint(x: ball_new_x, y: ball_new_y)
        
        //phát hiện va chạm bóng với các ô gạch
        for b in brickWall{
            if b.frame.intersects(ball.frame) {
                scoreCount += 10
                scoreCountLabel.text = "Score:\(scoreCount)"
                sound.playSound("break")
                b.hardness -= 1
                b.alpha = CGFloat(b.hardness)/2.0
                if ball.center.x < b.frame.origin.x { ball.vx = -ball.vx }
                else if ball.center.y < b.frame.origin.y { ball.vy = -ball.vy }
                else if ball.center.x > b.frame.origin.x + b.frame.width { ball.vx = -ball.vx }
                else { ball.vy = -ball.vy }
                if b.hardness == 0 {
                    b.removeFromSuperview()
                    brickWall.remove(b)
                    if brickWall.count == 0 {
       
                        gameWin()
                       
                    }
                }
            }
        }
       
}
    
    //hàm khi game bắt đầu
    func gameStart(){
        buildBrickWall()
        initBallAndPaddle()
        setupLabel()
        gamestart.center = CGPoint(x: view.center.x, y: view.bounds.height + gameover.bounds.height * 0.5)
        view.addSubview(gamestart)
        gameover.center = CGPoint(x: view.center.x, y: view.bounds.height + gameover.bounds.height * 0.5)
        view.addSubview(gameover)
        gamewin.center = CGPoint(x: view.center.x, y: view.bounds.height + gamewin.bounds.height * 0.5)
        view.addSubview(gamewin)
      //Lên lịch một mục công việc để thực hiện tại thời điểm được chỉ định và trả về ngay lập tức.
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            UIView.animate(withDuration: 2, animations: {
                self.gamestart.center = self.view.center
                let start = UITapGestureRecognizer(target: self, action: #selector(MainScreen.tapStart))
                self.gamestart.addGestureRecognizer(start)
                self.gamestart.isUserInteractionEnabled = true
                self.soundTheme.gameTheme()
            }){ (_) in
                
            }
        })

    }
    @objc func tapStart(){
        timer = Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
        scoreCount = 0
        scoreCountLabel.text = "Score:\(scoreCount)"
        gamestart.removeFromSuperview()
    }
    //hàm khi thua game
    func gameOver(){
        timer.invalidate()
        sound.playSound("lose")
        
      
        //code dưới đây xóa tất cả các phần tử khiến phần mềm bị crash
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            for brick in self.brickWall   {
                self.brickWall.remove(brick)
                brick.removeFromSuperview()
            }
            self.paddle.removeFromSuperview()
            self.ball.removeFromSuperview()
            //self.scoreCountLabel.removeFromSuperview()
            UIView.animate(withDuration: 2, animations: {
                self.gameover.center = self.view.center
                let reset = UITapGestureRecognizer(target: self, action: #selector(MainScreen.reset(gesture:)))
                self.gameover.addGestureRecognizer(reset)
                self.gameover.isUserInteractionEnabled = true
            }){ (_) in
                
            }
        })
        
    }
    @objc func reset(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {

            self.gameover.removeFromSuperview()
            
            gameStart()
        }
    }
    
    //hàm khi thắng game
    func gameWin(){
        timer.invalidate()
        sound.playSound("win" )
        self.ball.removeFromSuperview()
        self.paddle.removeFromSuperview()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2, execute: {
            UIView.animate(withDuration: 2, animations: {
                self.gamewin.center = self.view.center
                let reset = UITapGestureRecognizer(target: self, action: #selector(MainScreen.win(gesture:)))
                self.gamewin.addGestureRecognizer(reset)
                self.gamewin.isUserInteractionEnabled = true
            }){ (_) in
                
            }
        })
    }
    @objc func win(gesture: UIGestureRecognizer){
        if (gesture.view as? UIImageView) != nil {
            
            self.gamewin.removeFromSuperview()
            let nextViewController = HomeScreen()
            self.present(nextViewController, animated: true, completion: nil)
            
        }
    }
    func setupLabel(){
        view.addSubview(scoreCountLabel)
        scoreCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        scoreCountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        
        scoreCountLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        scoreCountLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
}
