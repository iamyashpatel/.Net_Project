function selectAllCheckbox(source) {
    var checkboxes = document.querySelectorAll('[id*=GridView1] input[id*=ChckBoxStatus]');

    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = source.checked;
    }
}
