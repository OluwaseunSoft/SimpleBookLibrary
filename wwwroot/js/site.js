﻿// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.
$(document).ready(function () {

    // jQuery methods go here...

});

//$(document).ready(function () {
//    $("#submit").bind('click', function () {
//        var idiom = $("#add-category").val();
//        $.ajax({
//            type: "POST",
//            url: 'api/Categories',
//            data: { name: idiom },
//            async: true,
//            crossDomain: true,
//            beforeSend: function (request) {
//                request.withCredentials = false;
//            },
//            success: function (data, status, xhr) {
//                alert(xhr.getResponseHeader('Location'));
//            }
//        });

//    });
//});


const uri = 'api/books';
const categoriesUrl = 'api/Categories';
let todos = [];
let category = [];

function getItems() {
    fetch(uri)
        .then(response => response.json())
        .then(data => _displayItems(data))
        .catch(error => console.error('Unable to get items.', error));
}

function getCategories() {
    fetch('api/Categories')
        .then(response => response.json())
        .then(data => _displayCategory(data))
        .catch(error => console.error('Unable to get items.', error));
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


function deleteItem(id) {

    fetch(`${uri}/${id}`, {
        method: 'DELETE'
    })
        .then(() => getItems())
        .catch(error => console.error('Unable to delete item.', error));
}

function deleteCategory(id) {
    fetch(`${categoriesUrl}/${id}`, {
        method: 'DELETE'
    })
        .then(() => getCategories())
        .catch(error => console.error('Unable to delete item.', error));
}

function displayEditForm(id) {
    const item = todos.find(item => item.id === id);

    document.getElementById('edit-name').value = item.name;
    document.getElementById('edit-id').value = item.id;
    document.getElementById('edit-isComplete').checked = item.isComplete;
    document.getElementById('editForm').style.display = 'block';
}

function displayEditCategory(id) {
    const item = category.find(item => item.Id === id);

    document.getElementById('edit-name').value = item.Name;
    document.getElementById('edit-id').value = item.Id;
    document.getElementById('editForm').style.display = 'block';
}

function updateItem() {
    const itemId = document.getElementById('edit-id').value;
    const item = {
        id: parseInt(itemId, 10),
        isComplete: document.getElementById('edit-isComplete').checked,
        name: document.getElementById('edit-name').value.trim()
    };
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
        .catch(error => console.error('Unable to update item.', error));

    closeInput();

    return false;
}

function closeInput() {
    document.getElementById('editForm').style.display = 'none';
}

function _displayCount(itemCount) {
    const name = (itemCount === 1) ? ' Item' : ' Items';

    document.getElementById('counter').innerText = `${itemCount} ${name}`;
}

function _displayItems(data) {
    const tBody = document.getElementById('todos');
    tBody.innerHTML = '';

    _displayCount(data.length);

    const button = document.createElement('button');

    data.forEach(item => {
        let isCompleteCheckbox = document.createElement('input');
        isCompleteCheckbox.type = 'checkbox';
        isCompleteCheckbox.disabled = true;
        isCompleteCheckbox.checked = item.isComplete;

        let editButton = button.cloneNode(false);
        editButton.innerText = 'Edit';
        editButton.setAttribute('onclick', `displayEditForm(${item.id})`);

        let deleteButton = button.cloneNode(false);
        deleteButton.innerText = 'Delete';
        deleteButton.setAttribute('onclick', `deleteItem(${item.id})`);

        let tr = tBody.insertRow();

        let td1 = tr.insertCell(0);
        td1.appendChild(isCompleteCheckbox);

        let td2 = tr.insertCell(1);
        let textNode = document.createTextNode(item.name);
        td2.appendChild(textNode);

        let td3 = tr.insertCell(2);
        td3.appendChild(editButton);

        let td4 = tr.insertCell(3);
        td4.appendChild(deleteButton);
    });

    todos = data;
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

