
const calendarDays = document.querySelectorAll(".calendar_days"),
    calendarTitle = document.querySelector(".title"),
    leftButton = document.querySelector(".left_button"),
    rightButton = document.querySelector(".right_button"),
    calendar = document.querySelector(".calendar");
    // dateUpdate = document.querySelector(".date_update");

class Calendar {
    constructor(year, month) {
        this.today = new Date(year, month);
        this.year = this.today.getFullYear(),
            this.month = this.today.getMonth(),
            this.date = this.today.getDate(),
            this.day = this.today.getDay()
    }


    getFirstDay() {
        const firstDate = new Date(this.year, this.month);
        return firstDate.getDay();
    }

    getLastDay() {
        let wholeDays = [];
        if ((this.year % 4 === 0 && this.year % 100 !== 0) || (this.year % 400 === 0)) {
            wholeDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        } else {
            wholeDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
        }
        return wholeDays[this.month];
    }

    fillCalendar() {
        this.initCalendar();
        calendarTitle.innerHTML = `${this.year}년 ${this.month + 1}월`
        const firstDay = this.getFirstDay();
        const lastDay = this.getLastDay();
        let day = 1;
        for (let i = firstDay; i < calendarDays.length; i++) {
            if (day <= lastDay) {
                calendarDays[i].innerHTML = `<button class = "day_button">${day}</button>`;
                day++;
            }

        }
    }

    initCalendar() {
        calendarDays.forEach((e) => {
            e.innerHTML = "";
        });
    }


    drawCalendar() {
        let change = 0;
        const today = new Date();
        let calendarInstance = new Calendar(today.getFullYear(), today.getMonth() + change);

        calendarInstance.fillCalendar();

        leftButton.addEventListener("click", (e) => {
            e.stopPropagation();
            change--;
            calendarInstance = new Calendar(today.getFullYear(), today.getMonth() + change);
            calendarInstance.fillCalendar();
            this.updateCalendarStyle();
        });
        rightButton.addEventListener("click", (e) => {
            e.stopPropagation();
            change++;
            calendarInstance = new Calendar(today.getFullYear(), today.getMonth() + change);
            calendarInstance.fillCalendar();
            this.updateCalendarStyle();
        });
    }


    updateCalendarStyle() {
        const dayButtons = document.querySelectorAll(".day_button");
        let firstSelectedDay = 0;
        let lastSelectedDay = 0;
        let clickCount = 0;

        // 달력 스타일 초기화
        dayButtons.forEach((element) => {
            element.classList.remove("day_selected");
            element.parentNode.classList.remove("gray"); // 회색 배경 제거
        })


  // 달력 날짜들에 클릭 이벤트 추가
    dayButtons.forEach((element) => {
        element.addEventListener("click", (event) => {
            event.target.classList.toggle("day_selected");

            clickCount++;

            // 선택 일자 타입 변환
            const selectedDay = Number(event.target.textContent);
            if (firstSelectedDay === 0) {
                firstSelectedDay = selectedDay;
            } else {
                lastSelectedDay = selectedDay;
            }

            // 클릭 횟수가 2회일 때만 처리
            if (clickCount === 2) {
                // 선택 일자 사이에 회색 배경 적용
                dayButtons.forEach((e) => {
                    const day = Number(e.innerText);
                    if (day >= firstSelectedDay && day <= lastSelectedDay) {
                        e.parentNode.classList.add("gray");
                    }
                });

                // campres_checkin과 campres_checkout 값 초기화
                document.querySelector("[name='campres_checkin']").value = "";
                document.querySelector("[name='campres_checkout']").value = "";
            } else if (clickCount > 2) {
                // 클릭 횟수가 2회를 초과하면 초기화
                dayButtons.forEach((e) => {
                    e.classList.remove("day_selected");
                    e.parentNode.classList.remove("gray");
                });
                clickCount = 0;
                firstSelectedDay = 0;
                lastSelectedDay = 0;

                // campres_checkin과 campres_checkout 값 초기화
                document.querySelector("[name='campres_checkin']").value = "";
                document.querySelector("[name='campres_checkout']").value = "";
            }
        });
    });

    // 달력 날짜들에 호버링 이벤트 추가
    dayButtons.forEach((element) => {
        element.addEventListener("mouseenter", (event) => {
            event.target.classList.add("day_hover")
        });
        element.addEventListener("mouseleave", (event) => {
            event.target.classList.remove("day_hover")
        });
    });
}

    handleEvents() {
        this.drawCalendar();
        this.updateCalendarStyle();
    }

}


const cal = new Calendar();
cal.handleEvents();

document.addEventListener("DOMContentLoaded", function() {
	
	const checkInDateCell = document.querySelector("#check_in_date");
    
    const checkOutDateCell = document.querySelector("#check_out_date");
    
    var a = null;
    var b = null;

    const dayButtons = document.querySelectorAll(".calendar_days button");
    let firstSelectedDay = null;
    let lastSelectedDay = null;

    dayButtons.forEach(function(button) {
        button.addEventListener("click", function() {
            const selectedDay = parseInt(button.textContent);

            if (!firstSelectedDay) {
			    // 첫 번째 클릭: 입실일 선택
			    firstSelectedDay = selectedDay;
			    const year = new Date().getFullYear(); // 현재 년도 가져오기
			    const month = new Date().getMonth() + 1; // 현재 월 가져오기 (0부터 시작하므로 1을 더해줌)
			    a = `${year}-${month}-${selectedDay}`;
			    
			} else if (!lastSelectedDay && selectedDay > firstSelectedDay) {
			    // 두 번째 클릭: 퇴실일 선택 (입실일 이후 날짜여야 함)
			    lastSelectedDay = selectedDay;
			    const year = new Date().getFullYear(); // 현재 년도 가져오기
			    const month = new Date().getMonth() + 1; // 현재 월 가져오기 (0부터 시작하므로 1을 더해줌)
			    b = `${year}-${month}-${selectedDay}`;
			} else {
                // 잘못된 선택이거나 이미 선택된 날짜를 다시 클릭한 경우
                firstSelectedDay = null;
                lastSelectedDay = null;
                checkInDateCell.value = "";
                checkOutDateCell.value = "";
            }
			  checkInDateCell.value = a;
			  checkOutDateCell.value = b ;
        });
    });
});



