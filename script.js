let tasks = [];

function addTask() {
    const input = document.getElementById("taskInput");
    tasks.push(input.value);
    input.value = "";
    render();
}

function render() {
    const list = document.getElementById("taskList");
    list.innerHTML = "";
    tasks.forEach(task => {
        const li = document.createElement("li");
        li.innerText = task;
        list.appendChild(li);
    });
}
