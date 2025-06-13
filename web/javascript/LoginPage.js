$(document).ready(function () {
    let currentForm = 'login';

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

    // Event handlers for switching forms (assuming you have anchors or buttons with these IDs)
    $('#switchToSignup').click(function (e) {
        e.preventDefault();
        switchToSignup();
    });

    $('#switchToLogin').click(function (e) {
        e.preventDefault();
        switchToLogin();
    });

    // Login form submission
    $('#loginForm').submit(function (e) {
        e.preventDefault();

        const email = $('#loginEmail').val();
        const password = $('#loginPassword').val();

        if (!validateEmail(email)) {
            Swal.fire('Invalid Email', 'Please enter a valid email address', 'error');
            return;
        }

        if (!validatePassword(password)) {
            Swal.fire('Invalid Password', 'Password must be at least 6 characters long', 'error');
            return;
        }

        // Simulate login process
        Swal.fire({
            title: 'Signing in...',
            timer: 1500,
            didOpen: () => {
                Swal.showLoading();
            }
        }).then(() => {
            Swal.fire('Success', 'Welcome back! Login successful.', 'success');
            // Here you can submit the form to the server or redirect
            // this.submit(); // if you want to submit
        });
    });

    // Signup form submission
    $('#signupForm').submit(function (e) {
        e.preventDefault();

        const name = $('#signupName').val().trim();
        const email = $('#signupEmail').val();
        const password = $('#signupPassword').val();
        const confirmPassword = $('#confirmPassword').val();

        if (name.length < 2) {
            Swal.fire('Invalid Name', 'Please enter your full name', 'error');
            return;
        }

        if (!validateEmail(email)) {
            Swal.fire('Invalid Email', 'Please enter a valid email address', 'error');
            return;
        }

        if (!validatePassword(password)) {
            Swal.fire('Invalid Password', 'Password must be at least 6 characters long', 'error');
            return;
        }

        if (password !== confirmPassword) {
            Swal.fire('Password Mismatch', 'Passwords do not match', 'error');
            return;
        }

        // Simulate signup process
        Swal.fire({
            title: 'Creating account...',
            timer: 1500,
            didOpen: () => Swal.showLoading()
        }).then(() => {
            Swal.fire('Success', 'Account created successfully! Welcome aboard.', 'success');
            // Switch to login after delay
            setTimeout(() => {
                switchToLogin();
            }, 2000);
            // Here you can submit the form to the server or do actual signup
            // this.submit();
        });
    });
});
