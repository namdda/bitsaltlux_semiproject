/**
 * 
 */

$('#btn-submit').click(function() {
	const title = $("#input-title").val();
	const content = $("#input-content").val();

	if (title == '' || content == '') {
		alert("필수항목 미입력 오류입니다.");
		return false;
	}
});