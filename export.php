<?php

require __DIR__ . '/vendor/autoload.php';

use PhpOffice\PhpWord\PhpWord;
use PhpOffice\PhpWord\TemplateProcessor;

require 'config/db.php';

// Lấy dữ liệu từ cơ sở dữ liệu
$sql = "SELECT
            studenterollsemster.student_id,
            studenterollsemster.semester_id,
            studenterollsemster.status,
            students.student_id,
            students.student_code,
            students.full_name,
            students.class_id,
            classes.class_id,
            classes.class_name,
            departments.department_name,
            terms.term_name
        FROM 
            studenterollsemster
        
        INNER JOIN
            students
        ON
            studenterollsemster.student_id = students.student_id
        
        INNER JOIN
            classes
        ON
            students.class_id = classes.class_id

        INNER JOIN
            departments
        ON
            students.department_id = departments.department_id

        INNER JOIN
            terms
        ON
            students.term_id = terms.term_id

        WHERE 
            semester_id=1 AND status=1
        ";
// echo $sql;

// Execute the query
$result = mysqli_query($conn, $sql);

// Check if there are results
if (mysqli_num_rows($result) > 0) {
    // Loop through the results
    while ($row = mysqli_fetch_assoc($result)) {
        // Print the desired columns
        
        // $phpWord = new PhpWord();

        // $word->loadTemplate("template/template_trainingScoreForm.docx");

        $templateProcessor = new TemplateProcessor('template/template_trainingScoreForm.docx"');

        $templateProcessor->setValue('student_fullname', $row['full_name']);
        $templateProcessor->setValue('student_code', $row['student_code']);
        $templateProcessor->setValue('class_name', $row['class_name']);
        $templateProcessor->setValue('department_name', $row['department_name']);
        $templateProcessor->setValue('term_name', $row['term_name']);

        // $document = $phpWord->loadTemplate("template/template_trainingScoreForm.docx");

        $pathToSave = 'export/'.substr($row['student_code'], -2)."_".$row['student_code']."_".$row['full_name'].'.docx';
        $templateProcessor->saveAs($pathToSave);

    }
} else {
    echo "No results found";
}


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







?>