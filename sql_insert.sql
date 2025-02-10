
delete from favorite
delete from share
delete from video
delete from users

INSERT INTO [Users] (Id, Password, Email, Fullname, Admin) VALUES
('user1', 'password', 'user1@example.com', N'John Doe', 0),
('user2', 'password', 'user2@example.com', N'Jane Smith', 0),
('admin1', 'adminpass', 'admin1@example.com', N'Nam Bui', 1),
('user3', 'password', 'user3@example.com', N'Alice Johnson', 0),
('user4', 'password', 'user4@example.com', N'Bob Brown', 0);

INSERT INTO Video (Id, Title, Poster, Views, Description, Active) VALUES
('8DS7HfwdjGs', N'Mùa Mưa Ấy / Vũ. (từ Album "Bảo Tàng Của Nuối Tiếc")', 'https://www.youtube.com/watch?v=8DS7HfwdjGs', 1050000, N'Mùa Mưa Ấy / Vũ. (từ Album "Bảo Tàng Của Nuối Tiếc") - https://baotangcuanuoitiec.com/ 
Vũ. - "Bảo Tàng Của Nuối Tiếc" Concert Tour 2024 - ĐÃ MỞ BÁN VÉ TRÊN TICKETBOX', 1),
('9_JV3fyPv64', N'Nếu Những Tiếc Nuối / Vũ. (từ Album "Bảo Tàng Của Nuối Tiếc")', 'https://www.youtube.com/watch?v=9_JV3fyPv64', 450000, N'Nếu Những Tiếc Nuối / Vũ. (từ Album "Bảo Tàng Của Nuối Tiếc") - https://baotangcuanuoitiec.com/ 
Vũ. - "Bảo Tàng Của Nuối Tiếc" Concert Tour 2024 - ĐÃ MỞ BÁN VÉ TRÊN TICKETBOX', 1),
('o-2yt0ZZZ6o', N'Không Yêu Em Thì Yêu Ai? / Vũ. ft. Low G (từ Album "Bảo Tàng Của Nuối Tiếc")', 'https://www.youtube.com/watch?v=o-2yt0ZZZ6o', 2300000, N'Không Yêu Em Thì Yêu Ai? / Vũ. ft. Low G (từ Album "Bảo Tàng Của Nuối Tiếc") - https://baotangcuanuoitiec.com/ 
Vũ. - "Bảo Tàng Của Nuối Tiếc" Concert Tour 2024 - ĐÃ MỞ BÁN VÉ TRÊN TICKETBOX', 1),
('0GCvkxZtS-w', N'Nhất Bái Thiên Địa (The Flob) - Live at Điêu Check Pop-up show | The Flob TV', 'https://www.youtube.com/watch?v=0GCvkxZtS-w', 1200000, N'Đây là phiên bản 30%
Phiên bản 100% phải on stage và không chỉ cảm nhận bằng thính giác.', 1),
('KVHimR1vf0o', N'SỐNG CHO HẾT ĐỜI THANH XUÂN 3 - BCTM x TNS ( Official Music Video ) Prod .HPro', 'https://www.youtube.com/watch?v=KVHimR1vf0o', 750000, N'( PHẦN KẾT ) SỐNG CHO HẾT ĐỜI THANH XUÂN – BẠN CÓ TÀI MÀ', 1),
('30KI5SuECuc', N'Âm Thầm Bên Em | OFFICIAL MUSIC VIDEO | Sơn Tùng M-TP', 'https://www.youtube.com/watch?v=30KI5SuECuc', 980000, N'Âm Thầm Bên Em | Official Music Video | Sơn Tùng M-TP
Turn on CC for official English subtitle.', 1);

INSERT INTO Favorite (UserId, VideoId, LikeDate) VALUES
('user1', '8DS7HfwdjGs', '2024-01-05'),
('user2', 'o-2yt0ZZZ6o', '2024-01-06'),
('admin1', '0GCvkxZtS-w', '2024-01-07'),
('user1', '9_JV3fyPv64', '2024-01-10'),
('user2', '0GCvkxZtS-w', '2024-01-11'),
('admin1', '30KI5SuECuc', '2024-01-12'),
('user1', 'o-2yt0ZZZ6o', '2024-01-15'),
('user2', 'KVHimR1vf0o', '2024-01-16'),
('user4', '8DS7HfwdjGs', '2024-01-19'),
('user1', '30KI5SuECuc', '2024-01-20'),
('user3', '8DS7HfwdjGs', '2024-01-23'),
('user4', '0GCvkxZtS-w', '2024-01-24');
