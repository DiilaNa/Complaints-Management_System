$(document).ready(function () {
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
    if (urlParams.get('failed')==='true'){
        Swal.fire({
            icon: 'error',
            title: 'Login Failed',
            text: 'Something went wrong. Add Correct Credentials.',
        });
    }
});
function switchToSignup() {
    $('#loginForm').removeClass('active').fadeOut(200, function () {
        $('#signupForm').fadeIn(200).addClass('active');
    });
}

function switchToLogin() {
    $('#signupForm').removeClass('active').fadeOut(200, function () {
        $('#loginForm').fadeIn(200).addClass('active');
    });
}

function validateEmail(email) {
    const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
}

function validatePassword(password) {
    return password.length >= 6;
}

$(".toggle-password").click(function () {
    let input = $($(this).attr("toggle"));
    if (input.attr("type") === "password") {
        input.attr("type", "text");
        $(this).removeClass("fa-eye").addClass("fa-eye-slash");
    } else {
        input.attr("type", "password");
        $(this).removeClass("fa-eye-slash").addClass("fa-eye");
    }
});


