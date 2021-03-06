<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골라조</title>

<style type="text/css">
@font-face {
    src: url("fonts/08SeoulNamsanL_0.ttf"); 
  	font-family: "SeoulNamsanL";
}
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	font-family: 'SeoulNamsanL';
}

body, button {
	font-size: 16px;
	line-height: 1.5;
}
body {
	width:100%;
	background: linear-gradient(110deg, white 60%, gray 60%);
}
button {
	cursor: pointer;
}
/* Cookie */
.fc {
	border:none;
	background: transparent;
	display: block;
	margin: 10% auto 0 auto;
	position: relative;
	width: 20em;
	height: 17em;
}
.fc:focus {
	outline: transparent;
}
.fc-part, .fc-crumbs, .fc-crumb, .fc-fortune {
	position: absolute;
	top: 0;
}
.fc-part, .fc-crumb {
	background: currentColor;
	color: #efaa5d;
}
.fc-part {
	width: 8em;
	height: 18em;
	z-index: 2;
}
.left {
	border-radius: 7em 1em 1em 7em / 50%;
	box-shadow:
		0.5em 0 0 inset,
		0.5em 0.2em 0 inset,
		1em 0.2em 0 #fff6 inset,
		-0.75em 0 0 #0002 inset;
	clip-path: polygon(0% 0%, 68% 0%, 100% 30%, 100% 100%, 0% 100%);
	-webkit-clip-path: polygon(0% 0%, 68% 0%, 100% 30%, 100% 100%, 0% 100%);
	left: calc(50% - 5.4em);
	transform: rotate(25deg);
	transform-origin: 68% 0;
}
.right {
	border-radius: 1em 7em 7em 1em / 50%;
	box-shadow:
		-0.5em 0 0 inset,
		-0.5em 0.2em 0 inset,
		-1em 0.2em 0 #fff6 inset,
		0.75em 0 0 #0002 inset;
	clip-path: polygon(0% 30%, 32% 0%, 100% 0, 100% 100%, 0% 100%);
	-webkit-clip-path: polygon(0% 30%, 32% 0%, 100% 0, 100% 100%, 0% 100%);
	right: calc(50% - 5.4em);
	transform: rotate(-25deg);
	transform-origin: 32% 0;
}
.fc-crumbs {
	left: calc(50% - 0.4em);
	width: 0.8em;
	height: 6em;
	z-index: 1;
}
.fc-crumb {
	border-radius: 50%;
	width: 0.5em;
	height: 0.5em;
}
.fc-crumb:nth-child(1) {
	top: 4%;
	left: 15%;
}
.fc-crumb:nth-child(2) {
	top: 20%;
	right: 15%;
}
.fc-crumb:nth-child(3) {
	top: 30%;
	left: 25%;
}
.fc-crumb:nth-child(4) {
	top: 45%;
	right: 25%;
}
.fc-crumb:nth-child(5) {
	top: 55%;
	left: 5%;
}
.fc-crumb:nth-child(6) {
	top: 65%;
	right: 5%;
}
.fc-crumb:nth-child(7) {
	top: 75%;
	left: 30%;
}
.fc-crumb:nth-child(8) {
	top: 90%;
	right: 35%;
}

/* Fortune */
.fc-fortune {
	color: black;
	display: flex;
	flex-direction: column;
	justify-content: center;
	text-align: center;
	width: 26em;
	height: 6em;
	left: 0;
	transform: scale(0,1);
	transform-origin: 50% 32%; 
}
.fc-fortune-text {
	font-size: 40px;
	 
}

/* Animation States */
.spawned {
	animation: popIn 0.3s linear;
}
.opened {
	width: 26em;
	height: 6em;
}
.opened .left {
	animation: breakLeft 0.7s ease-in forwards;
}
.opened .right {
	animation: breakRight 0.7s ease-in forwards;
}
.opened .fc-crumbs {
	animation: fallOut 0.7s ease-in forwards;
}
.opened .fc-fortune {
	/* animation: foldOut 0.7s ease-in forwards; */
	animation: fallOut 0.7s ease-in forwards;
}

