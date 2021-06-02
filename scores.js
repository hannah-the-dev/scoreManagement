var script = document.createElement('script'); 
script.src ="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js";
document.getElementsByTagName('head')[0].appendChild(script);  



function isSubmittable() {
	const regex = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
	if ($("input[name='name']").val() != jQuery.trim($("input[name='name']").val())) {
		alert("Wrong name format: white spaces");
		console.log($("input[name='name']").val());
		console.log(jQuery.trim($("input[name='name']").val()));
		return false;
	} else if (regex.test($("input[name='name']").val()) || 
		$("input[name='name']").val().includes("[") || 
		$("input[name='name']").val().includes("]") || 
		$("input[name='name']").val().includes("(") ||
		$("input[name='name']").val().includes(")") ) {
		alert("Wrong name format: illegal characters");
		return false;
	}
	return true;
};

function idInvalid() {
	$("input[type='submit']").hide();
	$("input[type='reset']").hide();
	$("input[type='button']").hide();
};

