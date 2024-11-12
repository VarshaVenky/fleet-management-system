// Function to validate login form
function validateLoginForm() {
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();

    if (username === "" || password === "") {
        alert("Both username and password are required.");
        return false;
    }
    return true;
}

// Function to confirm actions (e.g., deleting a record)
function confirmAction(message) {
    return confirm(message || "Are you sure you want to proceed?");
}

// Toggle visibility of elements (useful for mobile or expanding sections)
function toggleVisibility(elementId) {
    const element = document.getElementById(elementId);
    if (element.style.display === "none" || element.style.display === "") {
        element.style.display = "block";
    } else {
        element.style.display = "none";
    }
}

// Event listener for dynamically loaded content (e.g., Admin Dashboard tabs)
document.addEventListener("DOMContentLoaded", function() {
    const tabs = document.querySelectorAll(".tab-link");
    tabs.forEach(tab => {
        tab.addEventListener("click", function(event) {
            event.preventDefault();
            openTab(event.target.dataset.tab);
        });
    });
});

// Function to handle tab switching
function openTab(tabName) {
    const tabContents = document.querySelectorAll(".tab-content");
    tabContents.forEach(content => content.style.display = "none");

    const targetTab = document.getElementById(tabName);
    if (targetTab) {
        targetTab.style.display = "block";
    }
}
