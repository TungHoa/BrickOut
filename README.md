#  Brick out game
   Màn hình  gồm nhiều ô gạch , 1 quả bóng , 1 thanh đỡ 
   Trong game người chơi sẽ di chuyển thanh đỡ qua trái phải để cố gắng đỡ quả bóng bay lên phá vỡ đống gạch phía trên 


# Yêu cầu 
1. Sử dụng ở chế độ  Potrait
2. Có 3 mức chơi noob(1 ô ,1 hàng và tốc độ bóng bay chậm) - easy - hard (nhiều gạch hơn , tốc độ bóng bay nhanh hơn)
3. Có âm thanh phát ra khi chơi

# Các bước tiến hành 
1. Tạo 1 timer để chạy vòng lặp game.   
2. Cần 1 mảng 2 chiều , mỗi phần tử thể hiện 1 ô gạch
3. Tạo  custom UIView để chứa và quản lí thanh đỡ và quả bóng
4. Sử dụng intersects để kiểm tra va chạm của gạch và quả bóng

# Phân tích
1.  Người chơi tác động 
    Thanh đỡ và quả bóng xuất phát ở giữa màn hình góc dưới .người chơi di chuyển thanh đỡ sang trái hoặc phải để quả bóng lênn
    Nếu bóng va vào 2 bên thành và đỉnh màn hình và thanh đỡ thì nảy lại 
    Nếu không đỡ được bóng và rơi xuống dưới  thanh đỡ thì thua
    
    2. Nếu thua thì chơi chơi lại , thắng thì về màn hình home chọn mức chơi
    Gạch có 2 loại , màu sáng với cứng hơn cần 2 lần va chạm , màu tối hơn chỉ cần 1 lần 
    
    
    


