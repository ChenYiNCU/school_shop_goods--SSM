var k = 0;
var timer;
$(document).ready(function(e) {
	function showpic() {
		$("#sub1 img").each(function(index) {
			if(index == k) {
				
                $(this).css({
					display: "block",
					opacity:0.5
				}).fadeTo(1500, 1);
//				$(this).show(2000);
				
			} else {
				$(this).css({
					display: 'none',
	
				});
			}

		});

		$("#imgc li").each(function(index) {
			if(index == k) {
				$(this).css({
					background: 'white'
				});
			} else {
				$(this).css({
					background: 'none'
				});
			}

		});

		if(k >= $("#sub1 img").length - 1) {
			k = 0;
		} else {
			k++;
		}
	}

	timer = setInterval(showpic, 3000);

	$("#sub1").mouseover(function() {
		clearInterval(timer);
	});
	
	$("#sub1").mouseout(function() {
		timer = setInterval(showpic, 3000);
	});

	$("#imgc li").click(function() {
		k = $(this).val();
		showpic();
	});
	
	$("#more").mouseover(function() {
		/*alert('1111');*/
		$("#box").css({
			display: 'block',
			
				
		});
	});
	$("#more").mouseout(function() {
		$("#box").css({
			display: 'none',
		});
	});
	var mouseflow=document.querySelector('#mouseflow');
	document.addEventListener('mousemove',function(e){
		var x=e.pageX;
		var y=e.pageY;
		mouseflow.style.top=y+5+'px';
		mouseflow.style.left=x+5+'px';
		mouseflow.style.display='block';
	});	
	
});

window.addEventListener('load', function() {
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: 3,
		spaceBetween: 30,
		pagination: {
			el: '.swiper-pagination',
			clickable: true,
		},
	});

});

