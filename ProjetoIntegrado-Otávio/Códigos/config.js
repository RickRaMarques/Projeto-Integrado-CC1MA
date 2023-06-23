function toggleswitch1() {
    var switchValue = document.getElementById("mySwitch").checked;
    var body = document.body;
    var switchLabels = document.getElementsByClassName("opcao");
    var sections = document.getElementsByClassName("box");

    if (switchValue) {
      body.style.backgroundColor = "black";
      for (var i = 0; i < switchLabels.length; i++) {
        switchLabels[i].style.color = "white";
      }
      for (var i = 0; i < sections.length; i++) {
        sections[i].classList.add("dark");
      }
    } else {
      body.style.backgroundColor = "white";
      for (var i = 0; i < switchLabels.length; i++) {
        switchLabels[i].style.color = "black";
      }
      for (var i = 0; i < sections.length; i++) {
        sections[i].classList.remove("dark");
      }
    }
  }

  function changeSection(option) {
    var sections = document.getElementsByClassName("box");
    for (var i = 0; i < sections.length; i++) {
      sections[i].style.display = "none";
    }
    document.getElementById(option).style.display = "block";
  }

  function toggleSwitch() {
    var switchValue = document.getElementById("mySwitch").checked;
    var theme = switchValue ? "dark" : "light";
    localStorage.setItem("theme", theme);
    toggleTheme();
  }