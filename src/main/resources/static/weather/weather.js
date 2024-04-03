const API_KEY = '3a21cb8314535119884a6ffbcd6218b2';

const tempSection = document.querySelector('.temperature');
const placeSection = document.querySelector('.place');
const descSection = document.querySelector('.description');
const iconSection = document.querySelector('.icon');

const success = (position) => {
	console.log(position);
	const latitude = position.coords.latitude;
	const longitude = position.coords.longitude;
	
	getWeather(latitude, longitude);
};

const getWeather = (lat, lon) => {
	
	
	
	fetch(`https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric&lang=kr`)
	.then((response) => {
		return response.json();
	})
	.then((json) => {
		console.log(json);
		
		const icon = json.weather[0].icon;
		const iconURL = `http://openweathermap.org/img/wn/${icon}@2x.png`;
		
		iconSection.setAttribute('src', iconURL);
		
		const temperature = json.main.temp;
		const place = json.name;
		const description = json.weather[0].description;
		
		tempSection.innerText = temperature;
		placeSection.innerText = place;
		descSection.innerText = description; // 'descSertion'를 'descSection'으로 수정
	})
	.catch((error) => {
		alert(error);
	});
	
}

const fail = () => {
	alert("좌표를 받아올수 없음");
}





const button = document.querySelector('.button');

button.addEventListener('click', () => {
	navigator.geolocation.getCurrentPosition(success, fail);
});


document.addEventListener("DOMContentLoaded", function() {
    const bannerContainer = document.getElementById('banner-container');
    const toggleBtn = document.getElementById('toggle-btn');
    const bannerContent = document.getElementById('banner-content');

    toggleBtn.addEventListener('click', function() {
        if (bannerContainer.style.left === '0px') {
            bannerContainer.style.left = '-300px'; // 닫기
            toggleBtn.style.left = '0'; // 버튼 위치 초기화
        } else {
            bannerContainer.style.left = '0px'; // 열기
            toggleBtn.style.left = bannerContent.offsetWidth + 'px'; // 버튼을 배너 내용의 너비만큼 이동
        }
    });
});


