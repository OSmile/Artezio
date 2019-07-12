function buttonClick(){
	if(document.getElementById('x1').value =="" || document.getElementById('x2').value ==""){
		alert("Поля x1 и x2 должны быть заполнены.");
	} else {
		
		var x1 = parseInt(document.getElementById('x1').value);
		var x2 = parseInt(document.getElementById('x2').value);
			
		if(Number.isNaN(x1) || Number.isNaN(x2)){
			alert("В поля х1 и х2 должны быть введены числовые значения.")
		} else {
			
			var resultDiv = document.getElementById("result");
			resultDiv.innerHTML = "";
			
			var radioButton = document.getElementsByName("radioButton");
			var result;
			
			//for sum
			if(radioButton[0].checked){ 
				result = 0;
				for(var i = x1; i <= x2; i++){
					result += i;
				}
			}
			
			//for multiplication
			if(radioButton[1].checked) {
				result = 1;
				for(var i = x1; i <= x2; i++){
					result *= i;
				}
			}
			resultDiv.append("Итог: " + result);
			
			//for prime numbers
			var prime = document.getElementById("primeNumber");
			if(prime.checked){
				resultDiv.append(". Простые числа в интервале: ");
				for(var i = x1; i <= x2; i++){
					if(primeNumber(i))
						resultDiv.append(i + " ");
				}
			}
		}
	}
}

function deleteClick(){
	document.getElementById('x1').value = "";
	document.getElementById('x2').value = "";
}

function primeNumber(num){
	/*
			Too many theories exist on whether 1 is a prime number or not. 
			We assume that 1 is not a prime number. So let's check it,
	*/
	if(num == 1){
		return false;
	}
	for(var i = 2; i <= num / 2; i++){
		if(num % i == 0){
			return false;
		}
	}
	return true;
}
