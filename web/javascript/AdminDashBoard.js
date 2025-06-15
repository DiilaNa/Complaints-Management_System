$(document).ready(function () {
    $.get("getAllComplaints", function (data) {
        let tbody = $('#complaintsTable tbody');
        tbody.empty();
        let total = 0, pending = 0, resolved = 0, rejected = 0;

        data.forEach(complaint => {
            total++;
            if (complaint.status === 'pending') pending++;
            else if (complaint.status === 'resolved') resolved++;
            else if (complaint.status === 'rejected') rejected++;

            tbody.append(`
                <tr data-id="${complaint.id}" data-status="${complaint.status}">
                <td>${complaint.user}</td>
                <td>${complaint.subject}</td>
                <td>${complaint.description}</td>
                <td>${complaint.date}</td>
                <td>
                <span class="status-badge status-${complaint.status}">${complaint.status.charAt(0).toUpperCase() + complaint.status.slice(1)}</span>
                </td>
                <td class="action-buttons">
                <button class="action-btn btn-view" onclick="viewComplaint('${complaint.id}')">👁️</button>
                ${getActionButtons(complaint.id, complaint.status)}
                        </td>
                </tr>
                `);
        });

        $('.total').text(total);
        $('.pending').text(pending);
        $('.resolved').text(resolved);
        $('.rejected').text(rejected);
    });
});

function getActionButtons(id, status) {
    let buttons = '';
    if (status === 'pending') {
        buttons += `
                <button class="action-btn btn-resolve" onclick="updateStatus('${id}', 'resolved')">✅</button>
                <button class="action-btn btn-reject" onclick="updateStatus('${id}', 'rejected')">❌</button>
            `;
    } else {
        buttons += `<button class="action-btn btn-reopen" onclick="updateStatus('${id}', 'pending')">🔄</button>`;
    }
    buttons += `<button class="action-btn btn-delete" onclick="deleteComplaint('${id}')">🗑️</button>`;
    return buttons;
}