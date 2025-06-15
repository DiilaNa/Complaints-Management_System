$(document).ready(function () {
    if (resetStatus === "success") {
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
});
