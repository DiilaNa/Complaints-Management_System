$(document).ready(function () {
    if (resetStatus === "ok") {
        Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: 'Password has been reset successfully.'
        });
    } else if (errorStatus === "nomatch") {
        Swal.fire({
            icon: 'error',
            title: 'Password Mismatch',
            text: 'Passwords do not match.'
        });
    } else if (errorStatus === "notfound") {
        Swal.fire({
            icon: 'warning',
            title: 'Email Not Found',
            text: 'No account is registered with this email.'
        });
    } else if (errorStatus === "server") {
        Swal.fire({
            icon: 'error',
            title: 'Server Error',
            text: 'Something went wrong. Please try again later.'
        });
    }
    $('.toggle-password').on('click', function () {
        const targetId = $(this).data('target');
        const input = $('#' + targetId);
        const type = input.attr('type') === 'password' ? 'text' : 'password';
        input.attr('type', type);
        $(this).toggleClass('fa-eye fa-eye-slash');
    });
});

