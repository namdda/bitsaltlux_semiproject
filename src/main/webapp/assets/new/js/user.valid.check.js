/**
 * 
 */

$(function() {
	$('#input-id').change(function() {
		$('#img-check').hide();
		$('#btn-check').show();
	});

	$('#btn-check').click(function() {
		const id = $("#input-id").val();
		if (id == '') {
			return;
		}

		$.ajax({
			url: "/myblog/api/user/existid?id=" + id,
			async: true,
			data: '',
			dataType: 'json',
			success: function(response) {
				if (response.result != 'success') {
					console.error(response.message);
					return;
				}

				if (response.data == true) {
					alert('이미 존재하는 아이디입니다. 다른 아이디를 사용해 주세요');
					$("#input-id")
						.val('')
						.focus();
					return;
				}

				$('#img-check').show();
				$('#btn-check').hide();
			},
			error: function(xhr, status, e) {
				console.error(status + ":" + e);
			},

		});
	});
});

/* 스프링 @Valid를 배우지 않아 유효성 검사는 이렇게 함 */
$('#btn-submit').click(function() {
	const id = $("#input-id").val();
	const pw = $("#input-password").val();
	const name = $("#input-name").val();

	if (id == '' || pw == '' || name == '') {
		alert("필수항목 미입력 오류입니다.");
		return false;
	}

	if ($('#img-check').is(':visible') == false) {
		alert("아이디 중복 체크를 클릭해주세요.");
		$("#input-id").focus();
		return false;
	}

	alert(id + "님 회원가입을 축하합니다.");
});