/* Animations */
@keyframes popIn {
	from {
		transform: scale(0);
	}
	75% {
		transform: scale(1.1);
	}
	to {
		transform: scale(1);
	}
}
@keyframes breakLeft {
	from {
		transform: translateX(0) rotate(25deg);
	}
	30%, 40% {
		transform: translateX(0) rotate(55deg);
	}
	70%, 80% {
		opacity: 1;
		transform: translateX(-14em) rotate(50deg);
	}
	to {
		opacity: 1;
		transform: translateX(-14em) rotate(50deg);
	}
}
@keyframes breakRight {
	from {
		transform: translateX(0) rotate(-25deg);
	}
	30%, 40% {
		transform: translateX(0) rotate(-55deg);
	}
	70%, 80% {
		opacity: 1;
		transform: translateX(14em) rotate(-50deg);
	}
	to {
		opacity: 3;
		transform: translateX(14em) rotate(-50deg);
	}
}
@keyframes fallOut {
	from {
		left: calc(50% - 0.4em);
		width: 0.8em;
		transform: translateY(0);
	}
	30% {
		opacity: 1;
	}
	60%, to {
		opacity: 3;
		left: calc(50% - 3em);
		width: 6em;
		transform: translateY(24em);
	}
}
@keyframes foldOut {
	from {
		transform: scale(0.23,0.7);
	}
	30%, 40% {
		transform: scale(0.5,0.7);
	}
	69% {
		transform: scale(1,0.7);
	}
	74%, to {
		transform: scale(1,1);
	}
}


</style>

<script type="text/javascript">
addEventListener("load",app);
function app() {
	class Fortune {
		constructor(fortuneList) {
			this.text = !fortuneList ? "No fortune" : fortuneList[~~(Math.random() * fortuneList.length)];
			this.luckyNumbers = [];
			this.drawLuckyNumbers();
		}
		drawLuckyNumbers() {
			let maxDraws = 6,
				draws = maxDraws,
				maxNumber = 45,
				numberPool = [];

			
		}
	}

	var fcBtn = document.querySelector("button"),
		fortuneText = document.querySelector(".fc-fortune-text"),
		fortuneLuckyNumbers = document.querySelector(".fc-lucky-numbers span"),
		fortuneList = [
			"YES",
			"NO",
			"YES",
			"NO",
			"YES",
			"NO",
			"YES",
			"NO"
		],
		fortune = new Fortune(),

		getFortune = function(){
			fortune = new Fortune(fortuneList);
			fortuneText.innerHTML = fortune.text;
			fortuneLuckyNumbers.innerHTML = fortune.luckyNumbers.join(", ");
		},
		nextState = function(){
			let elClass = this.classList,
				spawned = "spawned",
				opened = "opened";

			// open cookie
			if (elClass.contains(spawned)) {
				elClass.remove(spawned);
				elClass.add(opened);

			// new cookie
			} else {
				elClass.remove(opened);
				elClass.add(spawned);
				getFortune();
			}
		};
	
	getFortune();
	fcBtn.addEventListener("click",nextState);
}
  </script>
</head>
<body>
<%@ include file="view/header.jsp" %>
<button class="fc spawned" type="button">
	<div class="fc-part left"></div>
	<div class="fc-part right"></div>
	<div class="fc-crumbs">
		<div class="fc-crumb"></div>
		<div class="fc-crumb"></div>
		<div class="fc-crumb"></div>
		<div class="fc-crumb"></div>
		<div class="fc-crumb"></div>
		<div class="fc-crumb"></div>
		<div class="fc-crumb"></div>
		<div class="fc-crumb"></div>
	</div>
	<div class="fc-fortune">
		<p class="fc-fortune-text">No fortune</p>
		<p class="fc-lucky-numbers"><span></span></p>
	</div>
</button>
<%@ include file="view/footer.jsp" %>
</body>
</html>