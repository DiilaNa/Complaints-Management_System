$(document).ready(function () {

});

function filterComplaints(status) {
    document.querySelectorAll("#complaintsTable tbody tr").forEach(row => {
        const rowStatus = row.getAttribute("data-status");
        if (status === "all" || rowStatus === status) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });

    document.querySelectorAll(".tab").forEach(tab => tab.classList.remove("active"));
    document.querySelector(`.tab[onclick="filterComplaints('${status}')"]`).classList.add("active");
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

