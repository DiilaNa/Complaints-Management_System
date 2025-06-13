    let currentForm = 'login';

    function switchToSignup() {
    const loginForm = document.getElementById('loginForm');
    const signupForm = document.getElementById('signupForm');

    loginForm.classList.remove('active');
    setTimeout(() => {
    signupForm.classList.add('active');
    currentForm = 'signup';
}, 250);
}

    function switchToLogin() {
    const loginForm = document.getElementById('loginForm');
    const signupForm = document.getElementById('signupForm');

    signupForm.classList.remove('active');
    setTimeout(() => {
    loginForm.classList.add('active');
    currentForm = 'login';
}, 250);
}

    function showMessage(text, type = 'success') {
    const message = document.getElementById('message');
    message.textContent = text;
    message.className = `message ${type}`;
    message.classList.add('show');

    setTimeout(() => {
    message.classList.remove('show');
}, 3000);
}

    function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

    function validatePassword(password) {
    return password.length >= 6;
}

    // Handle login form submission
    document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const email = document.getElementById('loginEmail').value;
    const password = document.getElementById('loginPassword').value;

    if (!validateEmail(email)) {
    showMessage('Please enter a valid email address', 'error');
    return;
}

    if (!validatePassword(password)) {
    showMessage('Password must be at least 6 characters long', 'error');
    return;
}

    // Simulate login process
    showMessage('Signing in...', 'success');
    setTimeout(() => {
    showMessage('Welcome back! Login successful.', 'success');
}, 1500);
});

    // Handle signup form submission
    document.getElementById('signupForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const name = document.getElementById('signupName').value;
    const email = document.getElementById('signupEmail').value;
    const password = document.getElementById('signupPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;

    if (name.trim().length < 2) {
    showMessage('Please enter your full name', 'error');
    return;
}

    if (!validateEmail(email)) {
    showMessage('Please enter a valid email address', 'error');
    return;
}

    if (!validatePassword(password)) {
    showMessage('Password must be at least 6 characters long', 'error');
    return;
}

    if (password !== confirmPassword) {
    showMessage('Passwords do not match', 'error');
    return;
}

    // Simulate signup process
    showMessage('Creating account...', 'success');
    setTimeout(() => {
    showMessage('Account created successfully! Welcome aboard.', 'success');
    setTimeout(() => {
    switchToLogin();
}, 2000);
}, 1500);
});
