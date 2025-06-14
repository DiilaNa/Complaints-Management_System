function switchToSignup() {
    $('#loginForm').removeClass('active').fadeOut(200, function () {
        $('#signupForm').fadeIn(200).addClass('active');
        currentForm = 'signup';
    });
}

function switchToLogin() {
    $('#signupForm').removeClass('active').fadeOut(200, function () {
        $('#loginForm').fadeIn(200).addClass('active');
        currentForm = 'login';
    });
}

function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function validatePassword(password) {
    return password.length >= 6;
}

$(document).ready(function () {
    let currentForm = 'login';

    $('#signupForm').submit(function (e) {
        const name = $('#signupName').val().trim();
        const email = $('#signupEmail').val();
        const password = $('#signupPassword').val();
        const confirmPassword = $('#confirmPassword').val();

        if (name.length < 2) {
            Swal.fire('Invalid Name', 'Please enter your full name', 'error');
            e.preventDefault();
            return;
        }

        if (!validateEmail(email)) {
            Swal.fire('Invalid Email', 'Please enter a valid email address', 'error');
            e.preventDefault();
            return;
        }

        if (!validatePassword(password)) {
            Swal.fire('Invalid Password', 'Password must be at least 6 characters long', 'error');
            e.preventDefault();
            return;
        }

        if (password !== confirmPassword) {
            Swal.fire('Password Mismatch', 'Passwords do not match', 'error');
            e.preventDefault();
            return;
        }
    });

    $('#loginForm').submit(function (e) {
        const email = $('#loginEmail').val();
        const password = $('#loginPassword').val();

        if (!validateEmail(email)) {
            Swal.fire('Invalid Email', 'Please enter a valid email address', 'error');
            e.preventDefault();
            return;
        }

        if (!validatePassword(password)) {
            Swal.fire('Invalid Password', 'Password must be at least 6 characters long', 'error');
            e.preventDefault();
            return;
        }

        Swal.fire({
            title: 'Signing in...',
            didOpen: () => Swal.showLoading(),
            timer: 800,
            showConfirmButton: false
        });

        e.preventDefault();
        setTimeout(() => {
            $('#loginForm')[0].submit();
        }, 800);
    });

    $('#switchToSignup').click(function (e) {
        e.preventDefault();
        switchToSignup();
    });

    $('#switchToLogin').click(function (e) {
        e.preventDefault();
        switchToLogin();
    });

    const urlParams = new URLSearchParams(window.location.search);

    if (urlParams.get('register') === 'success') {
        Swal.fire({
            icon: 'success',
            title: 'Registration Successful',
            text: 'You can now log in with your credentials.',
        });
        switchToLogin();
    }

    if (urlParams.get('error') === 'true') {
        Swal.fire({
            icon: 'error',
            title: 'Registration Failed',
            text: 'Something went wrong. Try a different email.',
        });
    }
});
