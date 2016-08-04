function updateTime() {
    function sanitize(what) {
        if (what < 10) what = "0" + what;
        return what;
    }
    var date = new Date();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    var seconds = date.getSeconds();
    var don = "AM";
    if (hours > 12) {
        don = "PM";
        hours = hours - 12;
    }
    minutes = sanitize(minutes);
    seconds = sanitize(seconds);
    var space = " : ";
    var update = hours + space + minutes + space + seconds + " " + don;
    document.getElementById("time").innerText = update;
    var a = setTimeout(updateTime, 500);
}
updateTime();