alert("It works!");

for(var i=10; i<=20; i++){
	console.log(i);
}

//------------------------------------
console.log("Sqr for number \n");
for(var i = 10; i <= 20; i++){
	var sqr = 0;
	for(var j = 1; j < 2*i; j = j+2)
		sqr += j;
	console.log(sqr);
}

console.log("Another version for sqr");
for(var i = 10; i <= 20; i++){
	console.log(i*i);
}

//------------------------------------
console.log("Sum for number \n");
var sum = 0;
for(var i = 10; i <= 20; i++){
	sum += i;
}
console.log(sum);

//------------------------------------
