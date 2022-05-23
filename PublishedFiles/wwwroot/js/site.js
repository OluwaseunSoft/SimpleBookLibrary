// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

$(document).ready(function () {

    $.ajax({
        type: "GET",
        url: categoriesUrl,
        data: "{}",
        success: function (data) {
            var s = '<option value="-1"> Please select a Category </option>';
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].Id + '">' + data[i].Name + '</option>';
            }
            $("#categoryDropDownII").html(s);
        }
    });

});

const uri = 'api/books';
const categoriesUrl = 'api/Categories';
let category = [];

function getCategories() {
    fetch('api/Categories')
        .then(response => response.json())
        .then(data => _displayCategory(data))
        .catch(error => console.error('Unable to get categories.', error));
}

function addItem() {
    const addNameTextbox = document.getElementById('add-category');

    const item = {
        name: addNameTextbox.value.trim()
    };

    fetch(categoriesUrl, {
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*'
        },
        body: JSON.stringify(item),

    })
        .then(response => response.json())
        .then(() => {
            getCategories();
            addNameTextbox.value = '';
        })
        .catch(error => console.error('Unable to add category.', error));
}

function deleteCategory(id) {
    fetch(`${categoriesUrl}/${id}`, {
        method: 'DELETE'
    })
        .then(() => getCategories())
        .catch(error => console.error('Unable to delete category.', error));
}


function displayEditCategory(id) {
    const item = category.find(item => item.Id === id);

    document.getElementById('edit-name').value = item.Name;
    document.getElementById('edit-id').value = item.Id;
    document.getElementById('editForm').style.display = 'block';
}

function updateCategory() {
    const itemId = document.getElementById('edit-id').value;
    const item = {
        id: parseInt(itemId, 10),
        name: document.getElementById('edit-name').value.trim()
    };

    fetch(`${categoriesUrl}/${itemId}`, {
        method: 'PUT',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(item)
    })
        .then(() => getCategories())
        .catch(error => console.error('Unable to update category.', error));

    closeInput();

    return false;
}

function closeInput() {
    document.getElementById('editForm').style.display = 'none';
}

function _displayCount(itemCount) {
    const name = (itemCount === 1) ? ' Category' : ' Categories';

    document.getElementById('counter').innerText = `${itemCount} ${name}`;
}


function _displayCategory(data) {
    const tBody = document.getElementById('categoryTable');
    tBody.innerHTML = '';

    _displayCount(data.length);

    const button = document.createElement('button');

    data.forEach(item => {

        let editButton = button.cloneNode(false);
        editButton.innerText = 'Edit';
        editButton.setAttribute('onclick', `displayEditCategory(${item.Id})`);

        let deleteButton = button.cloneNode(false);
        deleteButton.innerText = 'Delete';
        deleteButton.setAttribute('onclick', `deleteCategory(${item.Id})`);

        let tr = tBody.insertRow();

        let td1 = tr.insertCell(0);
        let textNodeId = document.createTextNode(item.Id);
        td1.appendChild(textNodeId);

        let td2 = tr.insertCell(1);
        let textNode = document.createTextNode(item.Name);
        td2.appendChild(textNode);

        let td3 = tr.insertCell(2);
        td3.appendChild(editButton);

        let td4 = tr.insertCell(3);
        td4.appendChild(deleteButton);
    });

    category = data;
}

