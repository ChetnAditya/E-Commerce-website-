// Select the video element
const video = document.getElementById("myVideo");

// Play video function
function playVideo() {
    video.play();
}

// Pause video function
function pauseVideo() {
    video.pause();
}

function reduceVideoSize() {
    const video = document.getElementById('videoFrame');
    video.style.width = '80px'; // Reduce width
    video.style.height = '200'; // Maintain aspect ratio
}


// Toggle animation on the video
function toggleAnimation() {
    if (video.style.animation) {
        video.style.animation = ""; // Remove animation
    } else {
        video.style.animation = "bounce 2s infinite"; // Add bounce animation
    }
}

// Bounce animation keyframes
const style = document.createElement("style");
style.textContent = `
@keyframes bounce {
    0%, 100% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-20px);
    }
}`;
document.head.appendChild(style);



// Register Form Validation
document.getElementById('registerForm')?.addEventListener('submit', function (e) {
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();

    if (username.length < 3) {
        alert("Username must be at least 3 characters long.");
        e.preventDefault();
    }
    if (password.length < 6) {
        alert("Password must be at least 6 characters long.");
        e.preventDefault();
    }
});

// Login Form Validation
document.getElementById('loginForm')?.addEventListener('submit', function (e) {
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();

    if (!username || !password) {
        alert("Both fields are required.");
        e.preventDefault();
    }
});
