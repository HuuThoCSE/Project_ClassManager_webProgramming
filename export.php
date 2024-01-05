<?php

require __DIR__ . '/vendor/autoload.php';

// require 'config/db.php';


// // Lấy dữ liệu từ cơ sở dữ liệu
// $sql = "SELECT * FROM Accounts";
// $result = mysqli_query($conn, $sql);

// // Tạo file DOCX mẫu
// $document = new \PhpOffice\PhpWord\Document();

// // Thêm Bookmarks vào file DOCX mẫu
// $bookmarks = $document->getBookmarks();
// $bookmarks->addBookmark("user_name", "Tên người dùng");
// $bookmarks->addBookmark("user_email", "Email người dùng");

// // Sử dụng dữ liệu từ file PHP để cập nhật Bookmarks trong file DOCX mẫu
// while ($row = mysqli_fetch_assoc($result)) {
//     $bookmarks->getBookmark("user_name")->setText($row["name"]);
//     $bookmarks->getBookmark("user_email")->setText($row["email"]);
// }

// // Lưu file DOCX
// $document->save("/export/users.docx");

// // Đóng kết nối MySQL
// mysqli_close($conn);

use PhpOffice\PhpWord\PhpWord;

$phpWord = new PhpWord();
$section = $phpWord->addSection();
$section->addText('Hello, world!');

$phpWord->save('hello_world.docx');

?>