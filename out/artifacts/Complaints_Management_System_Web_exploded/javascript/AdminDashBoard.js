function filterComplaints(status) {
    $("#complaintsTable tbody tr").each(function () {
        const rowStatus = $(this).data("status");
        if (status === "all" || rowStatus === status) {
            $(this).show();
        } else {
            $(this).hide();
        }
    });
    $(".tab").removeClass("active");
    $(`.tab`).filter(function () {
        return $(this).attr("onclick") === `filterComplaints('${status}')`;
    }).addClass("active");
}

function updateStatus(id, status) {
    $.post("updateStatus", { id: id, status: status }, function (response) {
        if (response.trim() === "success") {
            Swal.fire('Updated!', 'Complaint status updated.', 'success')
                .then(() => location.reload());
        } else {
            Swal.fire('Error!', 'Failed to update status.', 'error');
        }
    });
}
function deleteComplaint(id) {
    Swal.fire({
        title: 'Are you sure?',
        text: "You can't undo this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Yes, delete it!'
    }).then(result => {
        if (result.isConfirmed) {
            $.post("deleteComplaint", { id: id }, function (response) {
                if (response.trim() === "success") {
                    Swal.fire('Deleted!', 'Complaint has been deleted.', 'success')
                        .then(() => location.reload());
                } else {
                    Swal.fire('Error!', 'Failed to delete complaint.', 'error');
                }
            });
        }
    });
}


