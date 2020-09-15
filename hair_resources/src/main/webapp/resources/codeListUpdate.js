	$(".btncateUpdate").click(function() {
				var cate4 = $(this).parent()
						.parent().children().eq(0)
						.text();
				var cate1 = $(this).parent()
						.parent().children().eq(1)
						.text();
				var cate2 = $(this).parent()
						.parent().children().eq(2)
						.text();
				var cate3 = $(this).parent()
						.parent().children().eq(3)
						.text();
				$("#cate1").val(cate1);
				$("#cate4").val(cate4);
				$("#cate2").text(cate2);
				$("#cate3 option").removeAttr(
						"selected");
				console
						.log($("#cate3").children().length);
				for (var i = 0; i < $("#cate3")
						.children().length; i++) {
					if ($("#cate3").children()
							.eq(i).text() == cate3) {
						console.log(cate3);
						$("#cate3 option").eq(i)
								.attr("selected",
										"selected");
					}
				}
				dialog.dialog("open");
					});
	
	dialog = $("#dialog").dialog({
		autoOpen : false,
		height : 400,
		width : 350,
		modal : true
	});